class AssignmentSet < ActiveRecord::Base
  attr_accessible :name, :next_set_id, :alias
  has_many :assignments

  belongs_to :next_set
end
