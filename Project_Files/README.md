Summary - I have created a Dimplejs scatterplot visualizing Prosper Loan data
from 2007 to 2014. The x axis displays the number of loans for each loan
category, while the y-axis shows what the average income is of the folks
getting each loan type. The size of the bars on the right corresponds to the
average loan size of each year.


Design - I added a new variable to the data for the sake of the legend. I wanted
to show the loan type by its name instead of by the number through which it is
identified in the data. This makes the legend more clear. I used a default color
scheme to categorize the debt categories. Since its categorical data, it did not
make sense to me to further complicate the color scheme. I liked tying the
average loan size to the bars on the right because it shows an expansion of the
prosper business heading into 2008, a contraction, then a
corresponding increase coming out of the recession. I used a scatter plot
because it most easily demonstrates the relationship amongst the different
types of loans offered by prosper. Additionally, it allows for me to easily show
the differences between specialty loan types and the more conventional ones, like
debt consolidation, auto, and home improvement.



Feedback -
1) Labeling the x and y axes more clearly. I could tell their were categories,
but what we were looking at wasn't clear.

2) The large number of debt consolidation loans is interesting, in addition to
all the different categories of loans people take out.

3) The design looked good, but I think the design looks good. Be sure to use
better labeling to make the chart more clear.

4) When the animation gets to 2014, it skips back down to 2012 and then down
to 2007 and circles back up to 2014. See if you can eliminate the intermittent
skip and simply return the animation back to 2007.

5)Suggestion from someone in slack group to make it so the buttons contain the
entire number on the right side. That change was made to improve the design.

Resources -

Obtaining loan year origination in R:
http://stackoverflow.com/questions/17215789/extract-a-substring-in-r-according-to-a-pattern

Remove duplicates in a dataset in R:
http://www.sthda.com/english/wiki/identifying-and-removing-duplicate-data-in-r

adding axes to the chart
http://alignedleft.com/tutorials/d3/axes

Code used as base for creating bubble chart
https://jrue.github.io/coding/2014/exercises/basicbubblepackchart/

Code used as example for Dimple.js chart
http://dimplejs.org/advanced_examples_viewer.html?id=advanced_storyboard_control

Add title to Dimple.js chart
http://simondfletcher.com/add-a-title-to-a-dimple-js-chart/
