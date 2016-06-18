class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :lockable, :confirmable

  has_one :wallet
  has_many :media, foreign_key: 'author_id'

  validates_presence_of :first_name, :last_name, :wallet

  validates :admin, single_admin: true

  def name
    "#{first_name} #{last_name}"
  end
end
