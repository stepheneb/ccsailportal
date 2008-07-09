class UserSpaceRolesController < ApplicationController
  # GET /user_space_roles
  # GET /user_space_roles.xml
  def index
    @user_space_roles = UserSpaceRole.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_space_roles }
    end
  end

  # GET /user_space_roles/1
  # GET /user_space_roles/1.xml
  def show
    @user_space_role = UserSpaceRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_space_role }
    end
  end

  # GET /user_space_roles/new
  # GET /user_space_roles/new.xml
  def new
    @user_space_role = UserSpaceRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_space_role }
    end
  end

  # GET /user_space_roles/1/edit
  def edit
    @user_space_role = UserSpaceRole.find(params[:id])
  end

  # POST /user_space_roles
  # POST /user_space_roles.xml
  def create
    @user_space_role = UserSpaceRole.new(params[:user_space_role])

    respond_to do |format|
      if @user_space_role.save
        flash[:notice] = 'UserSpaceRole was successfully created.'
        format.html { redirect_to(@user_space_role) }
        format.xml  { render :xml => @user_space_role, :status => :created, :location => @user_space_role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_space_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_space_roles/1
  # PUT /user_space_roles/1.xml
  def update
    @user_space_role = UserSpaceRole.find(params[:id])

    respond_to do |format|
      if @user_space_role.update_attributes(params[:user_space_role])
        flash[:notice] = 'UserSpaceRole was successfully updated.'
        format.html { redirect_to(@user_space_role) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_space_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_space_roles/1
  # DELETE /user_space_roles/1.xml
  def destroy
    @user_space_role = UserSpaceRole.find(params[:id])
    @user_space_role.destroy

    respond_to do |format|
      format.html { redirect_to(user_space_roles_url) }
      format.xml  { head :ok }
    end
  end
end
