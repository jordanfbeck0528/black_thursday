require 'csv'
require 'bigdecimal'
require 'time'
require_relative './customer'
require_relative './repository'

class CustomerRepository < Repository

  def convert_to_object(row)
    row = Customer.new({id: row[:id].to_i,
                    first_name: row[:first_name],
                    last_name: row[:last_name],
                    created_at: row[:created_at],
                    updated_at: row[:updated_at]
                   }, self)
  end

  def find_all_by_first_name(name)
    @all.find_all do |customer|
      customer.first_name.downcase.include?(name.downcase.strip)
    end
  end

  def find_all_by_last_name(name)
    @all.find_all do |customer|
      customer.last_name.downcase.include?(name.downcase.strip)
    end
  end

  def create(attributes)
    attributes[:id] = new_highest_id
    @all << Customer.new(attributes, self)
  end

  def update(id, attributes)
    if find_by_id(id) != nil
      update_customer = all.find { |customer| customer.id == id }
      update_customer.first_name = attributes[:first_name] if attributes[:first_name] != nil
      update_customer.last_name = attributes[:last_name] if attributes[:last_name] != nil
      update_customer.updated_at = Time.now
    end
  end
end
