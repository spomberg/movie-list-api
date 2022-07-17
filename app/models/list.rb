class List
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :movies, type: Array
  field :is_public, type: Boolean
  field :created_on, type: Date
  belongs_to :user
end
