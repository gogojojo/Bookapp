class User
  include Mongoid::Document
  field :name
  embeds_one :profile
  has_and_belongs_to_many :books
end
