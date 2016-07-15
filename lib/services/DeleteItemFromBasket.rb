require_relative './FetchBasketItems'

module Shop
  class DeleteItemFromBasket
    def call(item_id)
      basket_item = FindBasketItem.new.call(item_id)

      return unless basket_item

      reduce_basket_quantity(basket_item)
    end

    private
    def reduce_basket_quantity(basket_item)
      if basket_item.quantity > 1
        basket_item.quantity -= 1
      else
        BASKET.delete(basket_item)
      end
    end
  end
end
