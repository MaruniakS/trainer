class ProgramType < ActiveRecord::Base
  has_many :training_programs
  validates :name, presence: true
end
