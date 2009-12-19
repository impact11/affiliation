class Admin::PayableActionsController < ApplicationController
	layout "admin"
	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(admin)'

  # GET /payable_actions
  # GET /payable_actions.xml
  def index
    @pending_commissions 	= PayableAction.pending
		@approved_commissions = PayableAction.approved
		@paid_commissions 		= PayableAction.paid

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payable_actions }
    end
  end

  # GET /payable_actions/1
  # GET /payable_actions/1.xml
  def show
    @payable_action = PayableAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payable_action }
    end
  end

  # GET /payable_actions/new
  # GET /payable_actions/new.xml
  def new
    @payable_action = PayableAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payable_action }
    end
  end

  # GET /payable_actions/1/edit
  def edit
    @payable_action = PayableAction.find(params[:id])
  end

  # POST /payable_actions
  # POST /payable_actions.xml
  def create
    @payable_action = PayableAction.new(params[:payable_action])

    respond_to do |format|
      if @payable_action.save
        flash[:notice] = 'PayableAction was successfully created.'
        format.html { redirect_to(@payable_action) }
        format.xml  { render :xml => @payable_action, :status => :created, :location => @payable_action }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payable_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payable_actions/1
  # PUT /payable_actions/1.xml
  def update
    @payable_action = PayableAction.find(params[:id])

    respond_to do |format|
      if @payable_action.update_attributes(params[:payable_action])
        flash[:notice] = 'PayableAction was successfully updated.'
        format.html { redirect_to(@payable_action) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payable_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payable_actions/1
  # DELETE /payable_actions/1.xml
  def destroy
    @payable_action = PayableAction.find(params[:id])
    @payable_action.destroy

    respond_to do |format|
      format.html { redirect_to(payable_actions_url) }
      format.xml  { head :ok }
    end
  end
end
