
# coding: utf-8

# In[88]:

from sklearn import svm
import pandas as pd
import numpy as np

data=pd.read_csv("/Users/bisgin/Documents/TEACHING/Data_Mining/data/diabetes_train.csv")
m,n=data.shape

X=data.iloc[:,0:n-1].as_matrix()
y=data.iloc[:,n-1].as_matrix()

C=1e+03
gamma=1e-05
clf = svm.SVC(C=C, cache_size=200, class_weight=None, coef0=0.0,
    decision_function_shape='ovr', degree=3, gamma=gamma, kernel='rbf',
    max_iter=-1, probability=False, random_state=None, shrinking=True,
    tol=0.001, verbose=False)

clf.fit(X, y)


# In[89]:

test=pd.read_csv("/Users/bisgin/Documents/TEACHING/Data_Mining/data/diabetes_test.csv")
testX=test.iloc[:,0:n-1].as_matrix()
testy=test.iloc[:,n-1].as_matrix()

pred=clf.predict(testX)
for i in range(10):
    print(pred[i], testy[i])
    
clf.support_vectors_.shape

