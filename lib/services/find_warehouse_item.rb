module Shop
  class FindWarehouseItem
    def call(warehouse_item_id)
      WAREHOUSE.find do |warehouse_item|
        warehouse_item.id == warehouse_item_id
      end
    end
  end
end
