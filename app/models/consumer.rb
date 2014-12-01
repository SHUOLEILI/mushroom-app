class Consumer
  include Mongoid::Document

  field :email, type:String
  field :username, type:String
  field :password, type:String
  field :name, type: String
  field :geneder, type: String
  field :age, type: String
  
end
