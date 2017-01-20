require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :guess => guess}

end

def check_guess(guess)
  if guess > SECRET_NUMBER
    message = "Too high!"
  elsif guess < SECRET_NUMBER
    message = "Way too low!"
  else guess == SECRET_NUMBER
    message = "#{SECRET_NUMBER}"
  end
end
