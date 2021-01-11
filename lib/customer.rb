require_relative './time_store_module'
require 'time'
require 'bigdecimal'

class Customer
  include TimeStoreable

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id = data[:id]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = time_store(data[:created_at]).strftime("%d/%m/%Y")
    @updated_at = time_store(data[:updated_at]).strftime("%d/%m/%Y")
    @repository = repository
  end

end