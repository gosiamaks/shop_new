Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new('t-shirt', 5),
    Product.new('dress', 10),
    Product.new('skirt', 12),
    Product.new('jeans', 7),
    Product.new('hoodie', 20)
  ]

  WAREHOUSE = []
  BASKET = []

  class App <Sinatra::Base
    configure :test do
      set :dump_errors, false
    end

    get "/" do
      products = FetchProducts.new.call
    end

    get "/warehouse" do
      products = FetchWarehouseItems.new.call
    end

    get "/products/:id" do |id|
      product = FindProduct.new.call(id)
    end

  end
end
