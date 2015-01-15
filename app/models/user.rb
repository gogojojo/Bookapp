class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name
  field :username
  field :email
  field :age
  field :gender
  field :password_digest
  has_and_belongs_to_many :books

  has_secure_password

  validates :email, uniqueness: true

  validates :password, confirmation: true
  
end
