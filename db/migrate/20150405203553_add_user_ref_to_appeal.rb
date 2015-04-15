class AddUserRefToAppeal < ActiveRecord::Migration
  def change
    add_reference :appeals, :user, index: true
    add_foreign_key :appeals, :users
  end
end
