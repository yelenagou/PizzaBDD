Feature: As a Customers I want to view existing pizzas So I can find the one I like


Background:
	Given Unregistered user navigates to http://mypizzaurl.com/list.html
    And following pizzas exist:
    |Pizza Name| Pizza Description|Pizza Size|
    |Veggie Garden| Pizza for veggie lovers with fresh onions, roma tomatoes, spinach, cheese, light tomato sauce|small, medium, large|
    |Protein Galore| Pizza for meat lovers with pepperoni, sausage, bacon, tomaotes, olives, rich tomato sauce, with our traditional mozzarella|small, medium, large|
    |Triple Cheese| Extra cheese for cheese lovers. This pizza is loaded with our traditional mozzarella, cheddar, and provolne with our rich tomato sauce| personal, small, medium, large|
    And following prices:
    |Pizza Name| Pizza Size | Pizza Price|
    |Veggie Garden|small|18.00|
    |Veggie Garden|medium|20.00|
    |Veggie Garden|large|22.99|
    |Protein Galore|small|18.00|
    |Protein Galore|medium|20.00|
    |Proteing Galore|large|22.99|
    |Triple Cheese|personal|10.00|
    |Triple Cheese|small|18.00|
    |Triple Cheese|medium|20.00|
    |Triple Cheese|large|22.99|
    
    
Scenario: Unregistered user views all the available pizzas
	When page is loaded request is made for all the available pizzas
    Then a response is returned with all the available pizzas
    And a page is rendered with all the available pizzas:
    |Pizza Name| Pizza Description|Pizza Size|Pizza Price|
    |Veggie Garden| Pizza for veggie lovers with fresh onions, roma tomatoes, spinach, cheese, light tomato sauce|small, medium, large|18.00, 20.00, 22.99|
    |Protein Galore| Pizza for meat lovers with pepperoni, sausage, bacon, tomaotes, olives, rich tomato sauce, with our traditional mozzarella|small, medium, large|18.00, 20.00, 22.99|
    |Triple Cheese| Extra cheese for cheese lovers. This pizza is loaded with our traditional mozzarella, cheddar, and provolne with our rich tomato sauce| personal, small, medium, large|10.00, 18.00, 20.00, 22.99|
    
Scenario: Unregistered user wants to sort pizzas by price

    When page is loaded request is made for all the available pizzas
    And a response is returned with all the available pizzas
    And a page is rendered with all the available pizzas:
    |Pizza Name| Pizza Description|Pizza Size|Pizza Price|
    |Veggie Garden| Pizza for veggie lovers with fresh onions, roma tomatoes, spinach, cheese, light tomato sauce|small, medium, large|18.00, 20.00, 22.99|
    |Protein Galore| Pizza for meat lovers with pepperoni, sausage, bacon, tomaotes, olives, rich tomato sauce, with our traditional mozzarella|small, medium, large|18.00, 20.00, 22.99|
    |Triple Cheese| Extra cheese for cheese lovers. This pizza is loaded with our traditional mozzarella, cheddar, and provolne with our rich tomato sauce| personal, small, medium, large|10.00, 18.00, 20.00, 22.99|
    And user selects "ascending" from the order by
    Then a list of pizzas is refreshed in price order:
     |Pizza Name| Pizza Size | Pizza Price|
    |Triple Cheese|personal|10.00|
    |Protein Galore|small|18.00|
   	|Triple Cheese|small|18.00|
    |Veggie Garden|small|18.00|  
    |Protein Galore|medium|20.00|
    |Triple Cheese|medium|20.00|
    |Veggie Garden|medium|20.00|
    |Triple Cheese|large|22.99|
    |Proteing Galore|large|22.99|
    |Veggie Garden|large|22.99|
