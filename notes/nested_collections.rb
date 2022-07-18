# Nested Arrays
# an array that contains other arrays (also called a multidimensional array)
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
  ]
  
  teacher_mailboxes = [
    ["Adams", "Baker", "Clark", "Davis"],
    ["Jones", "Lewis", "Lopez", "Moore"],
    ["Perez", "Scott", "Smith", "Young"]
  ]
  
  
  # Accessing Elements
  # accessing a specific element within a nested array is as simple as calling array[x][y], where x is the index of the nested element
  # and y is the index inside of the nested element
  teacher_mailboxes[0][0] #=> "Adams"
  teacher_mailboxes[1][0] #=> "Jones"
  teacher_mailboxes[2][0] #=> "Perez"
  # you can also use negative indices to return elements from the end of an array, starting at [-1]
  teacher_mailboxes[0][-1] #=> "Davis"
  teacher_mailboxes[=1][0] #=> "Perez"
  teacher_mailboxes[-1][-2] #=> "Smith"
  
  
  # Creating a new nested array
  # to create an array of mutable objects (string, array, hash, etc) you will need to pass the default value for Array.new via a block,
  # using curly braces, instead of the second optional argument
  # the code in the block gets evaluated for every slot in the array, creating multiple objects to initialize the array with, rather 
  # than references to the same object
  
  immutable = Array.new(3) { Array.new(2) }
  #=> [[nil, nil], [nil, nil], [nil, nil]]
  immutable[0][0] = 1000
  #=> 1000
  immutable
  #=> [[1000, nil], [nil, nil], [nil, nil]]
  
  
  
  # Adding and Removing Elements
  # you can add another element to the end of a nested array using the #push method or the shovel operator <<
  # if you want to add an element to a specific nested array, you will need to specifiy the index of the nested array
  
  test_scores << [100, 99, 98, 97]
  #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
  test_scores[0].push(100)
  #=> [97, 76, 79, 93, 100]
  test_scores
  #=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
  
  # using this similar syntax, you can add or remove elements from the entire nested array or from a specific nested element
  test_scores.pop
  #=> [100, 99, 98, 97]
  test_scores[0].pop
  #=> 100
  test_scores
  #=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
  
  
  # iterating over a nested array
  # it's helpful to think of a nested array as having rows and columns
  # each row is the nested element and each column is the index of the nested element
  # when we iterate over a nested array, each element will be one row
  
  teacher_mailboxes.each_with_index do |row, row_index|
    puts "Row #{row_index} = #{row}"
  end
  #=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
  #=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
  #=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
  #=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
  
  # to iterate over the individual elements from inside of each row, you will need to nest another enumerable method inside
  teacher_mailboxes.each_with_index do |row, row_index|
    row.each_with_index do |teacher, column_index|
      puts "Row: #{row_index} Column:#{column_index} = #{teacher}"
    end
  end
  
  test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
  test_scores.any? do |scores|
    scores.all? { |score| score > 80 }
  end
  #=> true
  
  
  
  # Nested Hashes
  vehicles = {
    alice: {year: 2019, make: "Toyota", model: "Corolla"},
    blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
    caleb: {year: 2020, make: "Honda", model: "Accord"}
  }
  
  
  # Accessing Data
  # accessing a specific element in a nested hash is very similar to a nested array
  # as simple as calling hash[:x][:y], where :x is the key of the hash and :y is the key of the nested hash
  vehicles[:alice][:year]
  #=> 2019
  vehicles[:blake][:make]
  #=> "Volkswagen"
  vehicles[:caleb][:model]
  #=> "Accord"
  
  
  
  
  # Adding and Removing Data
  # you can add more nested hashes, just like a regular hash
  vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
  #=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
  vehicles
  #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
  
  # you can also add an element to one of the nested hashes
  vehicles[:dave][:color] = "red"
  #=> "red"
  vehicles
  #=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}
  
  # Deleting a nested hash
  vehicles.delete(:blake)
  vehicles[:dave].delete(:color)
  
  
  
  # Methods with Nested Hashes
  vehicles.select { |name, data| data[:year] >= 2020 }
  #=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
  
  vehicles.map { |name, data| name if data[:year] >= 2020 }
  #=> [nil, :caleb, :dave]
  vehicles.map { |name, data| name if data[:year] >= 2020 }.compact
  #=> [:caleb, :dave]
  
  
  
  
  # iterating over nested hashes
  contacts = {
    "Jon Snow" => {
      name: "Jon",
      email: "jon_snow@thewall.we",
      favorite_ice_cream_flavors: ["chocolate", "vanilla", "mint chip"],
      knows: nil
    },
    "Freddy Mercury" => {
      name: "Freddy",
      email: "freddy@mercury.com",
      favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
    }
  }
  
  contacts.each do |person, data|
    data.each do |attribute, value|
      puts "#{attribute}: #{value}"
    end
  end
  
  contacts.each do |person, data|
    data.each do |attribute, value|
      if attribute == :favorite_ice_cream_flavors
        value.each.do |flavor|
        puts "#{flavor}"
      end
    end
  end
  
  
  
  data = [
    {"id"=>"1", "properties"=>{"name"=>"Google", "stock_symbol"=>"GOOG", "primary_role"=>"company"}},
    {"id"=>"2", "properties"=>{"name"=>"Facebook", "stock_symbol"=>"FB", "primary_role"=>"company"}}
  ]
  