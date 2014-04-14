require 'sinatra'

get "/error" do
	"Error"
end

get "/Error" do
	redirect "/error"
end

get "/to_dos" do
	@to_dos = ToDo.to_dos
	erb :"to_dos/index"
end

post "/to_dos" do
	text = params[:description]
	if ToDo.add_to_do(text)
		redirect "/to_dos"
	else
		redirect "/Error"
	end
end

class ToDo
	@@to_dos = ["Feed dog", "Do laundry"]

	def initialize
	end

	def self.to_dos
		@@to_dos
	end

	def self.add_to_do(to_do)
		if to_do == "Cry"
			return false
		else
			@@to_dos.push(to_do)
			# @@to_dos << to_do
		end
	end

end