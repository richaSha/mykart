require("bundler/setup")
require ("pry")
Bundler.require(:default)
include BCrypt
enable :sessions
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

categories = []
File.open('category.txt', 'r') do |file|
  while file_line = file.gets
    categories.push(file_line.delete("\n"))
  end
end
categories = categories.sort
categories.each do |category|
  new_category = Category.new({name: category})
  new_category.save
end

# admin = User.create({name: "admin", username: "admin", email: "email@yahoo.com", password: "password", admin: true})
# admin.save

get ('/') do
  @seprate_cataegory = true;
  @category_list = Category.all()
  @Beauty_Health = Category.find_by(name: 'Beauty & Health')
  @Books_Audible = Category.find_by(name: 'Books & Audible')
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
  @products = Product.all
  erb(:products)
end

get("/category/:id") do
  @id = params[:id].to_i
  @seprate_cataegory = true;
  category = Category.find(@id)
  @category_list = Category.all()
  @category_products = category.products
  erb(:category_page)
end

get('/category/sort/:id/:type') do
  @id = params[:id].to_i
  @seprate_cataegory = true;
  category = Category.find(@id)
  @category_list = Category.all()
  binding.pry
  if params[:type] == "ASC"
    @category_products = category.products.order(:name)
  elsif params[:type] == "DES"
    binding.pry
    @category_products = category.products.order('name DESC')
  end
  erb(:category_page)
end

get("/product/:id") do
  @category_list = Category.all()
  @product = Product.find(params[:id])
  erb(:product)
end

get("/add_item/cart/:id") do
  @user = User.find(session['user'].id)
  @cart = Cart.find(@user.cart_id)
  @product = Product.find(params[:id])
  @cart.update({product_id: @product.id})
  binding.pry
  erb(:cart)
end
#
# post("/add_item/cart/:id") do
#   item = Item.find(params[:id])
#   item.update({cart_id: session['user'].cart})
#   binding.pry
# end

post('/create_account') do
  session['error'] = nil
  new_user = User.new({name: params['name'], username: params['username'], password: params['password'], email: params['email']})
  new_user.save
  new_cart = Cart.new({ user_id: new_user.id })
  new_cart.save
  new_user.update({cart_id: new_cart.id})

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
end

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

post('/add_product') do
  session['error'] = nil
  category = Category.find(params['category-id'])
  new_product = Product.new({
    name: params['name'],
    category_id: category.id,
    description: params['description'],
    quantity: params['quantity'],
    list_price: params['list-price'],
    sale_price: params['sale-price']})

  if new_product.save
    redirect 'products'
  else
    session['error'] = new_product
    redirect 'products'
  end
end

post("/add_product/image/:id") do
  product = Product.find(params[:id])
  new_image = ProductImage.create({product_id: product.id, url: params['product-image']})
  redirect "product/#{product.id}"
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

get '/product/:id' do
  @product = Product.find(pramas.fetch('id').to_i)

  erb :product
end

post '/product/:id' do
  if session['user']
    @quantity = params['quantity']
    @item = Item.create({quantity: @quantity})
    @item.products.push(@product)
    redirect '/gp/:id'
  else
  redirect '/login'
  end
end

get '/gp/:id' do
  @product = Product.find(params.fetch('id').to_i)

end

delete("/delete_from/cart/:id") do

  cart = Cart.find(params[:id])
  binding.pry
  cart.update({product_id: nil})
  redirect back
end
