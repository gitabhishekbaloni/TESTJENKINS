Given(/^I have a test file at test repository location$/) do

begin
	visit('/')
	sleep 10
rescue Exception => e
	puts e.message
end
	
end

When(/^I push the file to file arrival location$/) do

end

Then(/^I should see proxy file at the proxy location$/) do

end