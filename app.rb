require("bundler/setup")
require ("pry")
Bundler.require(:default)
include BCrypt
enable :sessions
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get ('/') do
  # id = session[:current_user_id]
  erb(:login)
end

get('login') do

  erb(:login)
end

get('/new-account') do
  erb(:new_account)
end









post ('/') do

  email_add = params.fetch("email")
  user_password = params.fetch("password")
  user = User.find_by(email: email_add)
  if user
    password = Password.new(user.password)
    if password == user_password

      session[:current_user_id] = user.id

      redirect to('/')

    else
      erb(:error)
    end
  else
    erb(:error)
  end

end

get ('/cart') do
  session = params[:session]

  id = session[:current_user_id]

  erb(:index)
end
