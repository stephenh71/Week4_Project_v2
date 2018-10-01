require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')

get '/' do
  @month_spend = Transaction.current_month_spend()
  @total_budget = Tag.total_budget()
  @remaining = @total_budget - @month_spend
  @tags = Tag.all()
  @transactions = Transaction.all()
  @month_transactions = Transaction.current_month()
  erb( :index )
end
