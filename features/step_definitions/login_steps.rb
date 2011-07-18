Given /^the following login_behaviors:$/ do |login_behaviors|
  LoginBehavior.create!(login_behaviors.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) login_behavior$/ do |pos|
  visit login_behaviors_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following login_behaviors:$/ do |expected_login_behaviors_table|
  expected_login_behaviors_table.diff!(tableish('table tr', 'td,th'))
end
