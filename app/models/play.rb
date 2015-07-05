class Play < ActiveRecord::Base
    mount_uploaders :pictures, ImageUploader
    mount_uploader :profile_image, ImageUploader
    
    serialize :pictures
end
