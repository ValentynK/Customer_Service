class CreateAppeals < ActiveRecord::Migration
  def change
    create_table :appeals do |t|
      t.string :name
      t.string :email
      t.string :issue_type
      t.string :title
      t.text :text
      t.string :status, default: 'Order'
      t.string :section, default: 'Billing'

      t.timestamps null: false
    end
  end
end
