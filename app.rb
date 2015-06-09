require('sinatra')
require('sinatra/reloader')
require('./lib/cat')
require('./lib/placement')

also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "animal"})


get('/') do
  erb(:index)
end
