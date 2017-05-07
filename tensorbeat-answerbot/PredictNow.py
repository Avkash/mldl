# predict-both-models.py
from keras.models import model_from_json
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences
from keras.models import Model 
import numpy as np


saved_5model_json_file = "/home/avkash/toolkit/github/answerbot/5stars-models/5stars_reviews_model.json"
saved_5model_hdf5_file = "/home/avkash/toolkit/github/answerbot/5stars-models/5stars_reviews_save.HDF5"
saved_5model_weight_file = "/home/avkash/toolkit/github/answerbot/5stars-models/5stars_reviews_weights.h5"


saved_0model_json_file = '/home/avkash/toolkit/github/answerbot/sentiments-model/sentiments_model_e20.json'
saved_0model_hdf5_file = "/home/avkash/toolkit/github/answerbot/sentiments-model/sentiments_save_e20.HDF5"
saved_0model_weight_file = "/home/avkash/toolkit/github/answerbot/sentiments-model/sentiments_weights_e20.h5"


print("Loading 5 Stars model from disk..")
# load json and create model
json_file = open(saved_5model_json_file, 'r')
loaded_5model_json = json_file.read()
json_file.close()
loaded_5model = model_from_json(loaded_5model_json)
# load weights into new model
loaded_5model.load_weights(saved_5model_weight_file)
print("5 Star model is loaded from disk..")
print("Compiling 5 Star model..")
loaded_5model.compile(loss='categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['acc'])
print("5 Star Model is compiled..")


print("Loading Sentiment model from disk..")
# load json and create model
json_file = open(saved_0model_json_file, 'r')
loaded_0model_json = json_file.read()
json_file.close()
loaded_0model = model_from_json(loaded_0model_json)
# load weights into new model
loaded_0model.load_weights(saved_0model_weight_file)
print("Sentiment model is loaded from disk..")
print("Compiling Sentiment model..")
loaded_0model.compile(loss='categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['acc'])
print("Sentiment Model is compiled..")



MAX_NB_WORDS = 10000
MAX_SEQUENCE_LENGTH_5S = 1000
MAX_SEQUENCE_LENGTH_0S = 200

myreview = ['just a bad place to visit and eat']

while True:
	user_question = raw_input("Please enter your question in quotes or type \"end\" to exit: ")
	if user_question == 'end':
		print("Exiting...")
		break
 	myreview = [user_question]
	# finally, vectorize the text samples into a 2D integer tensor
	tokenizer = Tokenizer(nb_words=MAX_NB_WORDS) # num_words replaced with nb_words
	tokenizer.fit_on_texts(myreview)
	word_index = tokenizer.word_index
	#print('Found %s unique tokens.' % len(word_index))
	my_sequence = tokenizer.texts_to_sequences(myreview)
	my_data = pad_sequences(my_sequence, maxlen=MAX_SEQUENCE_LENGTH_5S)
	my_result_5s = loaded_5model.predict(my_data)
	result5s = np.round(my_result_5s,2)
	maxid5s = result5s.argmax()
	print("================== 5 Star Model Results ====================")
	if maxid5s == 0 | maxid5s == 1:
		print("The statement has 1 Star.")
	elif maxid5s == 2 :	
		print("The statement has 2 Stars.")
	elif maxid5s == 3 :	
		print("The statement has 3 Stars.")
	elif maxid5s == 4 :	
		print("The statement has 4 Stars.")
	else:
		print("The statement has 5 Stars.")
	print("------------------------------------------------------------")
	my_data = pad_sequences(my_sequence, maxlen=MAX_SEQUENCE_LENGTH_0S)
	my_result_0s = loaded_0model.predict(my_data)
	result0s = np.round(my_result_0s,2)
	maxid0s = result0s.argmax()
	print("------------------------------------------------------------")
	if maxid0s == 0:
		print("The statement is negative.")
	else:	
		print("The statement is positive.")
	print("============================================================")


