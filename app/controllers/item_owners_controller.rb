class ItemOwnersController < ApplicationController
  # GET /item_owners
  # GET /item_owners.xml
  def index
    @item_owners = ItemOwner.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_owners }
    end
  end

  # GET /item_owners/1
  # GET /item_owners/1.xml
  def show
    @item_owner = ItemOwner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_owner }
    end
  end

  # GET /item_owners/new
  # GET /item_owners/new.xml
  def new
    @item_owner = ItemOwner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_owner }
    end
  end

  # GET /item_owners/1/edit
  def edit
    @item_owner = ItemOwner.find(params[:id])
  end

  # POST /item_owners
  # POST /item_owners.xml
  def create
    @item_owner = ItemOwner.new(params[:item_owner])

    respond_to do |format|
      if @item_owner.save
        flash[:notice] = 'ItemOwner was successfully created.'
        format.html { redirect_to(@item_owner) }
        format.xml  { render :xml => @item_owner, :status => :created, :location => @item_owner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_owners/1
  # PUT /item_owners/1.xml
  def update
    @item_owner = ItemOwner.find(params[:id])

    respond_to do |format|
      if @item_owner.update_attributes(params[:item_owner])
        flash[:notice] = 'ItemOwner was successfully updated.'
        format.html { redirect_to(@item_owner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_owners/1
  # DELETE /item_owners/1.xml
  def destroy
    @item_owner = ItemOwner.find(params[:id])
    @item_owner.destroy

    respond_to do |format|
      format.html { redirect_to(item_owners_url) }
      format.xml  { head :ok }
    end
  end
end
