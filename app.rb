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

get('/categories') do
  @category_list = Category.all()
  erb(:categories)
end

get('/products') do
  @category_list = Category.all()
  erb(:products)
end

get("/category/:id") do
  @category = Category.find(params[:id])
  erb(:category)
end

post('/create_account') do
  session['error'] = nil
  new_user = User.new({name: params['name'], username: params['username'], password: params['password'], email: params['email'], admin: false})
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

get('/cart') do
  @seprate_cataegory = false;
  erb(:cart)

post("/add_category") do
  session['error'] = nil
  new_category = Category.new({name: params['category-name']})
  if new_category.save
    redirect 'categories'
  else
    session['error'] = new_category
    redirect 'categories'
  end
end

patch("/update/category/:id") do
  category = Category.find(params[:id])
  category.update({name: params['new-name']})
  redirect "/category/#{category.id}"
end

delete("/delete/category/:id") do
  category = Category.find(params[:id])
  Category.where(id: category.id).destroy_all
  redirect 'categories'

end
