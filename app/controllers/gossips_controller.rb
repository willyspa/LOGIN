class GossipsController < ApplicationController
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
    @anonymous = User.create!(city_id: City.all.sample.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::SiliconValley.quote, email: Faker::Internet.email, age: Faker::Number.between(1, 100))
    puts @anonymous.id
    puts title:params[:title]
    @gossip = Gossip.new(user_id: @anonymous.id, city_id: @anonymous.city_id, title:params[:title], content:params[:content])
    if @gossip.save
    puts 'redirect'
    flash[:success] = "Bravo, ton potin a été enregistré"
    redirect_to @gossip
    else
    puts "doesn't work"
    render :new
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
    redirect_to gossips_path
  end

end
