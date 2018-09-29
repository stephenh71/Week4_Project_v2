require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb ( :"transactions/show" )
end

get '/transactions/:id/edit' do
    @merchants = Merchant.all
    @tags = Tag.all
    @transaction = Transaction.find(params['id'])
    erb(:"transactions/edit")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb (:"transactions/create")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update()
  redirect to "/transactions"
end

post '/transactions/:id/delete' do
  @merchants = Merchant.all
  @tags = Tag.all
  transaction = Transaction.find(params['id'])
  transaction.delete()
  redirect to "/transactions"
end
