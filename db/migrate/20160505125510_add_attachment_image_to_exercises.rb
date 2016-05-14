class AddAttachmentImageToExercises < ActiveRecord::Migration
  def self.up
    change_table :exercises do |t|
      t.attachment :exercise_image
    end
  end

  def self.down
    remove_attachment :exercises, :exercise_image
  end
end
