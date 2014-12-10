module Recipe
  class Ingredient
    attr_reader :name, :measurement
    def initialize(name, measurement)
      @name = name
      @measurement = measurement
    end

    # The name of the the ingredient, e.g. 'Wheat flour'
    def name=(string)
      @name = string
    end

    # Amount to add to mixture. e.g. '3 cups'
    def measurement=(string)
      @amount = string
    end
  end
end
