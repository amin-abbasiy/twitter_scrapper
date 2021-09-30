require 'sequel'
require 'logger'
require 'pg'
require_relative '../../initialize/app'
class Database
  class << self
    def connect_and_create_db
      config = ::APP::DB_FILE
      Sequel.connect(adapter: :postgres, user: ENV.fetch('DB_USER', config['DB_USER']),
                     password: ENV.fetch('DB_PASSWORD', config['DB_PASSWORD']), host: ENV.fetch('DB_HOST', config['DB_HOST']),
                     port: ENV.fetch('DB_PORT', config['DB_PORT']), database: ENV.fetch('DB_NAME', config['DB_NAME'])) do |db|
        db.execute('CREATE DATABASE twitter_scrapper;')
      end
    end
    def connection
      config = ::APP::DB_FILE
      Sequel.connect(adapter: :postgres, user: ENV.fetch('DB_USER', config['DB_USER']),
                          password: ENV.fetch('DB_PASSWORD', config['DB_PASSWORD']), host: ENV.fetch('DB_HOST', config['DB_HOST']),
                          port: ENV.fetch('DB_PORT', config['DB_PORT']), database: ENV.fetch('DB_NAME', config['DB_NAME']),
                          max_connections: 20, logger: Logger.new("#{APP::ROOT_DIR}/../log/db.log"))

    end
  end
end