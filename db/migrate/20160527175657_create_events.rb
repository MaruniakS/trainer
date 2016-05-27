class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :day
      t.time :time
      t.boolean :email
      t.boolean :sms
      t.boolean :sent
      t.references :training_day, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :training_days
    add_foreign_key :events, :users
  end
end
