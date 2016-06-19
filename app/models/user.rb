class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :lockable, :confirmable

  def self.admin
    User.find_by(admin: true)
  end

  has_one :wallet, validate: true
  has_one :library, validate: true
  has_many :media, foreign_key: 'author_id', validate: true

  validates_presence_of :first_name, :last_name, :wallet

  validates :admin, single_admin: true

  def name
    "#{first_name} #{last_name}"
  end
end
