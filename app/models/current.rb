class Current
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :pages_read, type: Float
  field :pages, type: Float
  field :completed, type: Mongoid::Boolean

  embedded_in :user

  validates :title, presence: true
  validates :author, presence: true
  validates :pages_read, presence: true
  validates :pages, presence: true

end
