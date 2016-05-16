class TrainingProgram < ActiveRecord::Base
  include Filterable
  belongs_to :program_type
  belongs_to :user
  belongs_to :template, class_name: 'TrainingProgram'
  has_many :templates, class_name: 'TrainingProgram', foreign_key: :template_id
  [:first_day, :second_day, :third_day, :fourth_day, :fifth_day, :sixth_day, :seventh_day].each do |day|
    belongs_to day,  class_name: 'TrainingDay'
  end
  enum body_type: ['Ектоморф', 'Мезоморф', 'Ендоморф']

  has_attached_file :program_image,
                    :path => ':rails_root/public/system/:attachment/:id/:basename_:style.:extension',
                    :url => '/system/:attachment/:id/:basename_:style.:extension',
                    :default_url => '/images/no-image.jpg'
  validates_attachment :program_image,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  # Scopes
  scope :body_type, -> (body_type) { where body_type: body_type }
  scope :male_type, -> (male_type) { where male_type: male_type }
  scope :program_type, -> (program_type) {  where program_type: program_type}


  def training_days
    ids = [first_day_id, second_day_id, third_day_id, fourth_day_id, fifth_day_id, sixth_day_id, seventh_day_id]
    TrainingDay.where(id: ids)
  end

  def clone(user)
    program = self.dup
    program.user = user
    program.template = self
    program.save
  end
end