module Recipe
  class DSL
    def initialize(&block)
      yield(block)
    end

    def ingredient(name, amount)
      p name, amount
    end
    # def method_missing(method, *args)
    # end
  end
end
