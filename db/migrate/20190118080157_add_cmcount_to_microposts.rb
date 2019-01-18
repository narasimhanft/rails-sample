class AddCmcountToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :cmcount, :integer
  end
end
