class User
  include Mongoid::Document

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true

  validates_uniqueness_of :email, :username

  field :_id, type: String
  field :username, type: String
  field :email, type: String
  field :password, type: String
  has_many :lists
end
