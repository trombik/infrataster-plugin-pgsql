require 'spec_helper'

describe server(:db) do
  describe pgsql_query('SELECT * from pg_stat_activity') do
    it 'should allowed connection' do
    #Testing connection
     connection.status.should == PG::CONNECTION_OK
    end
    it 'should show database name' do
    #Testing result
      row = result.find{|r| r['usename'] == 'postgres'}
      expect(row['datname']).to be == 'postgres'
    end
  end
 
  describe pgsql_query('SELECT * from test1') do
    it 'should show value' do
      row = result.values
      row.should include(["55"])
    end
  end
end
