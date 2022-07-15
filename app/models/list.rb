class List
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :movies, type: Array
  belongs_to :user
end
