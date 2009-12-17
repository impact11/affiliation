class Admin::AffiliatesController < ApplicationController
	layout "admin"
	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(root)'

  # GET /users
  # GET /users.xml
  def index
    @affiliates = Affiliate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @affiliate = Affiliate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end

  # GET /users/1/edit
  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @affiliate = Affiliate.new(params[:user])

    respond_to do |format|
      if @affiliate.save
        flash[:notice] = 'Affiliate was successfully created.'
        format.html { redirect_to(@affiliate) }
        format.xml  { render :xml => @affiliate, :status => :created, :location => @affiliate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:user])
        flash[:notice] = 'Affiliate was successfully updated.'
        format.html { redirect_to(@affiliate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
	end 
end
