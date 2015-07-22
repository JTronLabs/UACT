class Event < ActiveRecord::Base
    
    validates :title, presence: true
    validates :description, presence: true
    validates :date_and_time_of_event, presence: true
end
