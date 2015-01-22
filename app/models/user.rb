class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name
  field :username
  field :email
  field :password_digest

  has_and_belongs_to_many :books

  embeds_many :lists
  embeds_one :current

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true


  validates :password, confirmation: true
end
