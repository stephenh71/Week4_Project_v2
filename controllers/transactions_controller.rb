require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/transactions/current_month' do
  @current_month_name = Date::MONTHNAMES[Date.today.month]
  @month_spend = Transaction.current_month_spend()
  @total_budget = Tag.total_budget()
  @month_transactions = Transaction.current_month()
  @transactions = Transaction.all()
  erb(:"transactions/current_month")
end

get '/transactions/selected_month' do
  @months =["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  @total_budget = Tag.total_budget()
  @transactions = Transaction.all()
  erb(:"transactions/selected_month")
end

get '/transactions' do
  @total_spend = Transaction.total_spend()
  @total_budget = Tag.total_budget()
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
  @total_spend = Transaction.total_spend()
  @total_budget = Tag.total_budget()
  @transaction = Transaction.new(params)
  @revised_spend = @total_spend + @transaction.amount
  @now_remaining = @total_budget - @revised_spend
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
