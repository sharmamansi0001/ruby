require 'rest-client'
require 'json'
require 'rubygems'
require 'selenium-webdriver'
require 'action_controller'

class TechTask
#retrieve firstname and last name from API
def apiTest
  response = RestClient.get "https://swapi.co/api/people/1"
  
  puts response.code
  puts response.headers
  puts response.body
  
  obj = JSON.parse(response)
  sv1 = obj['name']
    
  puts "The full name is: "+sv1
   
  name=sv1.split(' ')
  first_name=name.first
  last_name=name.last
  puts "First name is: "+first_name
  puts "Last name is: "+last_name
  return first_name, last_name
end
#retrieve a number from one array
def puzzleTest1
  array1=[22,24,0,100,4,111,2602,18]
  i = 0
  while i<=array1.length  do
     if(array1[i]%2 !=0)
       puts array1[i] 
       return array1[i]
       end
     i +=1
  end
end
#retrieve a number from second array
def puzzleTest2
  array2=[60,33,1719,25,19,13,-21]
  i = 0
  while i<=array2.length  do
     if(array2[i]%2 ==0)
       puts array2[i] 
       return array2[i]
       end
     i +=1
  end
end

end
initialize = TechTask.new
first_name2, last_name2 = initialize.apiTest

#initialize1 = TechTask.new
value1 = initialize.puzzleTest1

#initialize2 = TechTask.new
value2 = initialize.puzzleTest2

Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\Rishi\\Downloads\\chromedriver_win32\\chromedriver.exe"
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize
driver.navigate.to "http://www.seleniumeasy.com/test/input-form-demo.html"
sleep 3

#fill all the details in the form
#first name and last name is taken from the API
if driver.find_element(:name, 'first_name').displayed?
  driver.find_element(:name, 'first_name').send_keys first_name2
  puts "first name is entered successfully as     " + first_name2
else
  puts "first name is not entered"
end

if driver.find_element(:name, 'last_name').displayed?
  driver.find_element(:name, 'last_name').send_keys last_name2
  puts "last name is entered successfully as      " + last_name2
else
  puts "last name is not entered"
end

if driver.find_element(:name, 'email').displayed?
  driver.find_element(:name, 'email').send_keys 'gwgdjjhwbdh@gmail.com'
  puts "email is entered successfully"
else
  puts "email is not entered"
end

if driver.find_element(:name, 'phone').displayed?
  driver.find_element(:name, 'phone').send_keys '6823628763'
  puts "phone is entered successfully"
else
  puts "phone is not entered"
end

if driver.find_element(:name, 'address').displayed?
  driver.find_element(:name, 'address').send_keys '97 gdugdef'
  puts "address is entered successfully"
else
  puts "address is not entered"
end

if driver.find_element(:name, 'city').displayed?
  driver.find_element(:name, 'city').send_keys 'vsghdv'
  puts "city is entered successfully"
else
  puts "city is not entered"
end

if driver.find_element(:name, 'zip').displayed?
  driver.find_element(:name, 'zip').send_keys 'NE6  5DY'
  puts "zip is entered successfully"
else
  puts "zip is not entered"
end

if driver.find_element(:name, 'website').displayed?
  driver.find_element(:name, 'website').send_keys 'svgdvgjhw'
  puts "website is entered successfully"
else
  puts "website is not entered"
end

#text in the comment to be taken from puzzle that is 11160
if driver.find_element(:name, 'comment').displayed?
  driver.find_element(:name, 'comment').send_keys value1, value2
  puts "comment is entered successfully as"
else
  puts "comment is not entered"
end

if driver.find_element(:xpath => "//*[@name='hosting' and @value='no']").displayed?
  driver.find_element(:xpath => "//*[@name='hosting' and @value='no']").click()
  puts "value 'No' is selected successfully"
else
  puts "value 'No' is not selected"
end

#select Florida from the state dropdown
if driver.find_element(:name, 'state' ).displayed?
  options = driver.find_elements(:tag_name, 'option')
  options.each do |e1|
    if(e1.text == ' Florida')
      e1.click
      puts "Florida is selected"
      break
    end
  end
end

#submit
if driver.find_element(:xpath => "//*[@type='submit' and @class='btn btn-default']").displayed?
  driver.find_element(:xpath => "//*[@type='submit' and @class='btn btn-default']").click()
  puts "submit button is clicked"
else
  puts "submit button is not clicked"
end

#validating the heading
if driver.find_element(:xpath => "//h2[contains(text(),'Input form with validations')]").displayed?
  text = driver.find_element(:xpath => "//h2[contains(text(),'Input form with validations')]").text
end
if text == "Input form with validations"
  puts "'Input form with validations' is displayed"
end

#closing the browser
driver.quit