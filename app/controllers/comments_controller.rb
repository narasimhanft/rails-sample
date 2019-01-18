class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @comment = current_post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"

      # CmctupdateJob.perform_later current_post
      NotifierJob.perform_later(current_post.user,current_user)

      redirect_to request.referrer || root_url
    else
      @comments = []
      redirect_to request.referrer || root_url
    end
  end


  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  def show
  end
  private

    def comment_params
      params.require(:comment).permit(:content, :micropost_id, :user_id )
    end

    def current_post
      Micropost.find_by(id: params[:comment][:micropost_id])
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])

      if @comment.nil?
        flash[:danger] = "You cannot delete the comment"
        redirect_to root_url
      end
    end
end
