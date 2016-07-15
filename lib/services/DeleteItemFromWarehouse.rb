require_relative './FindWarehouseItem'

module Shop
  class DeleteItemFromWarehouse
    def call(item_id)
      warehouse_item = FindWarehouseItem.new.call(item_id)

      return unless warehouse_item

      reduce_warehouse_quantity(warehouse_item)
    end

    private
    def reduce_warehouse_quantity(warehouse_item)
      if warehouse_item.quantity > 1 #jeśli >1 to odejmij 1
        warehouse_item.quantity -= 1
      else
        WAREHOUSE.delete(warehouse_item)
      end
    end
  end
end
