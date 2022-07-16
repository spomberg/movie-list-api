class List
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :movies, type: Array
  field :is_public, type: Boolean
  belongs_to :user
end
