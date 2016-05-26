class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :user, index: true
      t.references :training_day, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :users
    add_foreign_key :events, :training_days
  end
end
