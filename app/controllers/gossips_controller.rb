class GossipsController < ApplicationController

before_action :authenticate_user, only: [:index]

  def index
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts  params[:first_name]
    puts "$" * 60
    @first_name = params[:first_name]
    @gossips = Gossip.all


  end

  def show
    puts "$" * 60
    puts params[:id]
    puts "$" * 60
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def create
    puts "k"*60
    puts params
    puts "k"*60

    g = Gossip.new(user_id:session[:user_id],title:params[:title],content:params[:content])


  if g.save
    redirect_to(root_path)
    puts "SAAAAVVVVVVEEEE "
  end

  end




  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private

 def authenticate_user
   unless session[:user_id]
     flash[:danger] = "Please log in."
     redirect_to new_session_path
   end

 end

end
