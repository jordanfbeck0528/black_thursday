require 'csv'
require 'pry'
require_relative './time_store_module'

class Merchant
  include TimeStoreable

  attr_reader :id,
              :created_at,
              :repository

  attr_accessor :name,
                :updated_at

  def initialize(data, repository)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = time_store(data[:created_at])
    @updated_at = time_store(data[:updated_at])
    @repository = repository
  end

end
