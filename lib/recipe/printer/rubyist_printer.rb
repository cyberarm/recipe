module Recipe
  class RubyistPrinter < Recipe::Printer
    def initialize(name, elements, mixes = nil)
      @name      = name
      @elements  = elements
      @mixes     = mixes
      @string_io = StringIO.new
      push_out
    end

    def ingredient(element)
      @string_io << "def #{element.name.downcase.gsub(" ", '_')}\n"
      @string_io << "'#{element.measurement}'\n"
      @string_io << "end\n"
    end

    def instruction(element)
      @string_io << "def instruction_#{@instruction_counter}\n"
      @string_io <<  "'#{element.text}'\n"
      @string_io << "end\n"
      @instruction_counter+=1
    end

    def push_out
      @string_io << "class #{@name.capitalize.gsub(" ", '')}\n"
      @instruction_counter = 0

      if @mixes.is_a?(Array) && @mixes.count >= 1
        mix_id = 0
        @mixes.each do |mix|
          counter = 0
          @string_io << "class #{@elements[mix_id].name.split(' ').each{ |i| i.capitalize}.join('').gsub(" ", '')}\n"
          mix.each do |object|
            case object.class.to_s
            when "Recipe::Instruction"
              instruction(object)
            when "Recipe::Ingredient"
              ingredient(object)
            end
            @string_io << "\n" unless counter >= mix.count
          end
          @string_io << "end\n"
          @string_io << "\n" unless counter >= mix.count
          mix_id+=1
        end
        @string_io << "end\n"

      else
        counter = 0
        @elements.each do |element|
          case element.class.to_s
          when "Recipe::Instruction"
            instruction(element)
          when "Recipe::Ingredient"
            ingredient(element)
          end
          @string_io << "\n" unless counter >= @elements.count-1
          counter+=1
        end
        @string_io << "end\n"
      end

      format_string
    end

    def format_string
      indent = 0
      spaces = ""
      prev_line = nil

      @string_io.string.each_line do |line|
        line = line.strip
        if prev_line
          indent+=2 if prev_line.start_with?("class ") or prev_line.start_with?("def ")
          indent-= 2 if line == 'end'

          string = ""
          indent.times do
            string << " "
          end
          spaces = string
          puts "#{spaces}#{line}"
        else
          puts line
        end
        prev_line = line
      end

      @string_io.close
    end
  end
end
