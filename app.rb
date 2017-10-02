require("bundler/setup")
require ("pry")
Bundler.require(:default)
include BCrypt
enable :sessions
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get ('/') do

  binding.pry
  id = session[:current_user_id]
  erb(:login)
end

post ('/') do
  binding.pry
  email_add = params.fetch("email")
  user_password = params.fetch("password")
  user = User.find_by(email: email_add)
  if user
    password = Password.new(user.password)
    if password == user_password
      binding.pry
      session[:current_user_id] = user.id
      binding.pry
      redirect to('/')
      binding.pry
    else
      erb(:error)
    end
  else
    erb(:error)
  end

end

get ('/cart') do
  session = params[:session]
  binding.pry
  id = session[:current_user_id]

  erb(:index)
end
