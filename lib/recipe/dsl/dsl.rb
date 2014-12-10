module Recipe
  class DSL
    def initialize(&block)
      yield(self)
      @ingredients = []
    end

    def ingredient(name, measurement)
      @ingredient << Recipe::Ingredient.new(name, measurement)
    end

    def printer(klass);end
    # def method_missing(method, *args)
    # end
  end
end
