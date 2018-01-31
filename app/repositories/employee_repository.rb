require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  def all_delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  undef_method :add

  private

  def build_element(row)
    row[:id] = row[:id].to_i # Convert column to Integer
    Employee.new(row)
  end
end
