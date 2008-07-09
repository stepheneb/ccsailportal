require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSpaceRolesController do
  describe "route generation" do

    it "should map { :controller => 'user_space_roles', :action => 'index' } to /user_space_roles" do
      route_for(:controller => "user_space_roles", :action => "index").should == "/user_space_roles"
    end
  
    it "should map { :controller => 'user_space_roles', :action => 'new' } to /user_space_roles/new" do
      route_for(:controller => "user_space_roles", :action => "new").should == "/user_space_roles/new"
    end
  
    it "should map { :controller => 'user_space_roles', :action => 'show', :id => 1 } to /user_space_roles/1" do
      route_for(:controller => "user_space_roles", :action => "show", :id => 1).should == "/user_space_roles/1"
    end
  
    it "should map { :controller => 'user_space_roles', :action => 'edit', :id => 1 } to /user_space_roles/1/edit" do
      route_for(:controller => "user_space_roles", :action => "edit", :id => 1).should == "/user_space_roles/1/edit"
    end
  
    it "should map { :controller => 'user_space_roles', :action => 'update', :id => 1} to /user_space_roles/1" do
      route_for(:controller => "user_space_roles", :action => "update", :id => 1).should == "/user_space_roles/1"
    end
  
    it "should map { :controller => 'user_space_roles', :action => 'destroy', :id => 1} to /user_space_roles/1" do
      route_for(:controller => "user_space_roles", :action => "destroy", :id => 1).should == "/user_space_roles/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'user_space_roles', action => 'index' } from GET /user_space_roles" do
      params_from(:get, "/user_space_roles").should == {:controller => "user_space_roles", :action => "index"}
    end
  
    it "should generate params { :controller => 'user_space_roles', action => 'new' } from GET /user_space_roles/new" do
      params_from(:get, "/user_space_roles/new").should == {:controller => "user_space_roles", :action => "new"}
    end
  
    it "should generate params { :controller => 'user_space_roles', action => 'create' } from POST /user_space_roles" do
      params_from(:post, "/user_space_roles").should == {:controller => "user_space_roles", :action => "create"}
    end
  
    it "should generate params { :controller => 'user_space_roles', action => 'show', id => '1' } from GET /user_space_roles/1" do
      params_from(:get, "/user_space_roles/1").should == {:controller => "user_space_roles", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'user_space_roles', action => 'edit', id => '1' } from GET /user_space_roles/1;edit" do
      params_from(:get, "/user_space_roles/1/edit").should == {:controller => "user_space_roles", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'user_space_roles', action => 'update', id => '1' } from PUT /user_space_roles/1" do
      params_from(:put, "/user_space_roles/1").should == {:controller => "user_space_roles", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'user_space_roles', action => 'destroy', id => '1' } from DELETE /user_space_roles/1" do
      params_from(:delete, "/user_space_roles/1").should == {:controller => "user_space_roles", :action => "destroy", :id => "1"}
    end
  end
end
