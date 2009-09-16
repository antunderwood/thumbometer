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
  def thumbs
    @thumbometer = Thumbometer.find(params[:thumbometer_id], :include => :user)
    @total_steps = @thumbometer.negative_steps + @thumbometer.positive_steps
    current_step = @thumbometer.current_step
    @direction = params[:direction]

    existing_thumbometer_step = ThumbometerStep.find(:first, :conditions => ["DATE(created_at) = ? AND thumbometer_id = ?", DateTime.now.utc.to_date, @thumbometer.id])
    if existing_thumbometer_step.nil?
      if current_step < @total_steps && @direction == "up"
        @thumbometer.current_step = current_step + 1
        @thumbometer.save!
      elsif current_step > 1 && @direction == "down"
        @thumbometer.current_step = current_step -1
        @thumbometer.save!
      end
      thumbometer_step = ThumbometerStep.new
      thumbometer_step.thumbometer = @thumbometer
      thumbometer_step.current_step = @thumbometer.current_step
      thumbometer_step.save!
      @result = 'success'
    else
      @result = 'fail'
    end
  end
end
