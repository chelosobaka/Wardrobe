class Wardrobe
  def initialize(things, temperature)
    @things = things
    @temperature = temperature
  end

  def types_of_things
    @things.map{|variable| variable.type}.uniq
  end

  def things_of_same_type
    hash = {}
    types_of_things.each do |variable|
      hash[variable] = @things.select{|x| x.type == variable }
    end
    hash
  end

  def what_to_wear
    things_of_same_type.values.map do |x|
      x.select{|y| y.suitable_for_weather?(@temperature)}.sample
    end
  end
end
