# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Headblog::Application.initialize!

# set the default date format.
Date::DATE_FORMATS[:default] = '%d/%m/%Y'
