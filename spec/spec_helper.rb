require("rspec")
require("pg")
require("cat")
# require("placement")

DB = PG.connect({:dbname => "animal_test"})

RSpec.configure do |config|
  config.after(:each) do
    # DB.exec("DELETE FROM cats *;")
    # DB.exec("DELETE FROM placements *;")
  end
end
