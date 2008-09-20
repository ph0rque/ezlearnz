class QAndAsController < ApplicationController
  # GET /q_and_as
  # GET /q_and_as.xml
  def index
    @part = Part.find(params[:part_id])
    @q_and_as = @part.q_and_as

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @q_and_as }
    end
  end

  # GET /q_and_as/new
  # GET /q_and_as/new.xml
  def new
    @part = Part.find(params[:part_id])
    @q_and_a = @part.q_and_as.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @q_and_a }
    end
  end

  # GET /q_and_as/1/edit
  def edit
    @q_and_a = QAndA.find(params[:id])
  end

  # POST /q_and_as
  # POST /q_and_as.xml
  def create
    @part = Part.find(params[:part_id])
    @q_and_a = @part.q_and_as.build(params[:q_and_a])

    respond_to do |format|
      if @q_and_a.save
        flash[:notice] = 'QAndA was successfully created.'
        format.html { redirect_to(@q_and_a) }
        format.xml  { render :xml => @q_and_a, :status => :created, :location => @q_and_a }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @q_and_a.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /q_and_as/1
  # PUT /q_and_as/1.xml
  def update
    @q_and_a = QAndA.find(params[:id])

    respond_to do |format|
      if @q_and_a.update_attributes(params[:q_and_a])
        flash[:notice] = 'QAndA was successfully updated.'
        format.html { redirect_to(@q_and_a) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @q_and_a.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /q_and_as/1
  # DELETE /q_and_as/1.xml
  def destroy
    @part = Part.find(params[:part_id])
    @q_and_a = QAndA.find(params[:id])
    @q_and_a.destroy

    respond_to do |format|
      format.html { redirect_to(@part) }
      format.xml  { head :ok }
    end
  end
end
