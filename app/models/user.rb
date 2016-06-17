class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates_presence_of :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end
end
