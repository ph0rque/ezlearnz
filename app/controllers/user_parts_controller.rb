class UserPartsController < ApplicationController
  # GET /user_parts
  # GET /user_parts.xml
  def index
    @user_parts = UserPart.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_parts }
    end
  end

  # GET /user_parts/1
  # GET /user_parts/1.xml
  def show
    @user_part = UserPart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_part }
    end
  end

  # GET /user_parts/new
  # GET /user_parts/new.xml
  def new
    @user_part = UserPart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_part }
    end
  end

  # GET /user_parts/1/edit
  def edit
    @user_part = UserPart.find(params[:id])
  end

  # POST /user_parts
  # POST /user_parts.xml
  def create
    @user_part = UserPart.new(params[:user_part])

    respond_to do |format|
      if @user_part.save
        flash[:notice] = 'UserPart was successfully created.'
        format.html { redirect_to(@user_part) }
        format.xml  { render :xml => @user_part, :status => :created, :location => @user_part }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_parts/1
  # PUT /user_parts/1.xml
  def update
    @user_part = UserPart.find(params[:id])

    respond_to do |format|
      if @user_part.update_attributes(params[:user_part])
        flash[:notice] = 'UserPart was successfully updated.'
        format.html { redirect_to(@user_part) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_parts/1
  # DELETE /user_parts/1.xml
  def destroy
    @user_part = UserPart.find(params[:id])
    @user_part.destroy

    respond_to do |format|
      format.html { redirect_to(user_parts_url) }
      format.xml  { head :ok }
    end
  end
end
