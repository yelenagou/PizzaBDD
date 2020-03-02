Feature: 
As an Admin Authenticated customer
I want to Navigate to the administer site page to add new topings
So I can offer more options to the customer

 Background: 
    Given registered customer user navigates to http://mypizzaurl.com/login.html
    |user id|password|
    |admin|adminpass|
    And clicks on the "Administer Site" link
    And following topings are available:
  |topings|
  |pepperoni|
  |sausage|
  |bacon|
  |black olives|
  |green olives|
  |fresh green pepper|
  |fresh red pepper|
    
      
  Scenario: Registered  Customer is adding a new pizza
 
  When a page with a title "Add New Pizza" is displayed
  Then a list of available pizzas is displayed with a plus sign to add to cart:
    | Pizza Name     | Pizza Description                                                                                                                      | Pizza Size                     | Pizza Price                | 
      | Veggie Garden  | Pizza for veggie lovers with fresh onions, roma tomatoes, spinach, cheese, light tomato sauce                                          | small, medium, large           | 18.00, 20.00, 22.99        | 
      | Protein Galore | Pizza for meat lovers with pepperoni, sausage, bacon, tomaotes, olives, rich tomato sauce, with our traditional mozzarella             | small, medium, large           | 18.00, 20.00, 22.99        | 
      | Triple Cheese  | Extra cheese for cheese lovers. This pizza is loaded with our traditional mozzarella, cheddar, and provolne with our rich tomato sauce | personal, small, medium, large | 10.00, 18.00, 20.00, 22.99 | 
  And a "Create Your Own Pizza" link is available
  
  Scenario: Registered  Customer views available pizza options

   When user clicks on the "Create Your Own Pizza" link
   Then a page with title "Create Your Own Pizza" is displayed with following options:
   |Options|
   |Size|
   |Toppings|
   And following sizes are displayed on the page:
   |Size|
   |Small|
   |Medium|
   |Large|
   |Extra Large|
   And all the available topics are displayed on the page
  
 Scenario: Registered Authenticated User Create Custom Pizza Order
 
 User selects pizza toping, but does not select size


   Given user clicks on the "Create Your Own Pizza" link
   And sizes are displayed:
   |Size|
   |Small|
   |Medium|
   |Large|
   |Extra Large|
   And toppings are displayed
   When user selects "pepperoni" 
   And clicks "Add" button
   And clicks "Submit" button
   Then a message is displayed "Please select size"
   
   Scenario: Authenticated Registered User Create Custom Pizza Order
   
   User selects size and one pizza topping 

   Given user clicks on the "Create Your Own Pizza" link
   And sizes are displayed:
   |Size|
   |Small|
   |Medium|
   |Large|
   |Extra Large|
   And toppings are displayed
   When user selects "large" from choice of sizes
   And user selects "pepperoni" from choice of topings
   And clicks "Add" button
   And clicks "Submit" button
   Then a message is displayed "Pizza is added to your order"
   And an order saved:
   
      |Order Description|User Id |Order Status|Order Date and Time|
      |Pizza, Large, Pepperoni, Regular Sauce, Mozzarella|lenags|submitted|03-01-2020:17:00:33:00|
      
       
Scenario: Authenticated Registered User selects an existing pizza and adds a custom order 
   
   User selects one of an existing pizzas and custom one topping pizza
   
  Given a page with a title "Add New Pizza" is displayed
  And a list of available pizzas is displayed with a plus sign to add to cart:
    | Pizza Name     | Pizza Description                                                                                                                      | Pizza Size                     | Pizza Price                | 
      | Veggie Garden  | Pizza for veggie lovers with fresh onions, roma tomatoes, spinach, cheese, light tomato sauce                                          | small, medium, large           | 18.00, 20.00, 22.99        | 
      | Protein Galore | Pizza for meat lovers with pepperoni, sausage, bacon, tomaotes, olives, rich tomato sauce, with our traditional mozzarella             | small, medium, large           | 18.00, 20.00, 22.99        | 
      | Triple Cheese  | Extra cheese for cheese lovers. This pizza is loaded with our traditional mozzarella, cheddar, and provolne with our rich tomato sauce | personal, small, medium, large | 10.00, 18.00, 20.00, 22.99 | 
 When user selects a "Veggie Garden" "large" pizza
 And clicks on "Create Your Own Pizza" link
 And selects "Pepperoni" "Large" pizza 
 And clicks "Add" button 
 And clicks "Submit" button
 Then a message is displayed "Your order has been added"
 And an order is saved with current date and time
  |Order Description|User Id |Order Status|
      |Pizza, Large, Pepperoni, Regular Sauce, Mozzarella|lenags|submitted|
      |Veggie Garden, large|lenags|submitted|
      And Order Date and Time is captured and stored
      
Scenario: Authenticated Registered User Review Order
   
   User selects one of an existing pizzas and custom one topping pizza and reviews the order
   
  Given a page with a title "Add New Pizza" is displayed
  And a list of available pizzas is displayed with a plus sign to add to cart:
    | Pizza Name     | Pizza Description                                                                                                                      | Pizza Size                     | Pizza Price                | 
      | Veggie Garden  | Pizza for veggie lovers with fresh onions, roma tomatoes, spinach, cheese, light tomato sauce                                          | small, medium, large           | 18.00, 20.00, 22.99        | 
      | Protein Galore | Pizza for meat lovers with pepperoni, sausage, bacon, tomaotes, olives, rich tomato sauce, with our traditional mozzarella             | small, medium, large           | 18.00, 20.00, 22.99        | 
      | Triple Cheese  | Extra cheese for cheese lovers. This pizza is loaded with our traditional mozzarella, cheddar, and provolne with our rich tomato sauce | personal, small, medium, large | 10.00, 18.00, 20.00, 22.99 | 
 And user selects a "Veggie Garden" "large" pizza
 And clicks on "Create Your Own Pizza" link
 And selects "Pepperoni" "Large" pizza 
 And clicks "Add" button 
 And clicks "Submit" button
 And a message is displayed "Your order has been added"
 And an order is saved with current date and time:
  |Order Description|User Id |Order Status|
      |Pizza, Large, Pepperoni, Regular Sauce, Mozzarella|lenags|submitted|
      |Veggie Garden, large|lenags|submitted|
 When user click on the "Review Your Order"
 Then the order is displayed on the page in the following format:
 |Order Name|Order Description| Order Ingredients|
 |Custom Pizza| Large|Mozarella, Tomatoe Sauce, Pepperoni, Olive Oil|
 |Veggie Garden|Large|Mozarella, Tomatoe Sauce, Onions, roma tomatoes, spinach, Olive Oil|
   
 