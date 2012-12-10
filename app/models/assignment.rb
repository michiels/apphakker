class Assignment < ActiveRecord::Base
  attr_accessible :name, :ruby_class

  delegate :unlocked?, :to => :validator

  def validator
    @validator ||= ruby_class.constantize.new()
  end
end
