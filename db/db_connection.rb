require 'pg'

class DBConnection < PG::Connection
  def initialize
    super(
      dbname: 'chf_go_demo_development',
      port: 5432
    )
  end

  def execute(*args)
    exec(*args)
  end

  def execute_params(*args)
    exec_params(*args)
  end
end
