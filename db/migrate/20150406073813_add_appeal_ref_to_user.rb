class AddAppealRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :appeal, index: true
    add_foreign_key :users, :appeals
  end
end
