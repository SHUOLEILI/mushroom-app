class Music
  include Mongoid::Document

  field :email, type:String
  field :url, type:String
  field :name, type:String

end
