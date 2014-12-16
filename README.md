# infrataster-plugin-pgsql

PgSQL plugin for [Infrataster]

## Pre-requisite
1. postgresql-libs and postgresql-devel should be installed

## Installation
Install infrataster-plugin-pgsql by following command
   
    #gem install infrataster-plugin-pgsql

Add this line to your Gemfile:

    gem 'infrataster-plugin-pgsql'

And then add the following line to your spec\_helper.rb:

    require 'infrataster-plugin-pgsql'

## Usage

```ruby
describe server(:db) do
  describe pgsql_query('SELECT * from pg_stat_activity') do
    it 'should allowed connection' do
      connection.status.should == PG::CONNECTION_OK
    end
    it 'should show database name' do
      row = result.find{|r| r['usename'] == 'postgres'}
      expect(row['datname']).to be == 'postgres'
    end
  end
end

describe server(:dbtest) do
  describe pgsql_query('SHOW PORT') do
    it 'connection refused' do 
      expect { connection.status }.to raise_error( PG::ConnectionBad, /could not connect to server: Connection refused/ )
    end
  end
end
```

You can specify username and password by options passed to `Infrataster::Server.define`:

```ruby
Infrataster::Server.define(
  :db,
  '172.26.126.70',
  pgsql: {user: 'postgres', password: 'postgres'},
  )
```
