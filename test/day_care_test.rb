require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'
require './lib/day_care'
require 'pry'

class DayCareTest < Minitest::Test
  def setup
    prices = {:dog => 10, :cat => 7}
    @day_care = DayCare.new("Joe's Daycare", prices)
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
  end

  def test_it_exists
    assert_instance_of DayCare, @day_care
  end

  def test_attributes
    assert_equal "Joe's Daycare", @day_care.name
    expected = {}
    assert_equal expected, @day_care.customers

    @day_care.add_customer(@joel)
    expected = {2 => @joel}
    assert_equal expected, @day_care.customers
  end

  def test_list_unfed_pets
    @day_care.add_customer(@joel)
    @joel.adopt(@samson)
    @joel.adopt(@lucy)

    assert_equal [@samson, @lucy], @day_care.list_unfed_pets

    @samson.feed
    @lucy.feed

    assert_equal [], @day_care.list_unfed_pets
  end

  def test_feed_pets
    @day_care.add_customer(@joel)
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @day_care.feed_all_pets

    assert_equal [], @day_care.list_unfed_pets
  end
end
