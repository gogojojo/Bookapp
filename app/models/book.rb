class Book
  include Mongoid::Document
  field :title
  field :pages
  field :author
  
  has_and_belongs_to_many :users
  
  validates :title, presence: true
  validates :pages, presence: true
  validates :author, presence: true
end
