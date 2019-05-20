require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'
require './lib/day_care'
require './lib/groomer'
require 'pry'

class GroomerTest < Minitest::Test
  def setup
    @groomer = Groomer.new("Joe's Groomer")
    @joel = Customer.new("Joel", 2)
    @joe = Customer.new("Joe", 3)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
  end

  def test_it_exists
    assert_instance_of Groomer, @groomer
  end

  def test_attributes
    assert_equal "Joe's Groomer", @groomer.name
    assert_equal [], @groomer.customers
  end

  def test_add_customer
    @groomer.add_customer(@joel)
    @groomer.add_customer(@joe)

    assert_equal [@joel, @joe], @groomer.customers
  end

  def test_customers_w_balances
    @groomer.add_customer(@joel)
    @groomer.add_customer(@joe)

    assert_equal [], @groomer.customers_w_balances

    @joel.charge(10)
    @joe.charge(5)

    assert_equal [@joel, @joe], @groomer.customers_w_balances
  end

  def test_count_pets_by_type
    assert_equal 0, @groomer.count_pets(:cat)

    @groomer.add_customer(@joe)
    @joe.adopt(@lucy)

    assert_equal 1, @groomer.count_pets(:cat)
  end

  def test_add_charge
    expected = {}
    assert_equal expected, @groomer.charges

    @groomer.add_customer(@joe)
    @joe.adopt(@lucy)
    @groomer.add_charge(@joe, "Washing", @lucy, 15)

    expected = {@joe => [["Washing", @lucy, 15]]}
    assert_equal expected, @groomer.charges
  end
end
