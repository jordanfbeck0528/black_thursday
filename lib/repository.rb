require 'csv'

class Repository
  attr_reader :all,
              :engine

  def initialize(file_path, engine)
    @all = []
    @engine = engine
    create_repo_objects(file_path)
  end

  def create_repo_objects(file_path)
    rows = CSV.foreach(file_path, headers: true, header_converters: :symbol)
    @all = rows.map { |row| convert_to_object(row) }
  end

  def find_by_id(id)
    @all.find do |instance|
      instance.id == id
    end
  end

  def find_by_name(name)
    @all.find do |instance|
      instance.name.downcase == name.downcase.strip
    end
  end

  def find_all_by_name(name)
    @all.find_all do |instance|
      instance.name.downcase.include?(name.downcase.strip)
    end
  end

  def find_all_by_merchant_id(merchant_id)
    @all.find_all do |instance|
      instance.merchant_id == merchant_id
    end
  end

  def find_all_by_customer_id(id)
    @all.find_all do |instance|
     instance.customer_id == id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    @all.find_all do |instance|
      instance.invoice_id == invoice_id
    end
  end

  def new_highest_id
    all.max_by do |instance|
      instance.id
    end.id + 1
  end

  def delete(id)
    remove = find_by_id(id)
    @all.delete(remove)
  end

  def inspect
    "<#{self.class} #{@all.size} rows>"
  end
end
