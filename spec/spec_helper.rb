require('rspec')
require('stylist')
require('client')
require('pg')
require('pry')
require('rake')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end
