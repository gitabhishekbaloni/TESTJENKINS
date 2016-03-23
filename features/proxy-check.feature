Feature: Check whether a proxy file is getting created from the .mxf file.

@proxy
Scenario: When a .mxf file is put to file arrival, a proxy of the file shold be available. 

Given I have a test file at test repository location
When I push the file to file arrival location
Then I should see proxy file at the proxy location

