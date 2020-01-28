require 'pg'

def run_sql(sql, args = [])
  conn = PG.connect(dbname: 'goodfoodhunting')
  results = conn.exec_params(sql, args)
  conn.close
  results
end
