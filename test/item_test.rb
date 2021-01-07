require_relative './test_helper'
require './lib/item'
require 'time'
require 'bigdecimal'
require 'pry'


class ItemTest < Minitest::Test
  def test_it_exists_and_has_attributes
    item = Item.new({
                :id          => 1,
                :name        => "Pencil",
                :description => "You can use it to write things",
                :unit_price  => BigDecimal.new(10.99,4),
                :created_at  => Time.now,
                :updated_at  => Time.now,
                :merchant_id => 2
                }, 0)
 
    item_test_created_at = item.created_at.strftime("%d/%m/%Y")
    item_test_updated_at = item.updated_at.strftime("%d/%m/%Y")
    assert_instance_of Item, item
    assert_equal 1, item.id
    assert_equal "Pencil", item.name
    assert_equal "You can use it to write things", item.description
    assert_equal BigDecimal.new(10.99, 4), item.unit_price
    assert_equal Time.now.strftime("%d/%m/%Y"), item_test_created_at
    assert_equal Time.now.strftime("%d/%m/%Y"), item.created_at.strftime("%d/%m/%Y")
    assert_equal 2, item.merchant_id
  end
  
end
