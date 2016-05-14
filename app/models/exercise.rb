class Exercise < ActiveRecord::Base
  belongs_to :muscle_group
  has_many :exercise_descriptions, dependent: :destroy
  has_many :training_day_exercises
  has_many :training_days, through: :training_day_exercises
  validates :name, :muscle_group_id, presence: true
  validates :name, uniqueness: true

  has_attached_file :exercise_image,
                    :path => ':rails_root/public/system/:attachment/:id/:basename_:style.:extension',
                    :url => '/system/:attachment/:id/:basename_:style.:extension',
                    :default_url => '/images/no-image.jpg'
  validates_attachment :exercise_image,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  # Scopes
  scope :by_group, ->(group) {where(muscle_group_id: group)}

  def steps(text)
    steps = text.sentences
    steps.each_with_index do |step, index|
      ExerciseDescription.create(step: step, order: index+1, exercise: self)
    end
  end

  def analogs
    exercises = []
    analogs = ExerciseAnalog.where('exercise_id= (?) OR analog_id= (?)', self, self)
    if analogs
      analogs.each do |analog|
        exercise = analog.exercise_id == self.id ? Exercise.find(analog.analog_id) : Exercise.find(analog.exercise_id)
        exercises << exercise
      end
    end
    exercises
  end
end
