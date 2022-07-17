class User
  include Mongoid::Document
  field :_id, type: String
  field :username, type: String
  field :email, type: String
  field :password, type: String
  has_many :lists
end
