class Groomer
  attr_reader :name, :customers, :charges

  def initialize(name)
    @name = name
    @customers = []
    @charges = {}
  end

  def add_customer(customer)
    @customers << customer
  end

  def customers_w_balances
    @customers.find_all { |customer| customer.outstanding_balance > 0 }
  end

  def count_pets(type)
    tot = 0
    @customers.each do |customer|
      customer.pets.each { |pet| tot += 1}
    end
    tot
  end

  def add_charge(customer, service, pet, amount)
    customer.charge(amount)
    @charges[customer] ||= []
    @charges[customer] << [service,pet,amount]
  end
end
