class UsersController < ApplicationController
  def create
    puts params

    if params[:password] == params[:password_confirmation]
      u = User.new(city_id:1, first_name:params[:first_name], last_name:params[:last_name], email:params[:email],password:params[:password])
      puts "*"*60
      puts u.password_digest
      puts "*"*60
      u.save
      redirect_to(root_path)
    else

    end

  end
  def new
    @user = User.new
  end
  def show
    id_params = params[:id].to_i
    @array_user = User.all
    @user = @array_user[id_params-1]

  end
end
