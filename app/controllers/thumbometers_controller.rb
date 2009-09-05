class ThumbometersController < ApplicationController
  # GET /thumbometers
  # GET /thumbometers.xml
  def index
    @thumbometers = Thumbometer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thumbometers }
    end
  end

  # GET /thumbometers/1
  # GET /thumbometers/1.xml
  def show
    @thumbometer = Thumbometer.find(params[:id])
    @total_steps = @thumbometer.negative_steps + @thumbometer.positive_steps
    @div_width = (750/@total_steps).floor
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thumbometer }
    end
  end

  # GET /thumbometers/new
  # GET /thumbometers/new.xml
  def new
    @thumbometer = Thumbometer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thumbometer }
    end
  end

  # GET /thumbometers/1/edit
  def edit
    @thumbometer = Thumbometer.find(params[:id])
  end

  # POST /thumbometers
  # POST /thumbometers.xml
  def create
    @thumbometer = Thumbometer.new(params[:thumbometer])

    respond_to do |format|
      if @thumbometer.save
        flash[:notice] = 'Thumbometer was successfully created.'
        format.html { redirect_to(@thumbometer) }
        format.xml  { render :xml => @thumbometer, :status => :created, :location => @thumbometer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thumbometer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thumbometers/1
  # PUT /thumbometers/1.xml
  def update
    @thumbometer = Thumbometer.find(params[:id])

    respond_to do |format|
      if @thumbometer.update_attributes(params[:thumbometer])
        flash[:notice] = 'Thumbometer was successfully updated.'
        format.html { redirect_to(@thumbometer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thumbometer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thumbometers/1
  # DELETE /thumbometers/1.xml
  def destroy
    @thumbometer = Thumbometer.find(params[:id])
    @thumbometer.destroy

    respond_to do |format|
      format.html { redirect_to(thumbometers_url) }
      format.xml  { head :ok }
    end
  end
end
