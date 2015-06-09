# require("rspec")
# require("pg")
# require("placement")
#
# DB = PG.connect({:dbname => 'animal_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM placement *;")
#   end
# end
#
# describe(Placement) do
#   describe("#==") do
#     it("is the same placement if it has the same name") do
#       placement1 = Placement.new({:name => "Petco Tigard"})
#       placement2 = Placement.new({:name => "Petco Tigard"})
#       expect(placement1).to(eq(placement2))
#     end
#   end
# end
