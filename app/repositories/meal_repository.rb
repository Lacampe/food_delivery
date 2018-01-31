require_relative 'base_repository'
require_relative '../models/meal'

class MealRepository < BaseRepository
  private

  def build_element(row)
    row[:id]    = row[:id].to_i          # Convert column to Integer
    row[:price] = row[:price].to_i       # Convert column to Integer
    Meal.new(row)
  end
end
