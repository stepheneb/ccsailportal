require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpaceRolesController do

  def mock_space_role(stubs={})
    @mock_space_role ||= mock_model(SpaceRole, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all space_roles as @space_roles" do
      SpaceRole.should_receive(:find).with(:all).and_return([mock_space_role])
      get :index
      assigns[:space_roles].should == [mock_space_role]
    end

    describe "with mime type of xml" do
  
      it "should render all space_roles as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        SpaceRole.should_receive(:find).with(:all).and_return(space_roles = mock("Array of SpaceRoles"))
        space_roles.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested space_role as @space_role" do
      SpaceRole.should_receive(:find).with("37").and_return(mock_space_role)
      get :show, :id => "37"
      assigns[:space_role].should equal(mock_space_role)
    end
    
    describe "with mime type of xml" do

      it "should render the requested space_role as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        SpaceRole.should_receive(:find).with("37").and_return(mock_space_role)
        mock_space_role.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new space_role as @space_role" do
      SpaceRole.should_receive(:new).and_return(mock_space_role)
      get :new
      assigns[:space_role].should equal(mock_space_role)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested space_role as @space_role" do
      SpaceRole.should_receive(:find).with("37").and_return(mock_space_role)
      get :edit, :id => "37"
      assigns[:space_role].should equal(mock_space_role)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created space_role as @space_role" do
        SpaceRole.should_receive(:new).with({'these' => 'params'}).and_return(mock_space_role(:save => true))
        post :create, :space_role => {:these => 'params'}
        assigns(:space_role).should equal(mock_space_role)
      end

      it "should redirect to the created space_role" do
        SpaceRole.stub!(:new).and_return(mock_space_role(:save => true))
        post :create, :space_role => {}
        response.should redirect_to(space_role_url(mock_space_role))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved space_role as @space_role" do
        SpaceRole.stub!(:new).with({'these' => 'params'}).and_return(mock_space_role(:save => false))
        post :create, :space_role => {:these => 'params'}
        assigns(:space_role).should equal(mock_space_role)
      end

      it "should re-render the 'new' template" do
        SpaceRole.stub!(:new).and_return(mock_space_role(:save => false))
        post :create, :space_role => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested space_role" do
        SpaceRole.should_receive(:find).with("37").and_return(mock_space_role)
        mock_space_role.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :space_role => {:these => 'params'}
      end

      it "should expose the requested space_role as @space_role" do
        SpaceRole.stub!(:find).and_return(mock_space_role(:update_attributes => true))
        put :update, :id => "1"
        assigns(:space_role).should equal(mock_space_role)
      end

      it "should redirect to the space_role" do
        SpaceRole.stub!(:find).and_return(mock_space_role(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(space_role_url(mock_space_role))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested space_role" do
        SpaceRole.should_receive(:find).with("37").and_return(mock_space_role)
        mock_space_role.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :space_role => {:these => 'params'}
      end

      it "should expose the space_role as @space_role" do
        SpaceRole.stub!(:find).and_return(mock_space_role(:update_attributes => false))
        put :update, :id => "1"
        assigns(:space_role).should equal(mock_space_role)
      end

      it "should re-render the 'edit' template" do
        SpaceRole.stub!(:find).and_return(mock_space_role(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested space_role" do
      SpaceRole.should_receive(:find).with("37").and_return(mock_space_role)
      mock_space_role.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the space_roles list" do
      SpaceRole.stub!(:find).and_return(mock_space_role(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(space_roles_url)
    end

  end

end
