li=["High up", ["further down", ["and down", ["deep down", "the answer", 42]]]]



def extract(li):
	for words in li:
		if type(words) is list:
			extract(words)
		else:
			print(words)

extract(li)
