# -*- coding: utf-8 -*-
"""
Created on Sun Jan  1 00:21:27 2017

@author: bisgin
"""

import re
import numpy as np
import pandas as pd
import operator
#import matplotlib.pyplot as plt
import sys
#data = np.loadtxt('temptrain', dtype=np.float64, delimiter='\t')

trainfile="~/Documents/TEACHING/Data_Mining/data/diabetes_train.csv"
testfile="~/Documents/TEACHING/Data_Mining/data/diabetes_test.csv"


print(trainfile + " and " + testfile)
trainset = pd.read_csv(trainfile, skiprows=0).dropna()
testset = pd.read_csv(testfile, skiprows=0).dropna()

trainlabels=trainset.iloc[:,0].as_matrix()
testlabels=testset.iloc[:,0].as_matrix()

allset=pd.concat([trainset, testset])

#(allset.iloc[:, 1:numcols]-allset.iloc[:, 1:numcols].mean())/allset.iloc[:, 1:numcols].std()

allset=allset.as_matrix()
numrows, numcols=allset.shape




means=[np.mean(allset[:,j]) for j in range(0,numcols-1)]
stdevs=[np.std(allset[:,j]) for j in range(0,numcols-1)]


print(len(means))

data = np.concatenate( (np.reshape(means, (1, 8)), np.reshape(stdevs, (1,8))), axis=0)

#filename=re.findall(r'\d+', trainfile)
#filename = str(filename[0])+ "stat.txt"
#np.savetxt(str(filename), data)

trainsetn = (trainset.iloc[:, 0:numcols-1].as_matrix()-means)/stdevs
testsetn = (testset.iloc[:, 0:numcols-1].as_matrix()-means)/stdevs

numrow, numcols=trainsetn.shape
path=trainfile.split("/")
lenpath = len(path)
out=path[lenpath-1]
f = open(out + '.zscore', 'w')
for i in range(0, numrow):
#    f.write(str(trainlabels[i]))
    if (trainlabels[i]==2):
        f.write('1')
    else:
        f.write('0')

    for j in range(0, numcols):
        f.write(" " +str(j+1)+":" + str(trainsetn[i,j]))
    f.write("\n")

f.close()


numrow, numcols=testsetn.shape
path=testfile.split("/")
lenpath = len(path)
out=path[lenpath-1]
f = open(out + '.zscore', 'w')

for i in range(0, numrow):
#    f.write(str(testlabels[i]))
    if (testlabels[i]==2):
        f.write('1')
    else:
        f.write('0')


    for j in range(0, numcols):
        f.write(" " +str(j+1)+":" + str(testsetn[i,j]))
    f.write("\n")

f.close()