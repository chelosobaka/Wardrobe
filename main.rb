require_relative 'lib/thing.rb'
require_relative 'lib/wardrobe.rb'
require_relative 'lib/helper.rb'

Helper.encoding

loop do
  puts ("1 - Добавить вещь")
  puts ("2 - Что надеть?")
  choise = STDIN.gets.to_i
  case choise
  when 1
    Helper.add_thing
    next
  when 2
    break
  else
    puts "Неверный ввод"
  end
end

puts "Сколько градусов за окном? (можно с минусом)"
things = Helper.create_things_object
temperature = STDIN.gets.to_i

puts "Предлагаем сегодня надеть:"
puts
wardrobe = Wardrobe.new(things, temperature)
wardrobe.what_to_wear.each do |x|
  if x != nil
    puts x.printer
  end
end



