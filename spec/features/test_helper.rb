def clear_database
  test_connection = PG.connect(dbname: "chitter_test")
  result = test_connection.exec("TRUNCATE TABLE chitter_table_test RESTART IDENTITY;")
  end
  