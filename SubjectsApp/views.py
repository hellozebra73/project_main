from django.shortcuts import render

#Views SubjectsApp

class SubjectConstructor:
    def __init__(self, subject_id_in='All'): 
    	#Call to the db Problem.
    	try:
    		if subject_id_in == 'All':
    			self.subject_in = SubjectNew.objects.all()
    		else:
    			self.subject_in = SubjectNew.objects.get(subject_id=subject_id_in)
    	except:
    		self.subject_in = 'None'
    #check if the problem exists.
    def SubjectExist(self):
    	if self.subject_in == 'None':
    		return HttpResponse('The Subject does not exist.')
    	else:
    		return self.subject_in

class TopicConstructor:
    def __init__(self, topic_id_in='All',subject_id_in='All'): 
    	#Call to the db Problem.
    	try:
    		if topic_id_in == 'All' and subject_id_in = 'All':
				self.topic_in = TopicNew.objects.all()
			elif topic_id_in == 'All' and subject_id_in != 'All'
				subject_in = SubjectConstructor(subject_id_in)
				self.topic_in = TopicNew.objects.filter(subject=subject_in.subject_id)
    		else:
    			self.topic_in = TopicNew.objects.get(topic_id=topic_id_in)
    	except:
    		self.topic_in = 'None'
    #check if the problem exists.
    def TopicExist(self):
    	if self.topic_in == 'None':
    		return HttpResponse('The problem does not exist.')
    	else:
    		return self.topic_in