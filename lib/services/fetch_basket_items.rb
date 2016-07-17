module Shop
  class FetchBasketItems
    def call
      BASKET.map do |basket_item|
        {
          product: basket_item.find_product,
          quantity: basket_item.quantity,
          total_price: basket_item.total_price
        }
      end
    end
  end
end
