class User
  require "securerandom"

  has_secure_password

  validates :email, presence: true
  validates :password, presence: true
  validates :usernamen, presence: true, uniqueness: true

  include Mongoid::Document
  field :_id, type: String
  field :username, type: String
  field :email, type: String
  field :password, type: String
  has_many :lists
end
