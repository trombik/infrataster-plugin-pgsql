require 'rspec'
require 'infrataster/resources'

module Infrataster
  module Helpers
    module ResourceHelper
      def pgsql_query(*args)
        Resources::PgsqlQueryResource.new(*args)
      end
    end
  end
end

