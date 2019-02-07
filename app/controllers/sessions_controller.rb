class SessionsController < ApplicationController
  def create
    puts "*"*60
    puts params
    puts "*"*60
    #verifie si l email du formulaire existe dans la bae de données
    if User.find_by(email:params[:email])
      my_user = User.find_by(email:params[:email])
      puts "#"*60
      puts "Bon email"
      puts "#"*60
      #verifie si le passeword du login est égale a celui de la base de données
      if my_user.authenticate(params[:password])
        puts "#"*60
        puts "activation de session"
        puts "#"*60
        session[:user_id] = my_user.id
        redirect_to(root_path)

      else
        puts "#"*60
        puts "mauvaise mdp"
        puts "#"*60
        flash.now[:danger] = "Invalid email/password combination"
      end

    else
      puts "Email inconnu"
      redirect_back(fallback_location:new_session_path )
        flash.now[:danger] = "Invalid email/password combination"


    end

  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
    else
      puts "nothing to delete"
    end
  end
end
