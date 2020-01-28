# read
def all_dishes
  sql = "SELECT * FROM dishes;"
  # implicit return
  run_sql(sql)
end

def find_one_dish_by_id(id)
  sql = "SELECT * FROM dishes WHERE id = $1;"
  run_sql(sql, [id])[0]
end

# optional
def find_one_dish(column, value)
  sql = "SELECT * FROM dishes WHERE #{column} = $1;"
  run_sql(sql, [value])[0]
end

# create
def create_dish(name, image_url, user_id)
  sql = <<~SQL
    INSERT INTO dishes 
    (name, image_url, user_id)
    VALUES
    ($1, $2, $3);
  SQL
  run_sql(sql, [name, image_url, user_id])
end

# destroy
def delete_dish(id)
  sql = "delete from dishes where id = $1;"
  run_sql(sql, [id])
end

# update
def update_dish(name, image_url, user_id)
  sql = <<~SQL
    update dishes 
    set 
    name = $1, 
    image_url = $2, 
    user_id = $3;
  SQL
  run_sql(sql, [name, image_url, user_id])
end
