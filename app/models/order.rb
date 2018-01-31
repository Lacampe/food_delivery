require_relative 'base_record'

class Order < BaseRecord
  attr_accessor :delivered, :meal, :employee, :customer

  def initialize(properties = {})
    super(properties)
    @delivered = properties[:delivered] || false
    @meal      = properties[:meal]
    @employee  = properties[:employee]
    @customer  = properties[:customer]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_csv_row
    [@id, @delivered, @meal.id, @employee.id, @customer.id]
  end

  def self.headers
    %w(id delivered meal_id employee_id customer_id)
  end
end
