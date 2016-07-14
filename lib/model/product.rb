module Shop
  class Product
    attr_reader :id, :name, :price

    @@id = 0

    def initialize(name:, price:)
      @id = next_id
      @name = name
      @price = price
    end

    def next_id
      @@id +=1
    end
  end
end
