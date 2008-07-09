class SpaceRolesController < ApplicationController
  # GET /space_roles
  # GET /space_roles.xml
  def index
    @space_roles = SpaceRole.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @space_roles }
    end
  end

  # GET /space_roles/1
  # GET /space_roles/1.xml
  def show
    @space_role = SpaceRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @space_role }
    end
  end

  # GET /space_roles/new
  # GET /space_roles/new.xml
  def new
    @space_role = SpaceRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @space_role }
    end
  end

  # GET /space_roles/1/edit
  def edit
    @space_role = SpaceRole.find(params[:id])
  end

  # POST /space_roles
  # POST /space_roles.xml
  def create
    @space_role = SpaceRole.new(params[:space_role])

    respond_to do |format|
      if @space_role.save
        flash[:notice] = 'SpaceRole was successfully created.'
        format.html { redirect_to(@space_role) }
        format.xml  { render :xml => @space_role, :status => :created, :location => @space_role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @space_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /space_roles/1
  # PUT /space_roles/1.xml
  def update
    @space_role = SpaceRole.find(params[:id])

    respond_to do |format|
      if @space_role.update_attributes(params[:space_role])
        flash[:notice] = 'SpaceRole was successfully updated.'
        format.html { redirect_to(@space_role) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @space_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /space_roles/1
  # DELETE /space_roles/1.xml
  def destroy
    @space_role = SpaceRole.find(params[:id])
    @space_role.destroy

    respond_to do |format|
      format.html { redirect_to(space_roles_url) }
      format.xml  { head :ok }
    end
  end
end
