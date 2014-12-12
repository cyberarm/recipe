module Recipe
  class Mix
    attr_reader :name
    def initialize(name)
      @name = name
    end

    def name=(name)
      @name = name
    end
  end
end
