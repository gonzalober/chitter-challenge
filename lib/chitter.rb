require 'pg'
require_relative './connection'

class PeepList
  attr_reader :id, :text, :created_date, :name, :user_handle

  def initialize(id, text, created_date, name, user_handle)
    @user_handle = user_handle
    @name = name
    @created_date = created_date
    @text = text
    @id = id
  end

  def self.all
    @connection = PG.connect(dbname: Connection.database_name)
    result = @connection.exec("SELECT * FROM chitter_table")
    result.map { |row| 
      PeepList.new(row["id"], row["text"], row["created_date"], row["name"], row["user_handle"])
    }    
  end

  def self.create(text, created_date, name, user_handle)
    @connection = PG.connect(dbname: Connection.database_name)
    @connection.exec("INSERT INTO chitter_table (text, created_date, name, user_handle) VALUES ('#{text}', NOW(),'#{name}','#{user_handle}');")
  end

  def self.delete(id)
    @connection = PG.connect(dbname: Connection.database_name)
    @connection.exec "DELETE FROM chitter_table WHERE id = #{id}"
  end

end
