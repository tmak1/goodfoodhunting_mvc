# restful routing
post '/dishes' do
  raise params.to_json

  create_dish(
    params[:name], 
    params[:image_url], 
    current_user['id']
  )
  redirect "/"
end

get '/dishes/new' do
  erb :"/dishes/new"
end

get '/dishes/:id' do
  @dish = find_one_dish_by_id(params[:id])
  sql = "select count(*) as likes_count from likes where dish_id = $1"
  @likes_count = run_sql(sql, [params[:id]])[0]['likes_count']
  erb :"/dishes/show"
end

