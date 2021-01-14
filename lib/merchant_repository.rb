require 'csv'
require 'time'
require_relative './merchant'
require_relative './repository'

class MerchantRepository < Repository

  def convert_to_object(row)
    row = Merchant.new({id: row[:id],
                        name: row[:name],
                        created_at: row[:created_at],
                        updated_at: row[:updated_at]},
                        self)
  end

  def create(attributes)
    attributes[:id] = new_highest_id
    merchant = Merchant.new(attributes, self)
    @all << merchant
    merchant
  end

  def update(id, attributes)
    if find_by_id(id) != nil
      update_merchant = all.find { |merchant| merchant.id == id }
      update_merchant.name = attributes[:name]
      update_merchant.updated_at = Time.now
    end
  end
end
