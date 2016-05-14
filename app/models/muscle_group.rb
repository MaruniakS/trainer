class MuscleGroup < ActiveRecord::Base
  has_many :exercises
  has_attached_file :muscle_group_image,
                    :path => ':rails_root/public/system/:attachment/:id/:basename_:style.:extension',
                    :url => '/system/:attachment/:id/:basename_:style.:extension',
                    :default_url => '/images/no-image.jpg'
  validates_attachment :muscle_group_image,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
