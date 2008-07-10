class ItemServicesController < ApplicationController
  # GET /item_services
  # GET /item_services.xml
  def index
    @item_services = ItemService.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_services }
    end
  end

  # GET /item_services/1
  # GET /item_services/1.xml
  def show
    @item_service = ItemService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_service }
    end
  end

  # GET /item_services/new
  # GET /item_services/new.xml
  def new
    @item_service = ItemService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_service }
    end
  end

  # GET /item_services/1/edit
  def edit
    @item_service = ItemService.find(params[:id])
  end

  # POST /item_services
  # POST /item_services.xml
  def create
    @item_service = ItemService.new(params[:item_service])

    respond_to do |format|
      if @item_service.save
        flash[:notice] = 'ItemService was successfully created.'
        format.html { redirect_to(@item_service) }
        format.xml  { render :xml => @item_service, :status => :created, :location => @item_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_services/1
  # PUT /item_services/1.xml
  def update
    @item_service = ItemService.find(params[:id])

    respond_to do |format|
      if @item_service.update_attributes(params[:item_service])
        flash[:notice] = 'ItemService was successfully updated.'
        format.html { redirect_to(@item_service) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_services/1
  # DELETE /item_services/1.xml
  def destroy
    @item_service = ItemService.find(params[:id])
    @item_service.destroy

    respond_to do |format|
      format.html { redirect_to(item_services_url) }
      format.xml  { head :ok }
    end
  end
end
