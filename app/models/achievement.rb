class Achievement < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :player
end
