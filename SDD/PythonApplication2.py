import pandas as pd

data = pd.read_csv(r'C:\Users\DELL\The genetic profile of elite youth soccer 1.csv', na_values="?")
print(data.head())
print("")

from sklearn.utils import shuffle

data = shuffle(data)
print(data.head())
print("")

print(data.describe(exclude=[object]))

from sklearn.model_selection import train_test_split
z = data.drop(columns = ["Athlete group"])
x, y = z, data["Athlete group"]
X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.3, random_state=0)

from sklearn.neighbors import KNeighborsClassifier
knnc = KNeighborsClassifier(n_neighbors = 40)

# Train the model using the training sets
knnc.fit(X_train,y_train)

#Predict Output
knn= knnc.predict(X_test)
print(knn)
print("")

from sklearn.metrics import classification_report, confusion_matrix
print(classification_report(y_test, knn))
print(confusion_matrix(y_test, knn))
print("")

from sklearn.metrics import accuracy_score
print('KNN accuracy:', round(accuracy_score(y_test, knn), 5))

from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
svc = make_pipeline(StandardScaler(), SVC(gamma='auto'))
svc.fit(X_train,y_train)
sv = svc.predict(X_test)

from sklearn.metrics import accuracy_score
print('SVC accuracy:', round(accuracy_score(y_test, sv), 5))

from sklearn.linear_model import LogisticRegression
from sklearn import metrics
import seaborn as sn
import matplotlib.pyplot as plt
logistic_regression = LogisticRegression()
logistic_regression.fit(X_train, y_train)
lr = logistic_regression.predict(X_test)
print('Logistic Regression accuracy: ',metrics.accuracy_score(y_test, lr))

from sklearn.tree import DecisionTreeClassifier

# Create Decision Tree classifer object
dtc = DecisionTreeClassifier()

# Train Decision Tree Classifer
dtc = dtc.fit(X_train,y_train)

#Predict the response for test dataset
dt = dtc.predict(X_test)

print("Decision Tree accuracy:",metrics.accuracy_score(y_test, dt))

#Import Gaussian Naive Bayes model
from sklearn.naive_bayes import GaussianNB

#Create a Gaussian Classifier
gnb = GaussianNB()

#Train the model using the training sets
gnb.fit(X_train, y_train)

#Predict the response for test dataset
nb = gnb.predict(X_test)
print("Naive Bayes accuracy:",metrics.accuracy_score(y_test, nb))

from sklearn.ensemble import AdaBoostClassifier

# Create adaboost classifer object
abc = AdaBoostClassifier(n_estimators=50, learning_rate=1)

# Train Adaboost Classifer
abc = abc.fit(X_train, y_train)

#Predict the response for test dataset
ab = abc.predict(X_test)
print("Ada Boost accuracy:",metrics.accuracy_score(y_test, ab))

from sklearn.ensemble import RandomForestClassifier

#Create a Gaussian Classifier
rfc = RandomForestClassifier(n_estimators=100)

#Train the model using the training sets y_pred=clf.predict(X_test)
rfc.fit(X_train,y_train)
rf = rfc.predict(X_test)
print("Random Forest accuracy:",metrics.accuracy_score(y_test, rf))
print("")
