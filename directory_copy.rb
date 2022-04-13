def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end

  students
end

def print_header(students)
  if students.count > 0
  puts "The students of Villains Academy"
  puts "-------------"
  end
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.length == 0
    puts "We do not have any students!"
    else
    puts "Overall, we have #{names.count} great students"
  end
end

students = input_students
print_header(students)
print(students)
print_footer(students)