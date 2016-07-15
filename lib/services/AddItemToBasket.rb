module Shop
  class AddItemToBasket
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      BASKET << Item.new(
        product_id: @product_id,
        quantity: @quantity
      )
    end
  end
end
