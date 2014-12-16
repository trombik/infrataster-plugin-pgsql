require 'infrataster'
require 'pg'

module Infrataster
  module Contexts
    class PgsqlQueryContext < BaseContext
      def result
        options = {port: 5432, user: 'postgres', password: '', dbname: ''}
        if server.options[:pgsql]
          options = options.merge(server.options[:pgsql])
        end

        server.forward_port(options[:port]) do |address, new_port|
          connect = PG::Connection.new(
            :host => address,
            :port => new_port,
            :user => options[:user],
            :password => options[:password],
            :dbname => options[:dbname]
          )
	  connect.exec(resource.query) 
        end
      end
      def connection
        options = {port: 5432, user: 'postgres', password: '', dbname: ''}
        if server.options[:pgsql]
          options = options.merge(server.options[:pgsql])
        end

        server.forward_port(options[:port]) do |address, new_port|
          connect = PG::Connection.new(
            :host => address,
            :port => new_port,
            :user => options[:user],
            :password => options[:password],
            :dbname => options[:dbname]
          )
        end
      end
    end
  end   
end 
