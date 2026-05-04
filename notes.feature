Feature: Create a note
Scenario: Successfully create a note
    Given Given the note payload with title “Test” and content "This is a
    note"
    When I send a request to create the note
    Then the response status code should be 200
    And the response should contain the correct title
 
  Scenario: Failed to create a note with invalid data
    Given API is running
    When I create a note with invalid data
    Then response status code is 422

Feature: Getting a list of notes 
  Scenario: Getting a list, when there are no notes
    Given API is running
    And there are no notes
    When I get all notes
    Then response status code is 200
    And response contains empty list
 
  Scenario: Getting a list when there are notes
    Given API is running
    And there is an existing note
    When I get all notes
    Then response status code is 200
    And response contains at least one note
  
Feature: Getting a note by id 
  Scenario: Getting a note with a valid id
    Given API is running
    And there is an existing note
    When I get note by valid id
    Then response status code is 200
    And response contains the note
  
  Scenario: Getting a note with an invalid id
    Given API is running
    When I get note by id 99999
    Then response status code is 404

Feature:  Editing a note by id
  Scenario: Editing a note based on a valid one id
    Given API is running
    And there is an existing note
    When I update the note with title "Updated Title" and content "Updated Content"
    Then response status code is 200
    And response contains note with title "Updated Title" and content "Updated Content"
  
  Scenario:Editing a note with an invalid id
    Given API is running
    When I update note with id 99999 with title "Updated" and content "Updated content"
    Then response status code is 404
 
Feature: Deleting a note by id
  Scenario:Deleting a note based on a valid one id
    Given API is running
    And there is an existing note
    When I delete the note
    Then response status code is 200
  
  Scenario: Deleting a note on an invalid id
    Given API is running
    When I delete note with id 99999
    Then response status code is 404