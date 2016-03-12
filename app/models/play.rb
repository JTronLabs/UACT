class Play < ActiveRecord::Base
    mount_uploaders :pictures, ImageUploader
    mount_uploader :profile_image, ImageUploader

    serialize :pictures

    has_many :works_on
    has_many :users, :through => :works_on


    validates :title, presence: true
    validates :description, presence: true
    validates :date_of_play, presence: true
    validates :profile_image, presence: true

    before_save :format_data

    def format_data

      #convert user-supplied youtube video url to embedded url
      if link_to_video.present? and link_to_video.include?("youtube.com")

        #check if the url is already the correct embedded URL
        if link_to_video.include?("youtube.com/embed/")
          self.link_to_video = link_to_video
        else
          #find youtube video ID by parsing "https://www.youtube.com/watch?v=ID_VALUE" string
          video_id = link_to_video.split('v=')[1]
          ampersandPosition = video_id.index('&')
          if ampersandPosition != nil
            video_id = video_id.substring(0..ampersandPosition)
          end

          self.link_to_video = "https://www.youtube.com/embed/#{video_id}"
        end
      end

    end
end
