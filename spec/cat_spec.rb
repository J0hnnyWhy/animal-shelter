require("rspec")
require("pg")
require("cat")
require('pry')

DB = PG.connect({:dbname => 'animal_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cats *;")
  end
end



describe(Cat) do
    describe('#initialize','#attr_reader') do
    it("returns the details of a cat") do
      test_cat = Cat.new({id: nil, name: "Bill", age: 2, gender: "male", color: "tabby"})
      expect(test_cat.name()).to(eq("Bill"))
      expect(test_cat.age()).to(eq(2))
      expect(test_cat.gender()).to(eq("male"))
      expect(test_cat.color()).to(eq("tabby"))
      # expect(test_cat.admin_date()).to(eq("04/15/2015"))
      # expect(test_cat.vax_date()).to(eq("05/12/2015"))
    end
  end

  describe("#save") do
    it("adds a cat to the array of saved cats") do
      test_cat = Cat.new({id: 33, name: "Bill", age: 2, gender: "male", color: "tabby"})
      test_cat.save
      expect(Cat.all).to(eq([test_cat]))
    end
  end

describe('.all') do
  it("returns all of the saved cats, and an empty array if there are none in the database") do
    # test_cat = Cat.new({name: "Bill", age: 3, gender: "male", color: "tabby"})
    # test_cat.save
    # test_cat2 = Cat.new({name: "Will", age: 3, gender: "male", color: "tabby"})
    # test_cat2.save
    expect(Cat.all()).to(eq([]))
  end
end

  describe("#==") do
    it("is the same cat if it has the same name") do
      cat1 = Cat.new({id: nil, name: "Bill", age: 3, gender: "male", color: "tabby"})
      cat2 = Cat.new({id: nil, name: "Bill", age: 3, gender: "male", color: "tabby"})
      expect(cat1).to(eq(cat2))
    end
  end

  describe("#edit") do
    it('will edit the information about a cat') do
      test_cat = Cat.new({id: nil, name: "Princess", age: 13, gender: "female", color: "grey"}).save
      test_cat.edit({id: nil, name: "Demon", age: 9, gender: "female", color: "grey"})
      expect(test_cat.name).to(eq('Demon'))
      expect(test_cat.age).to(eq(9))
    end
  end
end
