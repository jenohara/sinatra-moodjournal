class UsersController < ApplicationController

# user login
  get "/login" do
    erb :'login'
  end  

  post "/login" do
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
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
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
  end

  get '/users/:id' do
    "this will be the users show route"
  end


#   # GET: /users/5
#   # get "/users/:id" do
#   #   @user = User.find_by(username: params[:username])
#   #   erb :"/users/show.html"
#   # end

#   # GET: /users/5/edit
#   get "/users/:id/edit" do
#     erb :"/users/edit.html"
#   end

#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/"
#   end




#  # user logout
#   get '/sessions/logout' do
#     session.clear
#     redirect '/'
#     end
#   end
end
