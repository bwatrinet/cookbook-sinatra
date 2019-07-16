require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    # display all recipes
    @recipes
    save_csv
  end

  def find_recipe(index)
    # add a new recipe
    @recipes[index]
  end

  def add_recipe(recipe)
    # add a new recipe
    @recipes.push(recipe)
    save_csv
  end

  def remove_recipe(recipe_index)
    # removes a recipe
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def erase_recipes(answer)
    answer == "Y" ? @recipes = [] : @recipes
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done]
      end
    end
  end
end
