@students = [] # an empty array accessible to all methods

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" #9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Successfully entered a new student.".center(80, '-')
  when "2"
    show_students
    puts "Here is a list of our great students.".center(80, '-')
  when "3"
    save_students
    puts "Successfully saved student list.".center(80, '-')
  when "4"
    load_students
    puts "Successfully loaded student list.".center(80, '-')
  when "9"
    puts "Thank you for visiting, have a nice day.".center(80, '-')
    exit # this will cause the program to terminate
  else
    puts "I don't know what you mean, try again.".center(80, '-')
  end
end

def input_students
  puts "Please enter the name of the students".center(80, '=')
  puts "To finish, just hit return twice".center(80, '=')
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name, "november")
    puts "Now we have #{@students.count} students".center(80)
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80, '-')
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(80)
end

def save_students
  # open the file for writing
  puts "The default file is: #{filename}."
  puts "Enter the name of a different file, or press return for the default file."
  input = STDIN.gets.chomp
  input.empty? ? save_file = filename : save_file = input
  file = File.open(save_file, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Chosen File: #{save_file}."
end

def load_students
  load_file = filename
  file = File.open(load_file, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
  puts "Chosen File: #{load_file}."
end

def filename
  ARGV.first.nil? ? "students.csv" : ARGV.first.chomp
end

def default_load_students
  load_students
  puts "Loaded #{@students.count} from #{filename}."
end

default_load_students
interactive_menu