#app.rb
require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
	get '/' do
    erb :"index#{ rand(3) + 1 }"
	end
	get '/holiday' do
		time=Time.now
    @holidays = HolidApi.get(country: 'US', year: time.year, month: time.month)
    @holidays2 = HolidApi.get(country: 'US', year: 1988, month: 3)
	  erb :holiday, :layout => :layoutsingle
	end
end
