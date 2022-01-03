# RobotFramework_example

## Test suites

### CheckLocation.robot

This test suite shows the evolution from traditional RobotFramework keyword driven test cases to Gherkin scenarios.

### CheckLocation_Gherkin_Scenarios.robot

This test suite shows examples of Gherkin scenarios in RobotFramework

### CheckLocation_Gherkin_Scenarios_location_resource.robot

This test suite shows examples of Gherkin scenarios in RobotFramework while using a library that is shared with Behave scenarios
See: https://github.com/Gerard-A/Behave_example

### CheckLocation_Gherkin_Scenario_Outline.robot

This test suite shows examples of how to map Gherkin Scenario Outlines to RobotFramework data driven test cases.

## Test execution

Prerequisites: 
- python 3 must be installed on your system. 
- All required python packages are installed on your system or in a "virtual environment" (See https://docs.python.org/3/library/venv.html).
  To install the required packages run `pip install -r requirements.txt`

To run the tests, execute commands:  
- `runTest.bat`  to run all tests
- `runSmokeTest.bat` to run all test cases that are tagged with 'SmokeTest'
- `runNightTest.bat` to run all test cases that are tagged with 'NightTest'
