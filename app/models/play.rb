class Play < ActiveRecord::Base
    mount_uploaders :pictures, ImageUploader
    mount_uploader :profile_image, ImageUploader
    
    serialize :pictures
    
    has_many :works_on
    has_many :users, through: :works_on, :foreign_key => 'user_id'
end
