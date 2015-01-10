class Book
  include Mongoid::Document
  field :title
  field :Pages
  has_and_belongs_to_many :users
  belongs_to :author
end
