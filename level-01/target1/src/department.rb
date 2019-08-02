	
class Department
	attr_accessor :deptname , :sections, :studentsnamelistA, :studentsrollnoA,:studentsnamelistB, :studentsrollnoB,:studentsnamelistC, :studentsrollnoC
	def initialize(name)
		self.deptname=name
		self.sections={'A'=>10,'B'=>10,'C'=>10}
		self.studentsnamelistA=[]
		self.studentsrollnoA=[]
		self.studentsnamelistB=[]
		self.studentsrollnoB=[]
		self.studentsnamelistC=[]
		self.studentsrollnoC=[]
	end
	def show
		#puts self.deptname
	end

	def show_details1(section)
		temp="List of students:"
		if section=='A'
			self.studentsnamelistA.zip(self.studentsrollnoA) do |v1,v2|
				temp+= "\n#{v1} - #{v2}" 
			end
		elsif section=='B'
			self.studentsnamelistB.zip(self.studentsrollnoB) do |v1,v2|
				temp+= "\n#{v1} - #{v2}" 
			end
		elsif section=='C'
			self.studentsnamelistC.zip(self.studentsrollnoC) do |v1,v2|
				temp+= "\n#{v1} - #{v2}" 
			end
		end
		return temp
	end

	def student_details stud_name
		temp=""
		i=0
		roll=""
		studentsnamelistA.each do |stname|
			if stname==stud_name
		#			puts "ok"
					ind=i
					roll=studentsrollnoA[ind]
					n=roll.size
					dep=roll[0..n-4]
					#dep=roll.chars.first(-3).join
					temp+= "#{stname} - #{dep} - Section A - #{roll}" 					
					return temp
			end
		end
		studentsnamelistB.each do |stname|
			if stname==stud_name
					ind=i
					roll=studentsrollnoB[ind]
					n=roll.size
					dep=roll[0..n-4]
					#dep=roll.chars.first(-3).join
					temp+= "#{stname} - #{dep} - Section B - #{roll}" 					
					#return 1
					return temp
			end
		end
		studentsnamelistC.each do |stname|
			if stname==stud_name
					ind=i
					roll=studentsrollnoC[ind]
					n=roll.size
					dep=roll[0..n-4]			#dep=roll.chars.first(-3).join
					temp+= "#{stname} - #{dep} - Section C - #{roll}" 					
					return temp
			end
		end
		return temp		
	end

	def show_details
		temp="List of students:"
		self.studentsnamelistA.zip(self.studentsrollnoA) do |v1,v2|
				temp+= "\n#{v1} - #{v2}" 
		end
		self.studentsnamelistB.zip(self.studentsrollnoB) do |v1,v2|
				#{}"\n#{v1}Tom - #{v2}"
				temp+= "\n#{v1} - #{v2}" 
		end
		self.studentsnamelistC.zip(self.studentsrollnoC) do |v1,v2|
				temp+= "\n#{v1} - #{v2}"	
				#puts "\n#{v1} - #{v2}" 
		end
		return temp
	end

	def get_details(stud_name)
		x=self.studentsnamelistA.find_index(stud_name)
		if x!=nil
			return self.studentsrollnoA[x]
		end
		x=self.studentsnamelistB.find_index(stud_name)
		if x!=nil
			return self.studentsrollnoB[x]
		end 
		x=self.studentsnamelistC.find_index(stud_name)
		if x!=nil
			return self.studentsrollnoC[x]
		end 
	end

	def get_name
		deptname
	end

	def sort()
		#self.studentsnamelistA=self.studentsnamelistA.sort
		#self.studentsrollnoA=self.studentsrollnoA.sort		
		#self.studentsnamelistB=self.studentsnamelistB.sort
		#self.studentsrollnoB=self.studentsrollnoB.sort		
		#self.studentsnamelistC=self.studentsnamelistC.sort
		#self.studentsrollnoC=self.studentsrollnoC.sort		
		self.studentsnamelistA.sort!
		self.studentsrollnoA.sort!
		self.studentsnamelistB.sort!
		self.studentsrollnoB.sort!		
		self.studentsnamelistC.sort!
		self.studentsrollnoC.sort!		
	end

	def updaterollnos()
		self.studentsrollno.each do |x|
		 #puts "Roll nos are #{x} "
		end
	end

	def add_rollno(stud_name,rollno)
		if rollno[-3]=='A'
			self.studentsnamelistA<<stud_name 
			self.studentsrollnoA<<rollno
		elsif rollno[-3]=='B'
			self.studentsnamelistB<<stud_name 
			self.studentsrollnoB<<rollno	
		elsif rollno[-3]=='C'
			self.studentsnamelistC<<stud_name 
			self.studentsrollnoC<<rollno	
		end
		sort()
	end		

	def rearrange_rollnos(stud_name,section)
		ind=self.studentsnamelistA.find_index(stud_name)
		self.studentsrollnoA[ind]=rollno
		#puts studentsrollno[ind],ind
		gets
		c=ind+1
		i=0
		self.studentsrollno.each do |x|
			if i>=c
				d=x
				d[-1]=i.to_s
				if d[-2]=='1'
					d[-2]='0'
				end	
				x.replace(d)
				puts x
			end
				i=i+1
		end
	end

	def remove_rollno(stud_name,section)
		if section=='A'
			ind=self.studentsnamelistA.find_index(stud_name) # removing from studentslist and studentsrollno
			self.studentsnamelistA.delete(stud_name)
			self.studentsrollnoA.delete_at(ind)
			#self.sections[section]=self.sections[section]+1
			#puts 'removed'
			c=1
			self.studentsrollnoA.each do |x|
				d=x
				d[-1]=c.to_s
				if d[-2]=='1'
					d[-2]='0'
				end
				x.replace(d)
				#puts x				
				c=c+1
			end
		elsif section=='B'
			ind=self.studentsnamelistB.find_index(stud_name) # removing from studentslist and studentsrollno
			self.studentsnamelistB.delete(stud_name)
			self.studentsrollnoB.delete_at(ind)
			#self.sections[section]=self.sections[section]+1
			#puts 'removed'
			c=1
			self.studentsrollnoB.each do |x|
				d=x
				d[-1]=c.to_s
				if d[-2]=='1'
					d[-2]='0'
				end
				x.replace(d)
				#puts x				
				c=c+1
			end
		elsif section=='C'
			ind=self.studentsnamelistC.find_index(stud_name) # removing from studentslist and studentsrollno
			self.studentsnamelistC.delete(stud_name)
			self.studentsrollnoC.delete_at(ind)
			#self.sections[section]=self.sections[section]+1
			#puts 'removed'	
			c=1
			self.studentsrollnoC.each do |x|
				d=x
				d[-1]=c.to_s
				if d[-2]=='1'
					d[-2]='0'
				end
				x.replace(d)
				#puts x				
				c=c+1
			end
		end
		self.sections[section]=self.sections[section]+1
	end

	def get_seats_in_section(section)
		 self.sections[section]
		 
	end

	def get_specific_section_rollno(section)
		sect=10-self.sections[section]+1
		if sect<10
			sect=section+'0'+sect.to_s
		else
			sect=section+sect.to_s
		end
		self.sections[section]=self.sections[section]-1
		#puts "Hello sethu ",section,self.sections[section]
		return sect
	end

	def get_section
		if self.sections['A'] >= 1
			sect=10-self.sections["A"]+1
			if sect<10
				sect='A0'+sect.to_s
			else
				sect='A'+sect.to_s
			end
			self.sections['A']=self.sections['A']-1
		elsif self.sections['B'] >=1
			sect=10-self.sections["B"]+1
			if sect<10
				sect='B0'+sect.to_s
			else
				sect='B'+sect.to_s
			end			
			self.sections['B']=self.sections['B']-1
		elsif self.sections['C'] >= 1
			sect=10-self.sections["C"]+1
			if sect<10
				sect='C0'+sect.to_s
			else
				sect='C'+sect.to_s
			end
			self.sections['C']=self.sections['C']-1			
		else
			sect=0
		end
		return sect
	end
end


