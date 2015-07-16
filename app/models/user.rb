class User < ActiveRecord::Base
    mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  has_many :works_on
  has_many :plays,:through => :works_on
    
    def simple_to_s
        return  "#{first_name} #{last_name}, graduates #{graduation_year}"
    end
end

