from os import system
import re

name_list=[]
	
pat=re.compile("[0-9]+")

def add():
	ele=input('Enter the element')
	
	if pat.match(ele):
		ele=int(ele)

	name_list.append(ele)
	print(name_list)
	input()

def pop():
	val=name_list.pop()
	if type(val) is int:
		print(str(val)+ ' popped ')
	else:
		print(val+ ' popped ')
	print(name_list)
	input()

def remove():
	print(name_list)
	ele=input('Enter the element to remove')
	if pat.match(ele):
		ele=int(ele)
	name_list.remove(ele)
	print(name_list)
	input()		

def insert():
	print(name_list)
	ele=input('Enter the element to insert')
	pos=int(input('Enter the insert position'))
	if pat.match(ele):
		ele=int(ele)
	name_list.insert(pos,ele)
	print(name_list)
	input()		

while True:
	_=system('clear')

	print('------------------------------------------------------')
	print('-------------------1 APPEND---------------------------')
	print('-------------------2 POP------------------------------')
	print('-------------------3 INSERT---------------------------')
	print('-------------------4 REMOVE---------------------------')
	print('-------------------5 EXIT  ---------------------------')
	print('------------------------------------------------------')
	op=int(input('option'))
	if op==1:
		add()
	elif op==2:
		pop()
	elif op==3:
		insert()
	elif op==4:
		remove()
	elif op==5:
		exit()



