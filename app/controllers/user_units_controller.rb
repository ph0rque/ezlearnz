class UserUnitsController < ApplicationController

  # POST /user_units
  # POST /user_units.xml
  def create
    @user_unit = UserUnit.new(params[:user_unit])

    respond_to do |format|
      if @user_unit.save
        flash[:notice] = 'UserUnit was successfully created.'
        format.xml  { render :xml => @user_unit, :status => :created, :location => @user_unit }
      else
        format.xml  { render :xml => @user_unit.errors, :status => :unprocessable_entity }
      end
    format.html { redirect_to(units_path) }
    end
  end

  # PUT /user_units/1
  # PUT /user_units/1.xml
  def update
    @user_unit = UserUnit.find(params[:id])

    respond_to do |format|
      if @user_unit.update_attributes(params[:user_unit])
        flash[:notice] = 'UserUnit was successfully updated.'
        format.xml  { head :ok }
      else
        format.xml  { render :xml => @user_unit.errors, :status => :unprocessable_entity }
      end
      format.html { redirect_to(units_path) }
    end
  end

  # DELETE /user_units/1
  # DELETE /user_units/1.xml
  def destroy
    @user_unit = UserUnit.find(params[:id])
    @user_unit.destroy

    respond_to do |format|
      format.html { redirect_to(units_path) }
      format.xml  { head :ok }
    end
  end
end
