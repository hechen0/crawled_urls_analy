require 'mysql2'
require 'active_record'

ActiveRecord::Base.establish_connection({
  adapter: 'mysql2',
  database: 'urls',
  host: 'localhost',
  username: 'root',
  encoding: 'utf8'
})

class Qdaily < ActiveRecord::Base
  self.table_name = 'qdaily'
end

class Tmt < ActiveRecord::Base
  self.table_name = 'tmt'
end

