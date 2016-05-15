class AddAttachmentProgramImageToTrainingPrograms < ActiveRecord::Migration
  def self.up
    change_table :training_programs do |t|
      t.attachment :program_image
    end
  end

  def self.down
    remove_attachment :training_programs, :program_image
  end
end
