require_relative 'lib/thing'
require_relative 'lib/wardrobe'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

loop do
  puts ("1 - Добавить вещь")
  puts ("2 - Что надеть?")
  choise = STDIN.gets.to_i
  case choise
  when 1
    Thing.add_thing
    next
  when 2
    break
  else
    puts "Неверный ввод"
  end
end

puts "Сколько градусов за окном? (можно с минусом)"
things = Thing.create_things_object
temperature = STDIN.gets.to_i

puts "Предлагаем сегодня надеть:"
puts
wardrobe = Wardrobe.new(things, temperature)
wardrobe.what_to_wear.each do |x|
  if x != nil
    puts x.to_s
  end
end



