class User
  include Mongoid::Document
  field :name
  field :username
  field :password
  field :email
  field :age
  field :gender

  has_and_belongs_to_many :books
end
