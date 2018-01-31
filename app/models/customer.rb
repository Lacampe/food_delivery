require_relative 'base_record'

class Customer < BaseRecord
  attr_reader :name, :address

  def initialize(properties = {})
    super(properties)
    @name = properties[:name]
    @address = properties[:address]
  end

  def to_csv_row
    [@id, @name, @address]
  end

  def self.headers
    %w(id name address)
  end
end
