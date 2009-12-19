class Admin::AffiliatesController < ApplicationController
	layout "admin"
	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(admin)'

  # GET /affiliates
  # GET /affiliates.xml
  def index
		store_location

    @affiliates = Affiliate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end

  # GET /affiliates/1
  # GET /affiliates/1.xml
  def show
		redirect_to edit_admin_affiliate_path(params[:id])
  end

  # GET /affiliates/new
  # GET /affiliates/new.xml
  def new
    @affiliate = Affiliate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end

  # GET /affiliates/1/edit
  def edit
		store_location

    @affiliate = Affiliate.find(params[:id])
  end

  # POST /affiliates
  # POST /affiliates.xml
  def create
    @affiliate = Affiliate.new(params[:affiliate])

		unless params[:send_activation]
			@affiliate.bypass_activation = true
		end

    respond_to do |format|
      if @affiliate.save

				if params[:approved]
					@affiliate.approve!
				end

        flash[:notice] = 'Affiliate was successfully created.'
        format.html { redirect_to([:admin, @affiliate]) }
        format.xml  { render :xml => @affiliate, :status => :created, :location => @affiliate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /affiliates/1
  # PUT /affiliates/1.xml
  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        flash[:notice] = 'Affiliate was successfully updated.'
        format.html { redirect_to([:admin, @affiliate]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliates/1
  # DELETE /affiliates/1.xml
=begin
  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to(admin_affiliates_url) }
      format.xml  { head :ok }
    end
	end 
=end

	def remind
		@affiliate = Affiliate.find(params[:id])
    UserMailer.deliver_signup_notification(@affiliate) 
    redirect_back_or_default([:admin, @affiliate])
	end

	def approve
		@affiliate = Affiliate.find(params[:id])
		@affiliate.approve!

    respond_to do |format|
      format.html { redirect_to(admin_affiliates_url) }
      format.xml  { head :ok }
    end
	end
end
