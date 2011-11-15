class Person
  attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = "Fred"
fred.job = "None"
fred.age = 43
fred.gender = 'male'

laura = Person.new
laura.name = "Laura"
laura.job = "None"
laura.age = 20
laura.gender = 'female'

require('pstore')
store = PStore.new('storagefile2')
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << laura
end

fred = nil
laura = nil

store2 = PStore.new('storagefile2')
people = []
store2.transaction do
  people = store2[:people]
end
people.each do |person|
  puts person.name
  puts person.age
end