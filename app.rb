require("bundler/setup")
require ("pry")
Bundler.require(:default)
include BCrypt
enable :sessions
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

admin = User.create({name: "admin", username: "admin", email: "email@yahoo.com", password: "password", admin: true})
admin.save

get ('/') do
  @category_list = Category.all()
  erb(:index)
end

# get ('/') do
#   # id = session[:current_user_id]
#   erb(:login)
# end

get('/login') do
  @category_list = Category.all()
  erb(:login)
end

get('/new_account') do
  @category_list = Category.all()
  erb(:new_account)
end

get('/logout') do
  session.clear
  redirect "/"
end

get('/admin_page') do
  @category_list = Category.all()
  erb(:admin)
end

post('/create_account') do
  session['error'] = nil
  new_user = User.new({name: params['name'], username: params['username'], password: params['password'], email: params['email']})
  if new_user.save
    redirect 'login'
  else
    session['error'] = new_user
    redirect 'new_account'
  end
end

post('/login') do
  email = params['email']
  password = params['password']
  user = User.find_by(email: email, password: password)

  if user
    session['user'] = user
    redirect "/"
  else
    @category_list = Category.all()
    erb(:error)
  end
end
