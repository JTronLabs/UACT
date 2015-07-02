class PlayPhoto < ActiveRecord::Base
	belongs_to	:play
	validates 	:play, presence: true
    mount_uploader :image, ImageUploader # Photo uploader using carrierwave
end
