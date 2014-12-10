module Recipe
  class Instruction
    attr_reader :text
    def initialize(text)
      @text = text
    end

    # The text of an instruction. e.g. "heat over to 350F"
    def text=(string)
      @text = text
    end
  end
end
