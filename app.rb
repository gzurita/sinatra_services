require 'sinatra'
require 'data_mapper'
require 'dm-serializer/to_json'
require 'haml'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'mysql://admin:Wefl2632@localhost/test')

class Order
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String
  property :state,  Integer
end 

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  haml :index	
end

get '/api/orders' do
  Order.all.to_json
end


get '/api/orders/:id' do
    order = Order.get(params[:id])
    if order.nil?
      halt 404
    end
    order.to_json
end

post '/api/orders' do
  

end