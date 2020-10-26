class Connection
  def self.database_name
    if ENV['RACK_ENV'] == 'test'
      'chitter_test'
    else
      'chitter'
    end
  end
  end
