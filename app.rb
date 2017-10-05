require("bundler/setup")
require ("pry")
require ("csv")
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

if ProductImage.all.empty?
  CSV.foreach('product_images.csv', { headers: true, :header_converters => :symbol }) do |row|
    new_image = ProductImage.new(row.to_h)
    new_image.save
  end
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
  if params[:type] == "ASC"
    @category_products = category.products.order(:name)
  elsif params[:type] == "DES"
    @category_products = category.products.order('name DESC')
  end
  erb(:category_page)
end

get("/product/:id") do
  @category_list = Category.all()
  @product = Product.find(params[:id])
  @images = ProductImage.find_by(product_id: @product.id)
  erb(:product)
end

get("/add_item/cart/:id") do
  if session['user']
    @user = User.find(session['user'].id)
    item_exist = CartItem.find_by(product_id: params[:id])
    if item_exist == nil
      @cart_item = CartItem.create(user_id: @user.id, product_id: params[:id], quantity: 1)
    else
      CartItem.update(item_exist.id, :quantity=> item_exist.quantity+1)
    end
    redirect '/'
  else
    redirect 'login'
  end
end


post('/create_account') do
  session['error'] = nil
  new_user = User.new({name: params['name'], username: params['username'], password: params['password'], email: params['email']})
  new_user.save
  new_cart = CartItem.new({ user_id: new_user.id })
  new_cart.save

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
#
  if user
    session['user'] = user
    redirect "/"
  else
    @category_list = Category.all()
    erb(:error)
  end
end

get('/cart/:order') do
  order = params[:order]
   @total_price = 0
   @product = []
   @msg = ""
   @user = User.find(session['user'].id)
   item_exist = CartItem.find_by(user_id: session['user'].id)
   if item_exist == nil
     @msg = "Currently the are no items in your cart."
   else
     @cart_item= CartItem.where(user_id: @user.id)
     @cart_item.each do |item|
       product_obj = Product.find(item.product_id)
       product_obj.quantity = item.quantity
       @product.push(product_obj)
     end
   end
   if order == 'false'
     erb(:cart)
   else
     @order = Order.create({user_id: @user.id, status: "Order Placed"})
     @product.each do |item|
       total = item.list_price * item.quantity
       OrderItem.create({order_id: @order.id, product_id: item.id, price: total, quantity: item.quantity})
     end
      CartItem.where(user_id: session['user'].id).delete_all
      redirect '/'
   end
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


get('/rating/:id') do
  id = params[:id].to_i;
  @product  = Product.find(id)
  if @product.reviews.length != 0
      @total = @product.reviews.length
  else
    @average_rating = 0
    @percentage_5star = 0
    @percentage_4star = 0
    @percentage_3star = 0
    @percentage_2star = 0
    @percentage_1star = 0
    @total = 0
  end
  erb(:rating)
end

post('/review/add/:id') do

  @product = Product.find(params[:id])
  rating = params.fetch('rating')
  review = params.fetch('input-review')
  user.id = session['user'].id
  Review.create(:product_id => params[:id], :user_id => user.id, :rating => rating, :comment => comment)
  erb(:rating)
end

get('/product_detail/:id') do
  @product = Product.find(params[:id])
  @product_image = ProductImage.where(product_id: @product.id)
  erb(:product_detail)
end

delete("/delete_from/cart/:id") do
#
  cart_item = CartItem.find_by(user_id: session['user'].id)
  cart_item.delete
  redirect back
end

post("/checkout/confirm/:product") do

  @product = parmas[:product]
  @user = User.find(session['user'].id)
  @cart_item= CartItem.where(user_id: @user.id)
  @order = Order.create({user_id: @user.id, status: "Order Placed"})
  @product.each do |item|
    total = item.list_price * item.quantity
    OrderItem.create({order_id: @order.id, product_id: item.id, price: total, quantity: item.quantity})
  end
  CartItem.where("user_id = session['user'].id").delete_all
  erb(:order_detail)
end

get("/order_history") do
  @user = User.find(session['user'].id)
  @orders = Order.where(user_id: @user.id)
  @order_history = []
  @orders.each do |order|
    items = OrderItem.where(order_id: order.id)
    items.each do |item|
      product = Product.find(item.product_id)
      image = ProductImage.find_by(product_id: item.product_id)
      order_items = {:url =>  image.url, :product_name => product.name, :quantity =>item.quantity}
      @order_history.push(order_items)
    end
  end

  erb(:order_history)
end
