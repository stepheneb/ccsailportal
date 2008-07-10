require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemOwnersController do

  def mock_item_owner(stubs={})
    @mock_item_owner ||= mock_model(ItemOwner, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all item_owners as @item_owners" do
      ItemOwner.should_receive(:find).with(:all).and_return([mock_item_owner])
      get :index
      assigns[:item_owners].should == [mock_item_owner]
    end

    describe "with mime type of xml" do
  
      it "should render all item_owners as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ItemOwner.should_receive(:find).with(:all).and_return(item_owners = mock("Array of ItemOwners"))
        item_owners.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested item_owner as @item_owner" do
      ItemOwner.should_receive(:find).with("37").and_return(mock_item_owner)
      get :show, :id => "37"
      assigns[:item_owner].should equal(mock_item_owner)
    end
    
    describe "with mime type of xml" do

      it "should render the requested item_owner as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ItemOwner.should_receive(:find).with("37").and_return(mock_item_owner)
        mock_item_owner.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new item_owner as @item_owner" do
      ItemOwner.should_receive(:new).and_return(mock_item_owner)
      get :new
      assigns[:item_owner].should equal(mock_item_owner)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested item_owner as @item_owner" do
      ItemOwner.should_receive(:find).with("37").and_return(mock_item_owner)
      get :edit, :id => "37"
      assigns[:item_owner].should equal(mock_item_owner)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created item_owner as @item_owner" do
        ItemOwner.should_receive(:new).with({'these' => 'params'}).and_return(mock_item_owner(:save => true))
        post :create, :item_owner => {:these => 'params'}
        assigns(:item_owner).should equal(mock_item_owner)
      end

      it "should redirect to the created item_owner" do
        ItemOwner.stub!(:new).and_return(mock_item_owner(:save => true))
        post :create, :item_owner => {}
        response.should redirect_to(item_owner_url(mock_item_owner))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved item_owner as @item_owner" do
        ItemOwner.stub!(:new).with({'these' => 'params'}).and_return(mock_item_owner(:save => false))
        post :create, :item_owner => {:these => 'params'}
        assigns(:item_owner).should equal(mock_item_owner)
      end

      it "should re-render the 'new' template" do
        ItemOwner.stub!(:new).and_return(mock_item_owner(:save => false))
        post :create, :item_owner => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested item_owner" do
        ItemOwner.should_receive(:find).with("37").and_return(mock_item_owner)
        mock_item_owner.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_owner => {:these => 'params'}
      end

      it "should expose the requested item_owner as @item_owner" do
        ItemOwner.stub!(:find).and_return(mock_item_owner(:update_attributes => true))
        put :update, :id => "1"
        assigns(:item_owner).should equal(mock_item_owner)
      end

      it "should redirect to the item_owner" do
        ItemOwner.stub!(:find).and_return(mock_item_owner(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(item_owner_url(mock_item_owner))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested item_owner" do
        ItemOwner.should_receive(:find).with("37").and_return(mock_item_owner)
        mock_item_owner.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_owner => {:these => 'params'}
      end

      it "should expose the item_owner as @item_owner" do
        ItemOwner.stub!(:find).and_return(mock_item_owner(:update_attributes => false))
        put :update, :id => "1"
        assigns(:item_owner).should equal(mock_item_owner)
      end

      it "should re-render the 'edit' template" do
        ItemOwner.stub!(:find).and_return(mock_item_owner(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested item_owner" do
      ItemOwner.should_receive(:find).with("37").and_return(mock_item_owner)
      mock_item_owner.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the item_owners list" do
      ItemOwner.stub!(:find).and_return(mock_item_owner(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(item_owners_url)
    end

  end

end
