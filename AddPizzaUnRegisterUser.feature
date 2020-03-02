Feature: 
As a Customer
I want to Register 
So I can create a new pizza and place an order

 Background: 
    Given unregistered user navigates to http://mypizzaurl.com/list.html
    And clicks on create a new pizza link
  
  Scenario: Unregistered user user wants to create a new pizza
  Then a page with a title "Login and Register" is displayed
  
  Scenario: User registers with mypizzaurl.com to be able to add a new pizza
  When user enters "first name", "last name", valid "email address", valid "delivery address":
  |first name|last name|email address|delivery address|
  |Lena|Gouralnik|lenags@gmail.com|5 Main Street, Phoenix, AZ|
  And clicks "Register" button
  Then a registered user is added
  And "add new pizza" page is displayed
