
# technical-interview

This repository contains a series of assignments designed to evaluate your skills in R, in particular in data manipulation, data visualisation, modelling, shiny development and debugging. 

You are free to use any online resource such as documentation or forums.

# Git Workflow

You'll follow the git workflow outlined in antoine-sachet/shinytest:

- Fork the repository and clone it
- Create a new branch TT_YourName (e.g. TT_Antoine)
- Make your commits as you go
- At the end of the assignment, push your commits to github

Note your repository will be public by default (since it is a fork of a public repo), however you are free to delete the repository as soon as I fetched your code.

# File convention

Raw data is provided in `data/`.

You should treat each assignment in a separate file, which could be R files or Rmd (R markdown) or any other appropriate format. You can create new files as needed at the root of the project.

Please put your output files (such as images or data exports), if any, in `output/`.

Please commit everything you want me to see as I'll only see what's committed.


# Assignment 1 (data manipulation & visualisation)

There are 3 CSV files in `data/` containing report, review and user data pertaining to a survey about brand sounds (sonic logos). A report is simply a survey: here, 1 report = 1 brand.

Reports have a unique ReportId, users have a unique UserId and reviews have a unique ReviewId. Each review is linked to a unique report and a unique user.

Each respondent listened to the sonic logo of a well-known brand (audio only, without any imagery) and was asked to:

- write down their thoughts (free-text comment, not available in this dataset)
- rate the sonic logo out of 10 (called "Appeal" in this dataset)
- rate how much they recognise the sonic logo / how familiar they are with the brand
- rate how closely the following 14 attributes apply to the sound, via a score on a 0-10 scale:
  Bold, Pure, Defiant, Fun-loving, Intense, Joyful, Majestic, Peaceful,
  Confident, Simple, Sophisticated, Spontaneous, Technical, Warm
  
We use these 14 attributes to determine the personality of a brand's sonic logo.

### 1.1 Compute the average attribute score for each brand

There is no need to weight the data by demographic, you can just take overall averages.
There are 30 reports and 14 attributes so you should have 30x14 scores in total.

### 1.2 Turn the attribute scores into Z-scores.

We want to see at a glance how a report is performing compared to all the other reports.
For each attribute, create Z-scores for all the reports.

You should have 30x14 Z-scores. For example, for the brand "Lidl" and the attribute "Bold", the Zscore is -1.79.

### 1.3 Prepare one or more graphs to show the difference in personality of the reports below. 

We are interested in comparing the personality perception of a few UK supermarket brands: 
Aldi, Lidl, ASDA, Tesco, Ocado.


### 1.4 Analyse the difference in appeal between M and F respondents for the Disney brand

Focusing on Disney, discuss whether there is a difference in Appeal between M and F respondents.

Note: GenderId is 1 for Males and 2 for Females

Even though Appeal is technically a discrete 0-10 score, you may treat it like a continuous variable and make any distributional assumption for the purpose of this question.

### 1.5 Familiarity vs Appeal

Is there a link between a respondent's familiarity with the brand and their appeal rating?
Is this relationship impacted by the gender of the respondent?

# Assignment 2 (predictive modelling)

Using the data from assignment 1, build a model predicting the Appeal of a report based on its attribute scores. Describe your validation framework and provide relevant performance metrics.

You can make any assumptions you wish.

# Assignment 3 (shiny app)

You are provided with a shiny app in `app.R` and you have access to the same 3 data files.

The app is supposed to show the ratings distribution for a given audio asset and attribute, looking at respondent-level data.

### 3.1 Fix the error

The app fails with the error "object of type 'closure' is not subsettable". Fix it!

> If you're stuck, look carefully at the trace provided alongside the error message - it should point you to the line causing the error.

### 3.2 Fix the bug

The attribute drop-down menu currently doesn't do anything. Fix it!

### 3.2 Select brand names rather than report ids

The drop-down menu currently shows the report id, but it would be more user-friendly to show the brand name instead. Fix it!

### 3.3 Improve the graph

The histogram is basic and not as useful as it could be - can you make it better? Or replace it with something better?


# Bonus Assignment

Please only treat this assignment if you've completed the previous assignments -- it is only there to keep you busy if you've finished early.

In this assignment, we are going to generate a lot of random data and look for "significant" differences (p<0.05). This will illustrate the problem with "p-hacking": one can always find significant results if they try hard enough.

### 4.1 Generate a list of 100 vectors (x_1, x_2, ...., x_100) of 20 random points drawn from a Normal distribution N(0, 1).

We'll pretend we have 100 groups each with 20 samples and we want to see if any two groups exhibit a significant mean difference, despite all originating from a N(0, 1) distribution.

### 4.2 Apply a T-test to all combinations of 2 groups (i.e. to each unique pair of vectors (x_i, x_j)).

How many show a significant difference (p < 0.05)? Was that expected?

What could you do to prevent these false positives when testing a large amount of combinations in practice?









