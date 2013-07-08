class DrawingsController < ApplicationController
  # GET /drawings
  # GET /drawings.json
  def index
    #@drawings = Drawing.joins(:drawing_type)  # this does 1+M+N SQL queries!!?!?!!?
    #@drawings = Drawing.includes(:drawing_type)  # this does 2 SQL queries, still 1 too many
    #@drawings = Drawing.joins(:drawing_type).select([:user_id, :image, :type_description]).all  # this does a single join, :id needs disambiguating somehow?
    #@drawings = Drawing.joins(:drawing_type).select(["drawings.*", :type_description]).all  # this does a single join, uses SQL string to get drawings.id
    #@drawings = Drawing.includes(:drawing_type).where("drawing_type_id IS NOT NULL") # this where does not force a single join like the guy on the internet said it would!
    #@drawings = Drawing.includes(:drawing_type).where("drawing_types.id IS NOT NULL") # this where does force the single join, you must need to reference the joined table

    @drawings = Drawing.includes(:drawing_type)  # this does 2 SQL queries, still 1 too many, but apparently this is the rails way
    
    # this emits the correct query but only uses it for the drawings array, and still does N other queries!?!?
    #@drawings = Drawing.select("drawings.*, drawing_types.type_description").joins("INNER JOIN drawing_types ON drawing_types.id = drawings.drawing_type_id")

    puts "$$$$$$$ in drawings index $$$$$$$"
    #puts @drawings.first.drawing_type.inspect
    puts "*************"

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @drawings }
    end
  end

  # GET /drawings/1
  # GET /drawings/1.json
  def show
    @drawing = Drawing.find(params[:id])
    if( @drawing.drawing_type_id != nil )
      @drawing_type = DrawingType.find(@drawing.drawing_type_id)
    else @drawing_type = "undefined"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/new
  # GET /drawings/new.json
  def new
    @drawing = Drawing.new
    #@drawing_type = DrawingType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/1/edit
  def edit
    @drawing = Drawing.find(params[:id])
  end

  # POST /drawings
  # POST /drawings.json
  def create
    @drawing = Drawing.new(params[:drawing])
    #@drawing_type = DrawingType.new(params[:drawing_type_id])
    puts "&&&&&&&&&&&&&&& in create &&&&&&&&&&&"
    puts @pair.to_s
    puts "*************************************"
    if @pair != nil # it is a pair, not just a single drawing
      @pair.image_top = params[:pairs_top_id]
    end

    respond_to do |format|
      if @drawing.save
        format.html { redirect_to @drawing, notice: 'Drawing was successfully created!!' }
        format.json { render json: @drawing, status: :created, location: @drawing }
      else
        format.html { render action: "new" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drawings/1
  # PUT /drawings/1.json
  def update
    @drawing = Drawing.find(params[:id])

    respond_to do |format|
      if @drawing.update_attributes(params[:drawing])
        format.html { redirect_to @drawing, notice: 'Drawing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drawings/1
  # DELETE /drawings/1.json
  def destroy
    @drawing = Drawing.find(params[:id])
    @drawing.destroy

    respond_to do |format|
      format.html { redirect_to drawings_url }
      format.json { head :no_content }
    end
  end
end
