class DayCare
  attr_reader :name, :customers

  def initialize(name, prices)
    @name = name
    @prices = prices
    @customers = {}
  end

  def add_customer(customer)
    @customers[customer.id] = customer
  end

  def list_unfed_pets
    @customers.values.map do |customer|
      customer.pets.find_all { |pet| !pet.fed? }
    end.flatten
  end

  def feed_all_pets
    @customers.values.map do |customer|
      customer.pets.each do |pet|
        pet.feed
        customer.charge(@prices[pet.type])
      end
    end
  end
end
