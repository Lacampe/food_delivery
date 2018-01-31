require_relative 'base_repository'
require_relative '../models/customer'

class CustomerRepository < BaseRepository
  private

  def build_element(row)
    row[:id] = row[:id].to_i # Convert column to Integer
    Customer.new(row)
  end
end
