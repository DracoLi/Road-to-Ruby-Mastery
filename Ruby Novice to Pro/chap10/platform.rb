if RUBY_PLATFORM =~ /win32/
  puts "We are in windows!"
elsif RUBY_PLATFORM =~ /linux/
  puts "We are in linux"
elsif RUBY_PLATFORM =~ /darwin/
  puts "We are in Mac!"
else
  puts "We are running under unknown!"
end