class Play < ActiveRecord::Base
    mount_uploaders :pictures, ImageUploader
    mount_uploader :profile_image, ImageUploader
    
    serialize :pictures
    
    has_many :works_on
    has_many :users, :through => :works_on
    
    
    validates :title, presence: true
    validates :description, presence: true
    validates :date_of_play, presence: true
    #validates :profile_image, presence: true #not working, causes nil class errors...
end
