require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new('t-shirt', 5),
    Product.new('dress', 10),
    Product.new('skirt', 12),
    Product.new('jeans', 7),
    Product.new('hoodie', 20),
    Product.new('jacket', 16)
  ]

  WAREHOUSE = []
  BASKET = []

  class App < Sinatra::Base
    configure :test do
      set :dump_errors, false
    end

    get "/" do
      erb :"home"
    end

    get "/products" do
      products = FetchProducts.new.call
      erb :"products/index", locals: { products: products, title: "Products" }
    end

    get "/products/:id" do |id|
      product = FindProduct.new.call(id)
      halt 404 unless product
      erb :"products/show", locals: { product: product }
    end

    get "/warehouse" do
      items = FetchWarehouseItems.new.call
      erb :"warehouse/index", locals: { items: items, title: "Warehouse" }
    end

    get "/basket" do
      basket = FetchBasketItems.new.call
      sum_price = basket.map{|x| x[:total_price]}.reduce(:+)
      erb :"basket/show", locals: { basket: basket, sum_price: sum_price }
    end

    post "/basket" do
      begin
        AddItemToBasket.new(params).call
        redirect "/basket"
      rescue KeyError
        halt 422
      end
    end

    get "/payment" do
      erb :"basket/payment"
    end
  end
end
