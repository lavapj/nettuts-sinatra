require 'rubygems'
require 'sinatra'

get '/' do
	"What's up, World!"
end

get '/about' do
	"Hi I'm Patti! Nice to meet you :)"
end

get '/hello/:name' do
	"Hello #{params[:name].upcase}!"
end

##### You can set the route to accept multiple query string variables

get '/dog/:name/:color' do
	"Is your name #{params[:name]}? Is your color #{params[:color]}?"
end

### Include retrieve wildcard query strings, known as a ‘splat’

get '/more/*' do
	params[:splat]
end

### Load the form.erb ERB file from a views/ directory

get '/form' do
	erb :form
end

### This route is for the POST method, not GET. Also, all POST variables are available in the same params array as GET variables

post '/form' do
	"You said '#{params[:message]}'"
end

### "Secret" Form

get '/secret' do
	erb :secret
end

post '/secret' do
	params[:secret].reverse
end

get '/decrypt/:secret' do
	params[:secret].reverse
end

get '/*' do
	status 404
	'not found'
end

not_found do
	halt 404, 'page not found'
end
