 require_relative './department' # Include other files in the same directory

# Your application
class Application
   attr_accessor :departments

  def initialize
     self.departments=[]
     #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new(dept) }
     ["EEE", "MECH", "CSE", "CIVIL"].each do |dept| 
      self.departments<<Department.new(dept) 
    end
  end

  def show
    self.departments.each do |dept|
      dept.show
    end
  end

  def testme
    "Sethu You have been enrolled to {student_department}" \
    "\nYou have been allotted section B" \
    "\nYour roll number is MECB01"
  end

  def enroll(student_name, student_department)
    temp=""
          department = self.departments.detect { |dept| dept.get_name == student_department}
          section=department.get_section
           if section!=0
            sect=section[0]
            rollno=department.get_name+section
            department.add_rollno(student_name,rollno)
            temp+="You have been enrolled to #{student_department}"
            temp+="\nYou have been allotted section #{sect}"
            temp+="\nYour roll number is #{rollno}"
          else
            temp+= "Error: Seats are not available #{student_department}"
          end
  end

  def change_dept(student_name, student_department)
    temp=""
    rollno=""
    old_dept=""
    i=-1
    flag=0
    self.departments.each do |dept|
      rollno=dept.get_details(student_name)
      if rollno != nil
        while rollno[i]>='0' and rollno[i] <='9'
            i=i-1
        end
        #puts "u r present Section is #{rollno[i]}"
        old_dept=dept
        break
      end
    end

    if old_dept == ""
        return "Error: Such Student not present"
    end

    department = self.departments.detect { |dept| dept.get_name == student_department}
    section=department.get_section  # section for new moving department
    if section==0
      "Thers is no seat" \
    else  
      #old_dept.remove_rollno(student_name,rollno[i])   #rollno[i] is the old section which needs updation
      #puts 'rrrr '+rollno
      #puts 'rrr'+section[-3]
      old_dept.remove_rollno(student_name,section[-3])
      #old_dept.updaterollnos()    
      sect=section[0]
      rollno=department.get_name+section
      #puts rollno
      #department.add_rollno(student_name,rollno)
      roleno=department.add_rollno(student_name,rollno)
      temp += "You have been enrolled to #{student_department}"
      temp += "\nYou have been allotted section #{sect}"
      temp += "\nYour roll number is #{rollno}"
      flag=1
    end
    if flag==0
      temp="Department re-allocation is incorrect"
    end
    return temp
  end

  def change_section(student_name, section)
    ## write some logic to frame the string below
    temp=""
    rollno=""
    old_dept=""
    i=-1
    flag=0
    self.departments.each do |dept|                       # This block is for finding the department
      rollno=dept.get_details(student_name)               # of the given student
      if rollno != nil
        while rollno[i]>='0' and rollno[i] <='9'
            i=i-1
        end
        #puts "Section is #{rollno[i]}"
        oldsection=rollno[i]
        old_dept=dept
        break
      end
    end

    if old_dept==""
        return "Error: Student Not present"
    end

      sectcnt=old_dept.get_seats_in_section(section)
    

    #puts sectcnt
    if sectcnt>=1
      #old_dept.remove_rollno(student_name,section)
      #puts 'rrr' +rollno
      old_dept.remove_rollno(student_name,rollno[i])
     
      sect=old_dept.get_specific_section_rollno(section)

      

      rollno=old_dept.get_name+sect.to_s  

      #puts rollno

      old_dept.add_rollno(student_name,rollno)

      #old_dept.rearrange_rollnos(student_name,oldsection)
      #{}"You have been enrolled to #{student_department}" \
      temp += "You have been allotted section #{section}"
      temp += "\nYour roll number is #{rollno}"
      flag=1
    #else
     # puts 'Error: Seats are not available in #{section} section'
    end
    if flag==0
      temp='Section allocated is incorrect.'
      #temp+='roll number generated is incorrect'
    end
    return temp
  end
    #department = self.departments.detect { |dept| dept.get_name == student_department}
    #return "section"+section.to_s


  def department_view(student_dept)
    ## write some logic to frame the string below
    #if !self.departments.include?(student_dept)
     #   puts "invalid Department"
    #else
        
          department = self.departments.detect { |dept| dept.get_name == student_dept}
             department.show_details
    #end
    
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    #if !departments.include?(student_dept)
    #    puts "invalid Department"
    #else    
          department = self.departments.detect { |dept| dept.get_name == student_dept}  
         #{}"\nTom - MECB01"
             department.show_details1 section

    #return section
    #end
  end

  def student_details(student_name)
    ## write some logic to frame the string below
      #{}"Tom - MECH - Section B - MECB01"
    temp=""
    self.departments.each do |dept|                       # This block is for finding the department
       temp=dept.student_details student_name 
       if temp!=""
          break
       end
    end
    if temp==""
       temp='Student details are incorrect'
    end
    return temp
  end
end
