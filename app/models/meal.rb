require_relative 'base_record'

class Meal < BaseRecord
  attr_reader :name, :price

  def initialize(properties = {})
    super(properties)
    @name = properties[:name]
    @price = properties[:price]
  end

  def to_csv_row
    [@id, @name, @price]
  end

  def self.headers
    %w(id name price)
  end
end
