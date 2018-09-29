require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tags' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get '/merchants/new' do
  erb(:"merchants/new")
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb ( :"merchants/show" )
end

get '/merchants/:id/edit' do
    @merchant = Merchant.find(params['id'])
    erb(:"merchants/edit")
end

post '/merchants/:id/delete' do
  merchant = Merchant.find(params['id'])
  merchant.delete()
  redirect to "/merchants"
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update()
  redirect to "/merchants"
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb (:"merchants/create")
end
