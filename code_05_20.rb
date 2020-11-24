f = Fiber.new do
  loop do
    puts 'hello'
    puts '    child -> parent'
    Fiber.yield
  end
end
3.times do
  puts '    parent -> child'
  f.resume
end
