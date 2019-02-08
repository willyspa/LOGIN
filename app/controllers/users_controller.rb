class UsersController < ApplicationController
  def create
    "@"*60
    puts params
      "@"*60


    if params[:password] == params[:password_confirmation]
      my_city = City.find_by(name:params[:name])

      u = User.new(city_id:my_city.id, first_name:params[:first_name], last_name:params[:last_name], email:params[:email],password:params[:password])
      puts "*"*60
      puts u.password_digest
      puts "*"*60
      u.save
      redirect_to(root_path)
    else

    end

  end
  def new
    @city = City.all
    @user = User.new
  end
  def show
    @city = City.all
    id_params = params[:id].to_i
    @array_user = User.all
    @user = @array_user[id_params-1]

  end
end
