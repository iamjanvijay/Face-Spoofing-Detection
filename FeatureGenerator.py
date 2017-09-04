Input = []
Output = []

f = open('imposter_train_face_features64.txt','r')
for line in f :
	vector = line
	if len( map(int,vector.strip().split()) ) != 3072 :
		print "ERROR" 
	Input.append( map(int,vector.strip().split()) )
	Output.append( 0 )

f = open('imposter_test_face_features64.txt','r')
for line in f :
	vector = line
	if len( map(int,vector.strip().split()) ) != 3072 :
		print "ERROR" 
	Input.append( map(int,vector.strip().split()) )
	Output.append( 0 )

f = open('client_train_face_features64.txt','r')
for line in f :
	vector = line
	if len( map(int,vector.strip().split()) ) != 3072 :
		print "ERROR" 
	Input.append( map(int,vector.strip().split()) )
	Output.append( 1 )

f = open('client_test_face_features64.txt','r')
for line in f :
	vector = line
	if len( map(int,vector.strip().split()) ) != 3072 :
		print "ERROR" 
	Input.append( map(int,vector.strip().split()) )
	Output.append( 1 )

print Input[0],len( Input[0] )
print len(Input),len(Output)


