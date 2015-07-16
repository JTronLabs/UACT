class WorksOn < ActiveRecord::Base
    belongs_to :user, :foreign_key => 'user_id'
    belongs_to :play, :foreign_key => 'play_id'
end
