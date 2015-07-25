class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    
    def simple_to_s
        return  "#{first_name} #{last_name}, graduates #{graduation_year}"
    end
end

