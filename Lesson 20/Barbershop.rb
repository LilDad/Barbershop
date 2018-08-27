require 'sinatra'

get '/' do
	erb :index
end

post '/' do
	@username = params[:username]
	@phone = params[:phone]
	@date_time = params[:date_time]

	@title = 'Thank you!'
	@message = "Dear #{@username}, we'll be waiting for you at #{@date_time}"


	f = File.open ".public/users.txt", "r"
	output = File.open "users.txt", "w"
	output.write "User: #{@username}, phone: #{@phone}, date: #{@date_time}" 
	output.close	

	erb :message
end

get '/adminpanel' do
	erb :adminpanel   	
end

post '/adminpanel' do
	@login = params[:login]
	@password = params[:password]
	
	if @login == "admin" && @password == "123qwerty"
	@userlist = File.open "users.txt", "r"

	erb :userlist
  
	else
  	@title = 'Access denied!'
  	@message = 'Wrong login/password.'
	
	erb :message
	end
end