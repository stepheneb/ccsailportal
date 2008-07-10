class ItemReferencesController < ApplicationController
  # GET /item_references
  # GET /item_references.xml
  def index
    @item_references = ItemReference.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_references }
    end
  end

  # GET /item_references/1
  # GET /item_references/1.xml
  def show
    @item_reference = ItemReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_reference }
    end
  end

  # GET /item_references/new
  # GET /item_references/new.xml
  def new
    @item_reference = ItemReference.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_reference }
    end
  end

  # GET /item_references/1/edit
  def edit
    @item_reference = ItemReference.find(params[:id])
  end

  # POST /item_references
  # POST /item_references.xml
  def create
    @item_reference = ItemReference.new(params[:item_reference])

    respond_to do |format|
      if @item_reference.save
        flash[:notice] = 'ItemReference was successfully created.'
        format.html { redirect_to(@item_reference) }
        format.xml  { render :xml => @item_reference, :status => :created, :location => @item_reference }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_reference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_references/1
  # PUT /item_references/1.xml
  def update
    @item_reference = ItemReference.find(params[:id])

    respond_to do |format|
      if @item_reference.update_attributes(params[:item_reference])
        flash[:notice] = 'ItemReference was successfully updated.'
        format.html { redirect_to(@item_reference) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_reference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_references/1
  # DELETE /item_references/1.xml
  def destroy
    @item_reference = ItemReference.find(params[:id])
    @item_reference.destroy

    respond_to do |format|
      format.html { redirect_to(item_references_url) }
      format.xml  { head :ok }
    end
  end
end
