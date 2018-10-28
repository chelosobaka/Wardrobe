class Thing
  attr_reader :name, :type, :range_t

  def initialize(name, type, range_t)
    @name = name
    @type = type
    range_t = range_t.delete("(" ")").split(", ")
    @range_t = range_t.map{|x| x.to_i}
  end

  def self.create_things_object
    things = []

    Dir["./data/*.txt"].each_with_index do |variable, index|
      file = File.open("#{variable}", "r:UTF-8")
      content = file.readlines.map(&:chomp)
      file.close
      things << Thing.new(content[0], content[1], content[2])
    end

    things
  end

  def self.add_thing
    size = Dir["./data/*.txt"].size
    range_t = []

    puts "Название вещи:"
    name = STDIN.gets.chomp.capitalize.encode("UTF-8")

    puts "Тип вещи:"
    type = STDIN.gets.chomp.capitalize.encode("UTF-8")

    puts "Минимальную температуру:"
    range_t[0] = STDIN.gets.to_i
    puts "Максимальную температуру:"
    range_t[1] = STDIN.gets.to_i

    f = File.new("data/#{size}.txt", "w:UTF-8")
    f.write("#{name}\n#{type}\n(#{range_t[0]}, #{range_t[1]})")
    f.close
  end

  def suitable_for_weather?(temperature)
    (@range_t[0]..@range_t[1]).include?(temperature)
  end

  def to_s
    "#{@name} (#{@type}) #{range_t[0]}..#{range_t[1]}"
  end
end
