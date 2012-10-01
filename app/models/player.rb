class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :recoverable, :validatable, :database_authenticatable,
  devise :omniauthable, :registerable #,  :confirmable # :rememberable, :trackable,

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :email, :presence => true, :uniqueness => true

  def self.new_with_session(params, session)
    super.tap do |player|
      player.provider = session['devise.github_data'].provider
      player.uid = session['devise.github_data'].uid
    end
  end
end
