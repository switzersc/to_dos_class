require 'sinatra'
require "sinatra/activerecord"

set :database, "sqlite3:///to_do_class_app.db"

get "/error" do
	"Error"
end

get "/Error" do
	redirect "/error"
end

get "/to_dos" do
	@to_dos = ToDo.all
	erb :"to_dos/index"
end

get "/to_dos/new" do
	@new_to_do = ToDo.new
	erb :"to_dos/new"
end

post "/to_dos" do
	@to_do = ToDo.new(params[:to_do])
	if @to_do.meet_criteria?
		@to_do.save
		redirect "/to_dos/#{@to_do.id}"
	else
		redirect "/Error"
	end
end

put "/to_dos/:id" do
	@to_do = ToDo.find(params[:id])
	if @to_do.update_attributes(params[:to_do])
		redirect "/to_dos/#{@to_do.id}"
	else
		redirect "/Error"
	end
end

get "/to_dos/:id/edit" do
	@to_do = ToDo.find(params[:id])
	erb :"to_dos/edit"
end

get "/to_dos/:id" do
	@to_do = ToDo.find(params[:id])
	erb :"to_dos/show"
end


class ToDo < ActiveRecord::Base
	def meet_criteria?
		## validations
	end
end