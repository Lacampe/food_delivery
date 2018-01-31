require_relative '../models/meal.rb'
require_relative '../views/meals_view.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    name = @view.ask_for(:name)
    price = @view.ask_for_integer(:price)
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.add(new_meal)
  end
end
