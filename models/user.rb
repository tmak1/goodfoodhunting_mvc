
# read
def all_users
  sql = "SELECT * FROM users;"
  # implicit return
  run_sql(sql)
end

def find_one_user_by_email(email)
  sql = "SELECT * FROM dishes WHERE email = $1;"
  run_sql(sql, [email])[0]
end

# create
require 'bcrypt'
def create_user(email, password)
  password_digest = BCrypt::Password.create(password)

  sql = <<~SQL
    INSERT INTO users 
    (email, password_digest)
    VALUES
    ($1, $2);
  SQL
  run_sql(sql, [email, password_digest])
end

# delete - todo
# update - todo