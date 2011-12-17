require 'benchmark'

iterations = 1000000

b = Benchmark.measure do
  for i in 1..iterations do 
    x = i
  end
end

c = Benchmark.measure do
  iterations.times do |i|
    x = i
  end
end

puts b
puts c