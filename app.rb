require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook'

set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  csv_file = File.join(__dir__, 'recipes.csv')
  cookbook = Cookbook.new(csv_file)
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  @name = gets.chomp
  @description = gets.chomp
  @recipe = Recipe.new(name, description)
  erb :index
end
