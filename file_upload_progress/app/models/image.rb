class Image < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100#" }
                    
  validates_attachment_presence :photo
end
