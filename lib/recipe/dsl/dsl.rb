module Recipe
  class DSL
    attr_accessor :name, :elements, :mixes
    def initialize(&block)
      @name = "Recipe"
      @elements = []
      @mixes = []
      yield(self)
    end

    def name(string = 'Recipe')
      @name = string
    end

    def mix(name)
      @elements << Recipe::Mix.new(name)
      @mixes << []
    end

    def ingredient(name, measurement)
      if @mixes.count > 0
        @mixes[@mixes.count-1] << Recipe::Ingredient.new(name, measurement)
      else
        @elements << Recipe::Ingredient.new(name, measurement)
      end
    end

    def instruction(text)
      if @mixes.count > 0
        @mixes[@mixes.count-1] << Recipe::Instruction.new(text)
      else
        @elements << Recipe::Instruction.new(text)
      end
    end

    def printer(klass)
      klass.new(name, elements, mixes)
    end
  end
end
