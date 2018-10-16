# Titanic-Data
## Introduction
<p>On 15 April 1912, Titanic, the largest ship of its time, sank after hitting an iceberg in the North Atlantic Ocean. Of the 2,224 people estimated on board, only 705 survived. Although limited, there were enough lifeboats to save 1,178 people and yet fewer made it.</p>

## Questions
<p>How likely would a passenger survive the tragedy?</p>

- If you are rich, would you most likely be prioritized?
- "Women and Children First". Does your age or gender influence your chances of survivability?

### Objectives
<p>This study analyzes the likelihood of survivability of passengers on board of the Titanic. The analysis is divided according to Demographics and Social Economic Status. The former will be based on Gender and Age and the latter will be based on Ticket Class and Fare.</p>

### Variables
Dependent Variable: If the passenger survived or not. <br>
Independent Variables: 1. Gender 2. Age 3. Ticket Class 4. Fare. <br>
Null Hypothesis: The likelihood of surviving the event are not influenced by demographics and socio economic status. <br>
Hypothesis: The likelihood of survival is influenced by the demographics and socio economic status of the passengers.

## Data Wrangling
### Data Acquisition
<p>The data provided is a list of names of 891 of the 2,224 passengers with the corresponding information for each on board. Below is the Data Dictionary of the data set from [Kaggle](https://www.kaggle.com/c/titanic/data).</p>

- survival: Survival (0 = No, 1 = Yes)
- pclass: Ticket class (1st = Upper, 2nd = Middle, 3rd = Lower)
- sex: Sex
- Age: Age in years (Age is fractional if less than 1. If the age is estimated, is it in the form of xx.5)
- sibsp: # of siblings / spouse aboard the Titanic (Sibling = brother, sister, stepbrother, stepsister, Spouse = husband, wife (mistresses and fiancés were ignored))
- parch: # of parents / children aboard the Titanic (Parent = mother, father, Child = daughter, son, stepdaughter, stepson, Some children travelled only with a nanny, therefore parch=0 for them.)
- ticket: Ticket number
- fare: Passenger fare
- cabin: Cabin number
- embarked: Port of Embarkation (C = Cherbourg, Q = Queenstown, S = Southampton)

## Conclusions
<p>Looking back on the questions that were asked at the beginning, we can observe certain
relations towards survivability of passengers with their Demographics and Socia Economic.
</p>

### "Women and Children First". Does your age or gender influence your chances of survivability?

<p>With the data provided, it seems that women and children have a higher chances of suriving the tragedy than that of adult males. 67% of the women and children survived the tragedy while only 17% of the adult males survived. Please take note that analysis is limited to the fact that some of the passenger's age were missing in the dataset and that it may skew results.
</p>

### If you are rich, would you most likely be prioritized?

<p>The answer to this question is most probably. Looking at the data grouped according to the Passenger Class, it would seem that the higher you are in the passenger class, the higher your chances of surviving the tragedy. 63% of the  First Class Passengers survived the tragedy. While only 48% of the Second Passengers survived and only 24% of the Third Class Passengers survived. Please take note that this part of the analysis is limited to the fact that there is no direct relationship between socio-economic status and their class. In other words, we cannot be sure that First Class passengers are rich and the rest of the passengers are poor. It would be great to have more details about each passenger such as their occupation or income for example. I looked at the Ticket Fare, but it seems that some passengers had 0 Fare, which could mean many things hence could not be a great basis in this part of the analysis.
</p>

### Other factor affecting survival

<p>Looking at the data if a person with no siblings on the board, travelling with nanny and if his ticket fair is relatively low than he/she has more probablity of survival. Example: i have entered my own data as menthioned above in the last row of test.csv and as you can see in the result_test.csv i survieved due to the above factors.</p>
