class Current
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :pages_read, type: Float
  field :pages, type: Float
  field :completed, type: Mongoid::Boolean

  embedded_in :user
end
