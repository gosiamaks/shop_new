Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new('t-shirt', 5),
    Product.new('dress', 10),
    Product.new('skirt', 12),
    Product.new('jeans', 7),
    Product.new('hoodie', 20)
  ]

end
