class PairsController < ApplicationController
  # GET /pairs
  # GET /pairs.json
  def index
    #@pairs = Pair.all
    
    #@drawing_top = Drawing.joins(:pair).where(:id == :image_top)
    #@drawing_bottom = Drawing.includes(:pair).where(:image_bottom, :id)

    @pairs = Pair.find_by_sql("SELECT pairs.id, top.id as top_id, top.image as top_image, toptypes.type_description as top_description, bot.id as bot_id, bot.image as bot_image, bottypes.type_description as bot_description FROM pairs inner join drawings as top on top.id = pairs.image_top inner join drawings as bot on bot.id = pairs.image_bottom inner join drawing_types as toptypes on top.drawing_type_id = toptypes.id inner join drawing_types as bottypes on bot.drawing_type_id = bottypes.id")
    
    #@test = Pair.find_by_sql("SELECT top.id, toptypes.type_description, bot.id, bottypes.type_description FROM pairs inner join drawings as top on top.id = pairs.image_top inner join drawings as bot on bot.id = pairs.image_bottom inner join drawing_types as toptypes on top.drawing_type_id = toptypes.id inner join drawing_types as bottypes on bot.drawing_type_id = bottypes.id")
    

    #@test = Pair.find_by_sql("SELECT pairs.image_top FROM pairs")
    #@test = Pair.find_by_sql("SELECT pairs.image_top AS top FROM pairs")
    
    puts "+++++++++++ pairs index +++++++++++++"
    puts @pairs.first.attributes['top_id']
    puts @pairs.first.attributes['top_description']
    puts @pairs.first.attributes['bot_id']
    puts @pairs.first.attributes['bot_description']
    puts "$$$$$$$$$$$$$$$$$$$$$$$$"
    #@drawings = Drawing.includes(:drawing_type)

    #@drawings_top = Drawing.find(@pair.image_top)
    #@drawings_bottom = Drawing.find(@pair.image_bottom)

    #@drawings_top = Drawing.where(id: @pair.image_top)
    #@drawings_bottom = Drawing.where(id: @pair.image_bottom)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pairs }
    end
  end

  # GET /pairs/1
  # GET /pairs/1.json
  def show
    @pair = Pair.find(params[:id])
    puts "$$$$$$ in show!!  $$$$$$$$$$$$$"
    puts params
    puts @pair.inspect
    puts "$$$$$$$$$$$$$$$$$$$"
    #@drawing = Drawing.find(params[:id])

    #@drawings = @pair.drawings


    @drawing_top = Drawing.find(@pair.image_top)
    @drawing_bottom = Drawing.find(@pair.image_bottom)
    #@drawing_top = @pair.drawing_top

    #@drawing_bottom = Drawing.select(%q{image}).where(:id => @pair.image_bottom)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pair }
    end
  end

  # GET /pairs/new
  # GET /pairs/new.json
  def new
    @pair = Pair.new
    @drawing = Drawing.new

    #@randomly_selected_drawing = Drawing.all.sample # gets a random drawing of any type
    @randomly_selected_head = Drawing.where(drawing_type_id: 1).sample

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pair }
    end
  end

  # GET /pairs/1/edit
  def edit
    @pair = Pair.find(params[:id])
  end

  # POST /pairs
  # POST /pairs.json
  def create
    @pair = Pair.new(params[:id])
    @pair.image_top = params[:pairs_top_id]
    #@pair.image_bottom = xxx
    
    @drawing = Drawing.new()
    @drawing.image = params[:image]
    @drawing.drawing_type_id = params[:drawing_type_id]
    #puts "*********drawing type_id in create!!!*******"
    #puts @drawing.drawing_type_id
    #puts "****************"
    @drawing.save!

    @pair.image_bottom = @drawing.id

    #puts '+++++++++++++++++'
    #p @drawing
    #@pair = @drawing.pair.build(params[:pair])

    respond_to do |format|
      if @pair.save
        format.html { redirect_to @pair, notice: 'Pair was successfully created.' }
        format.json { render json: @pair, status: :created, location: @pair }
      else
        format.html { render action: "new" }
        format.json { render json: @pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pairs/1
  # PUT /pairs/1.json
  def update
    @pair = Pair.find(params[:id])

    respond_to do |format|
      if @pair.update_attributes(params[:pair])
        format.html { redirect_to @pair, notice: 'Pair was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairs/1
  # DELETE /pairs/1.json
  def destroy
    @pair = Pair.find(params[:id])
    #@drawing = Drawing.find(params[:id])
    @pair.destroy
    #@drawing.destroy

    respond_to do |format|
      format.html { redirect_to pairs_url }
      format.json { head :no_content }
    end
  end
end
