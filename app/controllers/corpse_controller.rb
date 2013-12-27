class CorpseController < ApplicationController
	def index
	# A corpse is just a Pair with matching top & bottom
    @corpses = Corpse.find_by_sql(
      "select t.image_top as head, t.image_bottom as torso, b.image_bottom as legs 
       from pairs t inner join pairs b where t.image_bottom = b.image_top;")
    
    puts "+++++++++++ corpses index +++++++++++++"
    puts @corpses.first.attributes['head']
    puts @corpses.first.attributes['torso']
    puts @corpses.first.attributes['legs']
    puts "$$$$$$$$$$$$$$$$$$$$$$$$"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corpses }
    end
  end

  def show
    @corpse = Corpse.find(params[:id])
    puts "$$$$$$ in corpse show  $$$$$$$$$$$$$"
    puts params
    puts "$$$$$$$$$$$$$$$$$$$"
    
    #@drawing_top = Drawing.find(@pair.image_top)
    #@drawing_bottom = Drawing.find(@pair.image_bottom)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pair }
    end
  end

  def create
    @corpse = Corpse.new(params[:id])
  end
end
