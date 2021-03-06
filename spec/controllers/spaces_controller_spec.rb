require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpacesController do

  def mock_space(stubs={})
    @mock_space ||= mock_model(Space, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all spaces as @spaces" do
      Space.should_receive(:find).with(:all).and_return([mock_space])
      get :index
      assigns[:spaces].should == [mock_space]
    end

    describe "with mime type of xml" do
  
      it "should render all spaces as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Space.should_receive(:find).with(:all).and_return(spaces = mock("Array of Spaces"))
        spaces.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested space as @space" do
      Space.should_receive(:find).with("37").and_return(mock_space)
      get :show, :id => "37"
      assigns[:space].should equal(mock_space)
    end
    
    describe "with mime type of xml" do

      it "should render the requested space as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Space.should_receive(:find).with("37").and_return(mock_space)
        mock_space.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new space as @space" do
      Space.should_receive(:new).and_return(mock_space)
      get :new
      assigns[:space].should equal(mock_space)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested space as @space" do
      Space.should_receive(:find).with("37").and_return(mock_space)
      get :edit, :id => "37"
      assigns[:space].should equal(mock_space)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created space as @space" do
        Space.should_receive(:new).with({'these' => 'params'}).and_return(mock_space(:save => true))
        post :create, :space => {:these => 'params'}
        assigns(:space).should equal(mock_space)
      end

      it "should redirect to the created space" do
        Space.stub!(:new).and_return(mock_space(:save => true))
        post :create, :space => {}
        response.should redirect_to(space_url(mock_space))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved space as @space" do
        Space.stub!(:new).with({'these' => 'params'}).and_return(mock_space(:save => false))
        post :create, :space => {:these => 'params'}
        assigns(:space).should equal(mock_space)
      end

      it "should re-render the 'new' template" do
        Space.stub!(:new).and_return(mock_space(:save => false))
        post :create, :space => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested space" do
        Space.should_receive(:find).with("37").and_return(mock_space)
        mock_space.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :space => {:these => 'params'}
      end

      it "should expose the requested space as @space" do
        Space.stub!(:find).and_return(mock_space(:update_attributes => true))
        put :update, :id => "1"
        assigns(:space).should equal(mock_space)
      end

      it "should redirect to the space" do
        Space.stub!(:find).and_return(mock_space(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(space_url(mock_space))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested space" do
        Space.should_receive(:find).with("37").and_return(mock_space)
        mock_space.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :space => {:these => 'params'}
      end

      it "should expose the space as @space" do
        Space.stub!(:find).and_return(mock_space(:update_attributes => false))
        put :update, :id => "1"
        assigns(:space).should equal(mock_space)
      end

      it "should re-render the 'edit' template" do
        Space.stub!(:find).and_return(mock_space(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested space" do
      Space.should_receive(:find).with("37").and_return(mock_space)
      mock_space.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the spaces list" do
      Space.stub!(:find).and_return(mock_space(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(spaces_url)
    end

  end

end
