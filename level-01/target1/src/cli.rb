# Please use require_relative for requiring any dependencies
require_relative './application'

# The Main application that will be running your code
def cls
  system 'cls'
end


def main_display
  puts "Please choose the action you would like to perform?" \
  "\n1. Enroll into a department" \
  "\n2. Change your department" \
  "\n3. Change your section" \
  "\n4. View details" \
  "\n5. Show Departments"
end

def common_question_1
  puts 'What is your name?'
end

def common_question_2
  puts "Please select your department from the given choices?" \
  "\nEEE" \
  "\nMECH" \
  "\nCSE" \
  "\nCIVIL"
end

def section_question_3
  puts "Please select your section from the given choices?" \
  "\nA" \
  "\nB" \
  "\nC" \
end

def details_view_options
  puts "Please choose the details you would like to get?" \
  "\n1. List all students in a department" \
  "\n2. List all students in a section" \
  "\n3. List details of a student"
end

application = Application.new

#stud_namesA=['A1','A1','A3','A4','A5','A6','A7','A8','A9','A10']
#stud_namesB=['A11','A12','A13','A14','A15','A16','A17','A18','A19','A20']
#stud_namesC=['A21','A22','A23','A24','A25','A26','A27','A28','A29','A30']

arr=['A01','A02','A03','A04','A05','A06','A07','A08','A09','A10','A11','A12','A13','A14','A15','A16','A17','A18','A19','A20','A21','A22','A23','A24','A25','A26','A27','A28','A29','A30']
sel_arr=[]
ind=rand(arr.count)
sel_arr<<arr[ind]
i=1
while i<=29
  if sel_arr.include?(arr[ind])
    ind=rand(arr.count)
  else
    sel_arr<<arr[ind]
    i=i+1
  end
end

i=0
loop do
  main_display
  user_option = gets.chomp.to_i
  case user_option
  when 1
    common_question_1
    student_name = gets.chomp
    #student_name=sel_arr[i]
    common_question_2
    student_dept = gets.chomp
    #student_dept='EEE'
    #puts application.testme
    puts application.enroll student_name, student_dept
  when 2
    common_question_1
    student_name = gets.chomp
    common_question_2
    student_dept = gets.chomp
    puts application.change_dept student_name, student_dept
  when 3
    common_question_1
    student_name = gets.chomp
    section_question_3
    section = gets.chomp
    puts application.change_section student_name, section
  when 4
    details_view_options
    selected_view = gets.chomp.to_i
    case selected_view
    when 1
      common_question_2
      student_dept = gets.chomp
      puts application.department_view student_dept
    when 2
      common_question_2
      student_dept = gets.chomp
      section_question_3
      section = gets.chomp
      puts application.section_view student_dept, section
    when 3
      common_question_1
      student_name = gets.chomp
      puts application.student_details student_name
    end
  when 5
    application.show
  end
  puts 'Press any key to go back'
  gets
  cls
  i=i+1
end
