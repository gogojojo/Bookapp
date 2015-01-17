class Current
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :pages_read, type: String
  field :pages, type: String
  field :completed, type: Mongoid::Boolean

  embedded_in :user
end
