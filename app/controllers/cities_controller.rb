class CitiesController < ApplicationController
  def show
    puts "/"*60
    puts params
    puts "/"*60
    c = City.all
    position = params[:id].to_i
    @city = c[position-1]

    user_array = @city.users
    @gossips_array = []

    user_array.each do |u|
      puts "*"*60
      puts u.gossips
      @gossips_array.push(u.gossips)

    end
    puts "O"*60
    @new_array = []
    puts @gossips_array

    @gossips_array.each do |i|

          i.each do |k|
            @new_array.push(k)
            puts "s"*60
            puts k
          end


    end

    end
  end
