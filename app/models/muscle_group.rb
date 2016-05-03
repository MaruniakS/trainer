class MuscleGroup < ActiveRecord::Base
  has_attached_file :image,
                    :path => ':rails_root/public/system/:attachment/:id/:basename_:style.:extension',
                    :url => '/system/:attachment/:id/:basename_:style.:extension',
                    :styles => {
                        :thumb    => ['100x100#',  :jpg, :quality => 70]
                    },
                    :convert_options => {
                        :thumb    => '-set colorspace sRGB -strip'
                    }
  validates_attachment :image,
                       :presence => true,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
