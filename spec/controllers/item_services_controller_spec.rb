require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemServicesController do

  def mock_item_service(stubs={})
    @mock_item_service ||= mock_model(ItemService, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all item_services as @item_services" do
      ItemService.should_receive(:find).with(:all).and_return([mock_item_service])
      get :index
      assigns[:item_services].should == [mock_item_service]
    end

    describe "with mime type of xml" do
  
      it "should render all item_services as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ItemService.should_receive(:find).with(:all).and_return(item_services = mock("Array of ItemServices"))
        item_services.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested item_service as @item_service" do
      ItemService.should_receive(:find).with("37").and_return(mock_item_service)
      get :show, :id => "37"
      assigns[:item_service].should equal(mock_item_service)
    end
    
    describe "with mime type of xml" do

      it "should render the requested item_service as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ItemService.should_receive(:find).with("37").and_return(mock_item_service)
        mock_item_service.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new item_service as @item_service" do
      ItemService.should_receive(:new).and_return(mock_item_service)
      get :new
      assigns[:item_service].should equal(mock_item_service)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested item_service as @item_service" do
      ItemService.should_receive(:find).with("37").and_return(mock_item_service)
      get :edit, :id => "37"
      assigns[:item_service].should equal(mock_item_service)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created item_service as @item_service" do
        ItemService.should_receive(:new).with({'these' => 'params'}).and_return(mock_item_service(:save => true))
        post :create, :item_service => {:these => 'params'}
        assigns(:item_service).should equal(mock_item_service)
      end

      it "should redirect to the created item_service" do
        ItemService.stub!(:new).and_return(mock_item_service(:save => true))
        post :create, :item_service => {}
        response.should redirect_to(item_service_url(mock_item_service))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved item_service as @item_service" do
        ItemService.stub!(:new).with({'these' => 'params'}).and_return(mock_item_service(:save => false))
        post :create, :item_service => {:these => 'params'}
        assigns(:item_service).should equal(mock_item_service)
      end

      it "should re-render the 'new' template" do
        ItemService.stub!(:new).and_return(mock_item_service(:save => false))
        post :create, :item_service => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested item_service" do
        ItemService.should_receive(:find).with("37").and_return(mock_item_service)
        mock_item_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_service => {:these => 'params'}
      end

      it "should expose the requested item_service as @item_service" do
        ItemService.stub!(:find).and_return(mock_item_service(:update_attributes => true))
        put :update, :id => "1"
        assigns(:item_service).should equal(mock_item_service)
      end

      it "should redirect to the item_service" do
        ItemService.stub!(:find).and_return(mock_item_service(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(item_service_url(mock_item_service))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested item_service" do
        ItemService.should_receive(:find).with("37").and_return(mock_item_service)
        mock_item_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_service => {:these => 'params'}
      end

      it "should expose the item_service as @item_service" do
        ItemService.stub!(:find).and_return(mock_item_service(:update_attributes => false))
        put :update, :id => "1"
        assigns(:item_service).should equal(mock_item_service)
      end

      it "should re-render the 'edit' template" do
        ItemService.stub!(:find).and_return(mock_item_service(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested item_service" do
      ItemService.should_receive(:find).with("37").and_return(mock_item_service)
      mock_item_service.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the item_services list" do
      ItemService.stub!(:find).and_return(mock_item_service(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(item_services_url)
    end

  end

end
