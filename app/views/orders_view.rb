require_relative 'base_view'

class OrdersView < BaseView
  def display_employees(employees)
    employees.each do |employee|
      puts "#{employee.id} - #{employee.username} - #{employee.role}"
    end
  end

  def display_orders(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} has to be delivered to #{order.customer.name} by #{order.employee.username}"
    end
  end
end
