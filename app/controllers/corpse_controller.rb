class CorpseController < ApplicationController
	def index
	# A corpse is just a Pair with matching top & bottom
    @corpses = Corpse.find_by_sql(
      "select t.image_top, t.image_bottom, b.image_bottom 
       from pairs t inner join pairs b 
       where t.image_bottom = b.image_top")
    
    puts "+++++++++++ corpses index +++++++++++++"
    puts @corpses.first.attributes['t.image_top']
    puts @corpses.first.attributes['t.image_bottom']
    puts @corpses.first.attributes['b.image_bottom']
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
end
