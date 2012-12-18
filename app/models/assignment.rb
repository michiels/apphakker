class Assignment < ActiveRecord::Base
  belongs_to :assignment_set
  attr_accessible :name, :ruby_class

  delegate :unlocked?, :to => :validator

  def validator
    @validator ||= ruby_class.constantize.new()
  end
end
