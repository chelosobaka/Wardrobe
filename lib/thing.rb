class Thing
  attr_reader :name, :type, :range_t

  def initialize(name, type, range_t)
    @name = name
    @type = type
    range_t = range_t.delete("(" ")").split(", ")
    @range_t = range_t.map{|x| x.to_i}
  end

  def suitable_for_weather?(temperature)
    (@range_t[0]..@range_t[1]).include?(temperature)
  end

  def printer
    "#{@name} (#{@type}) #{range_t[0]}..#{range_t[1]}"
  end
end
