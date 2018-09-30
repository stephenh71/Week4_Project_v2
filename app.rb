require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')

get '/' do
  @total_spend = Transaction.total_spend()
  @total_budget = Tag.total_budget()
  @remaining = @total_budget - @total_spend
  erb( :index )
end
