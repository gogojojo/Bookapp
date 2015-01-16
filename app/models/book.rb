class Book
  include Mongoid::Document
  field :title
  field :pages
  has_and_belongs_to_many :users
  belongs_to :author
end
