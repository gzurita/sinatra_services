
class Order
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String
  property :state,  Integer
end 