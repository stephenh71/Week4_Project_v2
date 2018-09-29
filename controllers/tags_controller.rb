require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tags' do
  @total_budget = Tag.total_budget()
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:"tags/new")
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb ( :"tags/show" )
end

get '/tags/:id/edit' do
    @tag = Tag.find(params['id'])
    erb(:"tags/edit")
end

post '/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete()
  redirect to "/tags"
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update()
  redirect to "/tags"
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  erb (:"tags/create")
end
