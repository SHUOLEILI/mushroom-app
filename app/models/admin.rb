class Admin
  include Mongoid::Document

  field :email, type:String
  field :password, type:String

end