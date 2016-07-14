module Shop
  class FindProduct
    def call(product_id)
      return unless product_id
      PRODUCTS.find do|poduct|
        product.id == product_id.to_i
      end
    end
  end
end
