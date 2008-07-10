Story: change scaffolding levels for one student
  As a teacher
  I want to change the scaffolding level for a student
  So that I can alter the scaffolding the student sees
  
  Scenario: see controls for changing scaffolding level for one student
    Given there is one student in my class
    When I view the student's information
    Then I should see a control for changing the scaffolding level
    
  Scenario: set scaffolding level for one student
    Given a student's scaffolding level is "1"
    When I change his/her scaffolding level to "5"
    Then student's scaffolding level should be "5"
    
  Scenario: scaffolding level affects scaffolding for a student
    Given a student's scaffolding level is "1"
    When the student runs an activity
    Then the default scaffolding the student sees should be level "1"
    
Story: change scaffolding level for multiple students at once
  As a teacher
  I want to change the scaffolding level for multiple students
  So that I can efficiently manage my class
  
  Scenario: see controls for changing scaffolding level for multiple students
    Given there are multiple students in my class
    When I view my class list
    Then I should see a scaffolding level control beside each student
    
  Scenario: set scaffolding levels for multiple students
    Given there are 10 students in my class
      And the scaffolding level for each student is "1"
    When I change the scaffolding level for 2 students to "5"
    Then 8 students should have scaffolding level "1"
      And 2 students should have scaffolding level "5"
      
Story: change scaffolding level for an entire class
  As a teacher
  I want to change the scaffolding level for my all the students in my class
  So that I can efficiently manage my class
  
  Scenario: see controls for changing scaffolding level for a class
    Given I have at least one class
    When I view my class list
    Then I should see controls for changing scaffolding levels beside each class
    
  Scenario: see controls for changing scaffolding level for a class
    Given I have at least one class
    When I view the student list in one class
    Then I should see controls for changing scaffolding levels for entire class
    
  Scenario: set scaffolding levels for entire class with students
    Given there are 10 students in my class
      And each student's scaffolding level is "1"
    When I change the scaffolding level for the class to "5"
    Then all 10 students' scaffolding level should be "5"
    
  Scenario: class scaffolding levels sets scaffolding level for new students
    Given there are no students in my class
      And the class's scaffolding level is "5"
    When a student registers for my class
    Then the student's scaffolding level should be "5"