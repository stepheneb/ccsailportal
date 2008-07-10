require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemReferencesController do

  def mock_item_reference(stubs={})
    @mock_item_reference ||= mock_model(ItemReference, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all item_references as @item_references" do
      ItemReference.should_receive(:find).with(:all).and_return([mock_item_reference])
      get :index
      assigns[:item_references].should == [mock_item_reference]
    end

    describe "with mime type of xml" do
  
      it "should render all item_references as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ItemReference.should_receive(:find).with(:all).and_return(item_references = mock("Array of ItemReferences"))
        item_references.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested item_reference as @item_reference" do
      ItemReference.should_receive(:find).with("37").and_return(mock_item_reference)
      get :show, :id => "37"
      assigns[:item_reference].should equal(mock_item_reference)
    end
    
    describe "with mime type of xml" do

      it "should render the requested item_reference as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ItemReference.should_receive(:find).with("37").and_return(mock_item_reference)
        mock_item_reference.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new item_reference as @item_reference" do
      ItemReference.should_receive(:new).and_return(mock_item_reference)
      get :new
      assigns[:item_reference].should equal(mock_item_reference)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested item_reference as @item_reference" do
      ItemReference.should_receive(:find).with("37").and_return(mock_item_reference)
      get :edit, :id => "37"
      assigns[:item_reference].should equal(mock_item_reference)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created item_reference as @item_reference" do
        ItemReference.should_receive(:new).with({'these' => 'params'}).and_return(mock_item_reference(:save => true))
        post :create, :item_reference => {:these => 'params'}
        assigns(:item_reference).should equal(mock_item_reference)
      end

      it "should redirect to the created item_reference" do
        ItemReference.stub!(:new).and_return(mock_item_reference(:save => true))
        post :create, :item_reference => {}
        response.should redirect_to(item_reference_url(mock_item_reference))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved item_reference as @item_reference" do
        ItemReference.stub!(:new).with({'these' => 'params'}).and_return(mock_item_reference(:save => false))
        post :create, :item_reference => {:these => 'params'}
        assigns(:item_reference).should equal(mock_item_reference)
      end

      it "should re-render the 'new' template" do
        ItemReference.stub!(:new).and_return(mock_item_reference(:save => false))
        post :create, :item_reference => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested item_reference" do
        ItemReference.should_receive(:find).with("37").and_return(mock_item_reference)
        mock_item_reference.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_reference => {:these => 'params'}
      end

      it "should expose the requested item_reference as @item_reference" do
        ItemReference.stub!(:find).and_return(mock_item_reference(:update_attributes => true))
        put :update, :id => "1"
        assigns(:item_reference).should equal(mock_item_reference)
      end

      it "should redirect to the item_reference" do
        ItemReference.stub!(:find).and_return(mock_item_reference(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(item_reference_url(mock_item_reference))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested item_reference" do
        ItemReference.should_receive(:find).with("37").and_return(mock_item_reference)
        mock_item_reference.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_reference => {:these => 'params'}
      end

      it "should expose the item_reference as @item_reference" do
        ItemReference.stub!(:find).and_return(mock_item_reference(:update_attributes => false))
        put :update, :id => "1"
        assigns(:item_reference).should equal(mock_item_reference)
      end

      it "should re-render the 'edit' template" do
        ItemReference.stub!(:find).and_return(mock_item_reference(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested item_reference" do
      ItemReference.should_receive(:find).with("37").and_return(mock_item_reference)
      mock_item_reference.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the item_references list" do
      ItemReference.stub!(:find).and_return(mock_item_reference(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(item_references_url)
    end

  end

end
