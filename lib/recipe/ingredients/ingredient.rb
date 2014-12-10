module Recipe
  class Ingredient
    def initialize
      # do stuff...
    end

    # The name of the the ingredient, e.g. 'Wheat flour'
    def name(string)
      @name = string
    end

    # Amount to add to mixture. e.g. '3 cups'
    def amount(string)
      @amount = string
    end
  end
end
