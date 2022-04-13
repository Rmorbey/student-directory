def input_students
  puts "Please enter the names of the students"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    if students.length == 1
      puts "Now we have 1 student"
    else
    puts "Now we have #{students.count} students"
    end
    puts "To finish, just hit return twice"
    puts "Name"
    name = gets.chomp
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
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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