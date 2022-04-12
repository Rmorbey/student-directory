def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Do they have any hobbies?"
  hobbies = gets.chomp
  puts "What is their height?"
  height = gets.chomp
  puts "What is their country of birth?"
  country_of_birth = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, height: height, country_of_birth: country_of_birth}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
    puts "Do they have any hobbies?"
    hobbies = gets.chomp
    puts "What is their height?"
    height = gets.chomp
    puts "What is their country of birth?"
    country_of_birth = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort). Hobbies: #{student[:hobbies]}. Height: #{student[:height]}. Country of birth: #{student[:country_of_birth]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)