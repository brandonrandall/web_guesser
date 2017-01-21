require 'sinatra'
require 'sinatra/reloader'
require 'pry'


SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i unless params["guess"] == nil
  # in other words...
  # if !params["guess"]
  #   guess = nil
  # else
  #   guess = params["guess"].to_i
  # end

  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :guess => guess}
end

def check_guess(guess)
  analyze(guess)
end

def analyze(guess)
  if !guess
    message = "Enter a guess"
  elsif guess > SECRET_NUMBER + 5
    message = "Way too high!"
  elsif guess == SECRET_NUMBER + 5
    message = "Too high"
  elsif guess == SECRET_NUMBER + 4
    message = "Too high"
  elsif guess == SECRET_NUMBER + 3
    message = "Too high"
  elsif guess == SECRET_NUMBER + 2
    message = "Too high"
  elsif guess == SECRET_NUMBER + 1
    message = "Too high"
  elsif guess == SECRET_NUMBER - 1
    message = "Too low"
  elsif guess == SECRET_NUMBER - 2
    message = "Too low"
  elsif guess == SECRET_NUMBER - 3
    message = "Too low"
  elsif guess == SECRET_NUMBER - 4
    message = "Too low"
  elsif guess == SECRET_NUMBER - 5
    message = "Too low"
  elsif guess < SECRET_NUMBER - 5
    message = "Way too low!"
  else guess == SECRET_NUMBER
    message = "#{SECRET_NUMBER}"
  end
end
