module Shop
  class Item
    attr_reader :id, :product_id
    attr_accessor :quantity

    @@id = 0

    def initialize(product_id:, quantity:)
      @id = set_id
      @product_id = product_id
      @quantity = quantity
    end

    def find_product
      FindProduct.new.call(product_id)
      #przywołaj produkty znalezione poprzez service
      #FindProduct (po ID z tablicy PRODUCTS)

    def total_price
      product = find_product
      product.price * quantity
    end

    private
    def set_id
      @@id += 1
    end
  end
end
