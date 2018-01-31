require_relative 'base_repository'
require_relative '../models/order'


class OrderRepository < BaseRepository
  def initialize(csv_file_path, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_file_path)
  end

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end

  def save
    write_csv
  end

  def build_element(row)
    row[:id] = row[:id].to_i                          # Convert column to Integer
    row[:delivered] = row[:delivered] == "true"       # Convert column to Integer
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    Order.new(row)
  end
end
