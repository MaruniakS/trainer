class Exercise < ActiveRecord::Base
  belongs_to :muscle_group
  has_many :exercise_descriptions, dependent: :destroy
  validates :name, :muscle_group_id, presence: true
  validates :name, uniqueness: true

  has_attached_file :image,
                    :path => ':rails_root/public/system/:attachment/:id/:basename_:style.:extension',
                    :url => '/system/:attachment/:id/:basename_:style.:extension',
                    :default_url => '/images/no-image.jpg'
  validates_attachment :image,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  # Scopes
  scope :by_group, ->(group) {where(muscle_group_id: group)}
end
