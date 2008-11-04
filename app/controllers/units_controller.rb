class UnitsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  # GET /units
  # GET /units.xml
  def index
    @subjects  = Unit.find(:all, :conditions => {:unit_type => "Subject"})
    @fragments = Unit.find(:all, :conditions => {:unit_type => "Fragment"})   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subjects }
    end
  end

  # GET /units/1
  # GET /units/1.xml
  def show
    @unit = Unit.find(params[:id])
    @parent = @unit.parent unless @unit.parent.empty?
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unit }
    end
  end

  # GET /units/new
  # GET /units/new.xml
  def new
    if !params[:parent_id].nil?
      @parent = Unit.find(params[:parent_id])
      @unit = @parent.parts.build      
    else
      @unit = Unit.new(current_user)
    end
      
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unit }
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @unit }
    end
  end

  # POST /units
  # POST /units.xml
  def create
    if !params[:parent_id].nil?
      @parent = Unit.find(params[:parent_id])
      @unit = @parent.parts.build(current_user, params[:unit])
    else
      @unit = Unit.new(current_user, params[:unit])
    end
    respond_to do |format|
      if @unit.save
        flash[:notice] = 'Unit was successfully created.'
        format.html { redirect_to(@unit) }
        format.xml  { render :xml => @unit, :status => :created, :location => @unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.xml
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        flash[:notice] = 'Unit was successfully updated.'
        format.html { redirect_to(@unit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.xml
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to(units_url) }
      format.xml  { head :ok }
    end
  end
end
