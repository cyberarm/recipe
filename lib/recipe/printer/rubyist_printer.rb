module Recipe
  class RubyistPrinter < Recipe::Printer
    def initialize(name, elements)
      @name        = name
      @elements = elements
      push_out
    end

    def push_out
      puts "class #{@name.capitalize.gsub(" ", '')}"
      counter = 0
      instruction_counter = 0
      @elements.each do |element|
        case element.class.to_s
        when "Recipe::Instruction"
          puts "  def instruction_#{instruction_counter}"
          puts "    '#{element.text}'"
          puts "  end"
          instruction_counter+=1
        when "Recipe::Ingredient"
          puts "  def add_#{element.name.downcase}"
          puts "   '#{element.measurement}'"
          puts "  end"
        end
        puts unless counter >= @elements.count-1
        counter+=1
      end
      puts "end"
    end
  end
end
