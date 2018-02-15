class FormSubmission
  require 'rubygems'  #import modules
  require 'watir-webdriver'
  require 'gastly'
  require 'webdriver-user-agent'
  require 'watir-scroll'
  require 'digest/md5'
  require 'RMagick'
  require 'watir'
  require 'watir-webdriver-performance'


  def self.FormTest
    # Chrome Test
    # Using Chrome this goes to google, submits a search query then screenshots the following results
    $i = 1
    b = Watir::Browser.new :chrome  # call the web driver
    b.goto 'http://www.google.com'  # insert URL
   
    text_field = b.text_field id: 'lst-ib' # search for input form box
    if text_field.exists?  # if the text field is found
      text_field.set 'Insert form submission text' # set text
    end
    # You can create more loops of the above statement to input text into multiple boxes before hitting submit
    
    old_title = b.title   # store old title

    btn = b.button name: 'btnK' # search for name of button
    if btn.exists?  # if button is found
      btn.click   # click button
    else
      puts "Button Not Found!"
      exit
    end

    Watir::Wait.until { b.title != old_title } # wait until the page title changes to confirm load
    puts b.title  # print out new page title
  end

  FormTest()
end