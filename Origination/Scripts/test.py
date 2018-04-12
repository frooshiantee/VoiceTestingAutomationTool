f = open("TC1.txt","r")

'''print f'''

str = "Successful call"
j=0
for i in f.readlines():
        j+=1
	if j == 1130:
		print i

