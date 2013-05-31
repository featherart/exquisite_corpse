class DrawingTypeController < ApplicationController
   def index
    @drawing_types = DrawingType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drawing_types }
    end
  end

  def show
    @drawing_types = DrawingType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drawing_types }
    end
  end

  def create
    @drawing_types = DrawingType.new(params[:drawing_types])

    respond_to do |format|
      if @drawing_types.save
        format.html { redirect_to @drawing_types, notice: 'Drawing type was successfully created!!' }
        format.json { render json: @drawing, status: :created, location: @drawing_types }
      else
        format.html { render action: "new" }
        format.json { render json: @drawing_types.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @drawing_types = DrawingType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drawing_types }
    end
  end


end
