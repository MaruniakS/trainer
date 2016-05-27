class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.references :user, index: true
      t.date :date
      t.integer :height
      t.integer :weight
      t.float :neck
      t.float :shoulders
      t.float :chest
      t.float :biceps
      t.float :forearm
      t.float :waist
      t.float :hip
      t.float :thigh
      t.float :calf

      t.timestamps null: false
    end
    add_foreign_key :parameters, :users
  end
end
