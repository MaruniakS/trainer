class AddAttachmentImageToMuscleGroups < ActiveRecord::Migration
  def self.up
    change_table :muscle_groups do |t|
      t.attachment :muscle_group_image
    end
  end

  def self.down
    remove_attachment :muscle_groups, :muscle_group_image
  end
end
