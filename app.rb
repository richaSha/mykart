require("bundler/setup")
require ("pry")
Bundler.require(:default)
include BCrypt
enable :sessions
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


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
