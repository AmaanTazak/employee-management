class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.string :department
      t.decimal :salary
      t.date :hired_on

      t.timestamps
    end
  end
end
