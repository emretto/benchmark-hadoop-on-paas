import pandas as pd
from numpy.random import randint

dfObj = pd.DataFrame(columns=['User_ID', 'UserName', 'Action'])
dfObj = dfObj.append({'User_ID': 23, 'UserName': 'Riti', 'Action': 'Login'}, ignore_index=True)

print(dfObj)