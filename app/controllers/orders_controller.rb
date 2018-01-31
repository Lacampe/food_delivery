require_relative '../models/order.rb'
require_relative '../views/orders_view.rb'
require_relative '../controllers/meals_controller'
require_relative '../controllers/customers_controller'

class OrdersController
  def initialize(order_repository, meal_repository, employee_repository, customer_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def add
    # 1 - ask which meal
    meal = ask_for_meal
    # 2 - ask which customer
    customer = ask_for_customer
    # 3 - ask which employee (delivery_guy)
    employee = ask_for_employee
    # 4 - create an Order instance
    new_order = Order.new(meal: meal, customer: customer, employee: employee)
    # 5 - send this to the OrderRepo to save to csv
    @order_repository.add(new_order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display_orders(undelivered_orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee == employee }
    @view.display_orders(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee == employee }
    @view.display_orders(orders)
    order_id = @view.ask_for_integer(:order)
    order = orders.find { |o| order_id == o.id }
    order.deliver!
    @order_repository.save
  end

  private

  def ask_for_meal
    MealsController.new(@meal_repository).list
    id = @view.ask_for_integer(:meal)
    @meal_repository.find(id)
  end

  def ask_for_customer
    CustomersController.new(@customer_repository).list
    id = @view.ask_for_integer(:customer)
    @customer_repository.find(id)
  end

  def ask_for_employee
    employees = @employee_repository.all_delivery_guys
    @view.display_employees(employees)
    id = @view.ask_for_integer(:delivery_guy)
    @employee_repository.find(id)
  end
end
