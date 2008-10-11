ActiveRecord::ConnectionAdapters::SQLite3Adapter.class_eval do
  def truncate(table_name)
    delete_sql(%(delete from "sqlite_sequence" where name='#{table_name}'))
    delete_sql(%(delete from "#{table_name}"))
  end
end

ActiveRecord::Base.class_eval do
  def self.truncate
    connection.truncate(table_name)
  end
end