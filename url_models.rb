require 'mysql2'
require 'active_record'
require 'active_support/concern'

ActiveRecord::Base.establish_connection({
  adapter: 'mysql2',
  database: 'urls',
  host: 'localhost',
  username: 'root',
  encoding: 'utf8'
})

module URL
  extend ActiveSupport::Concern

  included do
    def url
      URI("#{scheme}://#{host}#{url_path}#{url_query}#{url_fragment}")
    end
  end

end

class Qdaily < ActiveRecord::Base
  self.table_name = 'qdaily'

  include URL

  scope :articles, -> { where('url_path like "/articles%.html%"') }

  def article_id
    m = url_path.match(/^\/articles\/(\d+)/)
    if m
      m[1]
    end
  end
end

class Tmt < ActiveRecord::Base
  self.table_name = 'tmt'

  include URL
end

