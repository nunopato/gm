class Gadget < ActiveRecord::Base
  belongs_to :user  
  has_many :gadget_images
end