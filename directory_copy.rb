def input_students
  puts "Please enter the names of the students"
  name = gets.chomp
  students = []
  puts "Please enter their cohort"
  cohort = gets.chomp.to_sym
  puts "To finish, just hit return twice"
  while !name.empty? do
    if !cohort.empty?
      students << {name: name, cohort: cohort}
    else
      students << {name: name, cohort: :november}
    end
    puts "Now we have #{students.count} students"
    puts "Name"
    name = gets.chomp
    puts "Cohort"
    cohort = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  cohorts = {}
  students.map do |student|
    cohorts[(student[:cohort])] = [] if !cohorts.include?(student[:cohort])
  end

  students.map do |student|
    cohorts[(student[:cohort])] << {name: student[:name] }
  end

  cohorts.each do |key, value|
    puts "Students in #{key} cohort:"
    value.each do |person|
      puts "Name: #{person[:name]}"
    end
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