

post '/dishes' do
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
  erb :"/dishes/show"
end

