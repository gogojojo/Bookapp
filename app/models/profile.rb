class Profile
  include Mongoid::Document
  field :username
  field :name
  field :email
  field :age
  field :gender
  embedded_in :user 
end
