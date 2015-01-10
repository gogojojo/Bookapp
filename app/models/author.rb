class Author
  include Mongoid::Document
  field :birthday
  field :quote
  has_many :books
end
