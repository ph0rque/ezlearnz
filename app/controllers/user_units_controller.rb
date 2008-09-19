class UserUnitsController < ApplicationController
  # GET /user_units
  # GET /user_units.xml
  def index
    @user_units = UserUnit.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_units }
    end
  end

  # GET /user_units/1
  # GET /user_units/1.xml
  def show
    @user_unit = UserUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_unit }
    end
  end

  # GET /user_units/new
  # GET /user_units/new.xml
  def new
    @user_unit = UserUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_unit }
    end
  end

  # GET /user_units/1/edit
  def edit
    @user_unit = UserUnit.find(params[:id])
  end

  # POST /user_units
  # POST /user_units.xml
  def create
    @user_unit = UserUnit.new(params[:user_unit])

    respond_to do |format|
      if @user_unit.save
        flash[:notice] = 'UserUnit was successfully created.'
        format.html { redirect_to(@user_unit) }
        format.xml  { render :xml => @user_unit, :status => :created, :location => @user_unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_units/1
  # PUT /user_units/1.xml
  def update
    @user_unit = UserUnit.find(params[:id])

    respond_to do |format|
      if @user_unit.update_attributes(params[:user_unit])
        flash[:notice] = 'UserUnit was successfully updated.'
        format.html { redirect_to(@user_unit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_units/1
  # DELETE /user_units/1.xml
  def destroy
    @user_unit = UserUnit.find(params[:id])
    @user_unit.destroy

    respond_to do |format|
      format.html { redirect_to(user_units_url) }
      format.xml  { head :ok }
    end
  end
end
