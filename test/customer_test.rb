require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'
require 'pry'

class CustomerTest < Minitest::Test
  def setup
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
  end

  def test_it_exists
    assert_instance_of Customer, @joel
  end

  def test_attributes
    assert_equal "Joel", @joel.name
    assert_equal 2, @joel.id
    assert_equal [], @joel.pets
  end

  def test_adopt
    @joel.adopt(@samson)
    @joel.adopt(@lucy)

    assert_equal [@samson, @lucy], @joel.pets
  end

  def test_outstanding_balance
    assert_equal 0, @joel.outstanding_balance

    @joel.charge(15)
    @joel.charge(7)

    assert_equal 22, @joel.outstanding_balance
  end
end
