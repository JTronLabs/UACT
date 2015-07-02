class Play < ActiveRecord::Base
    has_many    :play_photos, :dependent => :destroy
end
