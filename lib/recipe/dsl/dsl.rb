module Recipe
  class DSL
    attr_accessor :name, :elements
    def initialize(&block)
      @elements = []
      @name = ""
      yield(self)
    end

    def name(string = 'Recipe')
      @name = string
    end

    def ingredient(name, measurement)
      @elements << Recipe::Ingredient.new(name, measurement)
    end

    def instruction(text)
      @elements << Recipe::Instruction.new(text)
    end

    def printer(klass)
      klass.new(name, elements)
    end
  end
end
