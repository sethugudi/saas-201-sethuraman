

@@studs=[]

def additems()
	puts " Enter name  "
	name=gets
	puts " Enter age  "
	age=gets
	item={:name=>name,:age=>age}
	@@studs.push(item)
end

def showitems()
	@@studs.each do | items |
		items.each do | k , v |
			puts " #{k} #{v} "
		end
	end
end

additems()
additems()

showitems()
