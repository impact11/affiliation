class Admin::TrackbackCodesController < ApplicationController
	layout "admin"
	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(admin)'

  # GET /trackback_codes
  # GET /trackback_codes.xml
  def index
    @trackback_codes = TrackbackCode.find(:all, :conditions => ["type IS NULL"]) # Only retrieve non-affiliates

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trackback_codes }
    end
  end

  # GET /trackback_codes/1
  # GET /trackback_codes/1.xml
  def show
    @trackback_code = TrackbackCode.first( :name => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trackback_code }
    end
  end

  # GET /trackback_codes/new
  # GET /trackback_codes/new.xml
  def new
    @trackback_code = TrackbackCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trackback_code }
    end
  end

  # GET /trackback_codes/1/edit
  def edit
    @trackback_code = TrackbackCode.first(:name => params[:id])
  end

  # POST /trackback_codes
  # POST /trackback_codes.xml
  def create
		begin
			params[:trackback_code][:percentage] = params[:trackback_code][:percentage].to_f
			@trackback_code = TrackbackCode.new(params[:trackback_code])
			@trackback_code.save

			flash[:notice] = 'TrackbackCode was successfully created.'
    	respond_to do |format|
				format.html { redirect_back_or_default(@trackback_code) }
				format.xml  { render :xml => @trackback_code, :status => :created, :location => @trackback_code }
			end
		rescue Exception => ex
			logger.error ex
    	respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @trackback_code.errors, :status => :unprocessable_entity }
			end
		end
  end

  # PUT /trackback_codes/1
  # PUT /trackback_codes/1.xml
  def update
    @trackback_code = TrackbackCode.find(params[:id])

    respond_to do |format|
      if @trackback_code.update_attributes(params[:trackback_code])
        flash[:notice] = 'TrackbackCode was successfully updated.'
        format.html { redirect_to(@trackback_code) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trackback_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trackback_codes/1
  # DELETE /trackback_codes/1.xml
  def destroy
    @trackback_code = TrackbackCode.find(params[:id])
    @trackback_code.destroy

    respond_to do |format|
      format.html { redirect_to(trackback_codes_url) }
      format.xml  { head :ok }
    end
  end
end
