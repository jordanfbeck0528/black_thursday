This blog post will discuss psuedocode and strategies for tackling the methods best item for
merchant and most sold item for merchants.
- Best Sold Item for Mechant
To begin, the method takes in a merchant_id returns a singular item object.
Therefore, we will only be searching for one merchant at a time.
We will need to be comparing ALL items for any SINGULAR merchant.
We will also need to be making the comparison based on total revenue generated for that SPECIFIC item.
One idea we had is we coould use a hash where the key is an item and the value is a total revenue generated for that item.
First, we will find the highest value (which is revenue), then we will return that key, that key is the “best” item for that merchant
Next we will make an array of every time that the item is sold.
Then we will use the built in method reduce on that item array, so that we can find total revenue for that item.
So, next we must find out how many items were sold.
To find out how many items were sold, we implemented the following strategies and methods:
Our first step will be to find out how many time was that sale successful?
Next we will need to take the number of times that sale was successful and multiply that by the unit price
which is equal to the total revenue for item.
Our next step involves taking the given merchant id were we then go to find all other invoice id’s associated with that merchant.
At this point we will now  filter for invoices that have been paid in full and are also equal to true.
Finally we will then go into invoice items and we will tally all of the items there, then multiply items by their unit price.
This will give us the answer we are looking for as an item’s total revenue.
The very last step to finish this method will be to filter for highest total item revenue.

-Most Sold Item for Merchant
This method was quite difficult to figure out and required the use of multiple helper methods.
First we have to use our merchant id to find all the invoices associated with the merchant id in our invoice repository.
Then we have to use our invoice id to see which transactions were successful in our transaction repository. 
For the next step, we only want to use those transactions that were successful in the csv files.
Then go back to our invoice repository and use the invoice id to get to our invoice item repository to find the quantity 
of the items in each invoice from the previous step.
Then we filter through those quantities and grab either the single largest one item or we will grab multiple invoice items
if they are equal in quantity to each other.
For our penultimate step we will then use those final invoice items and grab our corresponding item id from each invoice item
and then go find our corresponding id for each item.
Lastly, we will then display all items in the given array for the final result of item(s) that were most sold by the merchant.
