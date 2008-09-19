class UserQAndAsController < ApplicationController
  # GET /user_q_and_as
  # GET /user_q_and_as.xml
  def index
    @user_q_and_as = UserQAndA.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_q_and_as }
    end
  end

  # GET /user_q_and_as/1
  # GET /user_q_and_as/1.xml
  def show
    @user_q_and_a = UserQAndA.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_q_and_a }
    end
  end

  # GET /user_q_and_as/new
  # GET /user_q_and_as/new.xml
  def new
    @user_q_and_a = UserQAndA.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_q_and_a }
    end
  end

  # GET /user_q_and_as/1/edit
  def edit
    @user_q_and_a = UserQAndA.find(params[:id])
  end

  # POST /user_q_and_as
  # POST /user_q_and_as.xml
  def create
    @user_q_and_a = UserQAndA.new(params[:user_q_and_a])

    respond_to do |format|
      if @user_q_and_a.save
        flash[:notice] = 'UserQAndA was successfully created.'
        format.html { redirect_to(@user_q_and_a) }
        format.xml  { render :xml => @user_q_and_a, :status => :created, :location => @user_q_and_a }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_q_and_a.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_q_and_as/1
  # PUT /user_q_and_as/1.xml
  def update
    @user_q_and_a = UserQAndA.find(params[:id])

    respond_to do |format|
      if @user_q_and_a.update_attributes(params[:user_q_and_a])
        flash[:notice] = 'UserQAndA was successfully updated.'
        format.html { redirect_to(@user_q_and_a) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_q_and_a.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_q_and_as/1
  # DELETE /user_q_and_as/1.xml
  def destroy
    @user_q_and_a = UserQAndA.find(params[:id])
    @user_q_and_a.destroy

    respond_to do |format|
      format.html { redirect_to(user_q_and_as_url) }
      format.xml  { head :ok }
    end
  end
end
