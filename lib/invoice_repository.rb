require 'time'
require 'csv'
require_relative './invoice'
require_relative './repository'

class InvoiceRepository < Repository

  def convert_to_object(row)
    row = Invoice.new({id: row[:id],
                    customer_id: row[:customer_id],
                    merchant_id: row[:merchant_id],
                    status: row[:status],
                    created_at: row[:created_at],
                    updated_at: row[:updated_at]
                   }, self)
  end

  def find_all_by_status(status)
    @all.find_all do |invoice|
     invoice.status.downcase == status
    end
  end

  def create(attributes)
    attributes[:id] = new_highest_id
    @all << Invoice.new(attributes, self)
  end

  def update(id, attributes)
    if find_by_id(id) != nil && check_status_is_valid(attributes)
      new_status = attributes[:status]
      update_invoice = all.find { |invoice| invoice.id == id }
      update_invoice.status = new_status
      update_invoice.updated_at = Time.now
    end
  end

  def check_status_is_valid(attributes)
   if attributes.class == Hash
      statuses = [:pending, :returned, :shipped, :sold, :success]
      status = attributes[:status]
      statuses.include?(status)
    end
  end
end
