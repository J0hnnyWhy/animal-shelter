class Cat

  attr_reader(:id, :name, :age, :gender, :color)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @age = attributes.fetch(:age)
    @gender = attributes.fetch(:gender)
    @color = attributes.fetch(:color)
    # @admin_date = attributes.fetch(:admin_date)
    # @vax_date = attributes.fetch(:vax_date)

  end

  define_singleton_method(:all) do
    returned_cats = DB.exec("SELECT * FROM cats;")
    cats = []
    returned_cats.each() do |cat|
      id = cat.fetch("id").to_i
      name = cat.fetch("name")
      age = cat.fetch("age").to_i
      gender = cat.fetch("gender")
      color = cat.fetch("color")
      # admin_date = cat.fetch("admin_date")
      # vax_date = cat.fetch("vax_date")
      cats.push(Cat.new({:id => id, :name => name, :age => age, :gender => gender, :color => color}))
    end
    cats
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO cats (name, age, gender, color) VALUES ('#{@name}', #{@age}, '#{@gender}', '#{@color}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

    define_method(:==) do |another_cat|
    self.name().==(another_cat.name()).&(self.id().==(another_cat.id()))
  end

  define_method(:edit) do |attributes|
    # @id = self.id
    # @name = attributes.fetch(:name)
    # @age = attributes.fetch(:age)
    # @gender = attributes.fetch(:gender)
    # @color = attributes.fetch(:color)
    DB.exec("UPDATE cats SET (name, age, gender, color) VALUES ('#{@name}', #{@age}, '#{@gender}', '#{@color}') WHERE id = #{@id};")
  end
end
