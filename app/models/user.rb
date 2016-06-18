class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates_presence_of :first_name, :last_name

  validates :admin, presence: true, single_admin: true

  def name
    "#{first_name} #{last_name}"
  end
end
