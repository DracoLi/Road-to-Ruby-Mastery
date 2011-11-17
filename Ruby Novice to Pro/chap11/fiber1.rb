sg = Fiber.new do
  s = 0
  loop do
    square = s*s
    s += 1
    Fiber.yield(square) || s
  end
end

10.times { puts sg.resume }