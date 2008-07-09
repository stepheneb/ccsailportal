require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSpaceRolesController do

  def mock_user_space_role(stubs={})
    @mock_user_space_role ||= mock_model(UserSpaceRole, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all user_space_roles as @user_space_roles" do
      UserSpaceRole.should_receive(:find).with(:all).and_return([mock_user_space_role])
      get :index
      assigns[:user_space_roles].should == [mock_user_space_role]
    end

    describe "with mime type of xml" do
  
      it "should render all user_space_roles as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        UserSpaceRole.should_receive(:find).with(:all).and_return(user_space_roles = mock("Array of UserSpaceRoles"))
        user_space_roles.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested user_space_role as @user_space_role" do
      UserSpaceRole.should_receive(:find).with("37").and_return(mock_user_space_role)
      get :show, :id => "37"
      assigns[:user_space_role].should equal(mock_user_space_role)
    end
    
    describe "with mime type of xml" do

      it "should render the requested user_space_role as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        UserSpaceRole.should_receive(:find).with("37").and_return(mock_user_space_role)
        mock_user_space_role.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new user_space_role as @user_space_role" do
      UserSpaceRole.should_receive(:new).and_return(mock_user_space_role)
      get :new
      assigns[:user_space_role].should equal(mock_user_space_role)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested user_space_role as @user_space_role" do
      UserSpaceRole.should_receive(:find).with("37").and_return(mock_user_space_role)
      get :edit, :id => "37"
      assigns[:user_space_role].should equal(mock_user_space_role)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created user_space_role as @user_space_role" do
        UserSpaceRole.should_receive(:new).with({'these' => 'params'}).and_return(mock_user_space_role(:save => true))
        post :create, :user_space_role => {:these => 'params'}
        assigns(:user_space_role).should equal(mock_user_space_role)
      end

      it "should redirect to the created user_space_role" do
        UserSpaceRole.stub!(:new).and_return(mock_user_space_role(:save => true))
        post :create, :user_space_role => {}
        response.should redirect_to(user_space_role_url(mock_user_space_role))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved user_space_role as @user_space_role" do
        UserSpaceRole.stub!(:new).with({'these' => 'params'}).and_return(mock_user_space_role(:save => false))
        post :create, :user_space_role => {:these => 'params'}
        assigns(:user_space_role).should equal(mock_user_space_role)
      end

      it "should re-render the 'new' template" do
        UserSpaceRole.stub!(:new).and_return(mock_user_space_role(:save => false))
        post :create, :user_space_role => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested user_space_role" do
        UserSpaceRole.should_receive(:find).with("37").and_return(mock_user_space_role)
        mock_user_space_role.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user_space_role => {:these => 'params'}
      end

      it "should expose the requested user_space_role as @user_space_role" do
        UserSpaceRole.stub!(:find).and_return(mock_user_space_role(:update_attributes => true))
        put :update, :id => "1"
        assigns(:user_space_role).should equal(mock_user_space_role)
      end

      it "should redirect to the user_space_role" do
        UserSpaceRole.stub!(:find).and_return(mock_user_space_role(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(user_space_role_url(mock_user_space_role))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested user_space_role" do
        UserSpaceRole.should_receive(:find).with("37").and_return(mock_user_space_role)
        mock_user_space_role.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user_space_role => {:these => 'params'}
      end

      it "should expose the user_space_role as @user_space_role" do
        UserSpaceRole.stub!(:find).and_return(mock_user_space_role(:update_attributes => false))
        put :update, :id => "1"
        assigns(:user_space_role).should equal(mock_user_space_role)
      end

      it "should re-render the 'edit' template" do
        UserSpaceRole.stub!(:find).and_return(mock_user_space_role(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested user_space_role" do
      UserSpaceRole.should_receive(:find).with("37").and_return(mock_user_space_role)
      mock_user_space_role.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the user_space_roles list" do
      UserSpaceRole.stub!(:find).and_return(mock_user_space_role(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(user_space_roles_url)
    end

  end

end
