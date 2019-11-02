class UsersController < ApplicationController

  # user login
  get "/login" do
    erb :'login'
  end  

  post "/login" do
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else

      redirect to '/login'
    end
  end

  # user signup
  get "/signup" do
    erb :'signup'
  end

  post "/users" do
    @user = User.new(params)
    if @user.save
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
    else
      redirect '/signup'
    end
  end

  # user show page - lists the available options: 
  # write new, show all and logout
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

 # user logout
  post '/logout' do
    session.clear
    redirect '/'
  end

end
