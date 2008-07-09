require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpaceRolesController do
  describe "route generation" do

    it "should map { :controller => 'space_roles', :action => 'index' } to /space_roles" do
      route_for(:controller => "space_roles", :action => "index").should == "/space_roles"
    end
  
    it "should map { :controller => 'space_roles', :action => 'new' } to /space_roles/new" do
      route_for(:controller => "space_roles", :action => "new").should == "/space_roles/new"
    end
  
    it "should map { :controller => 'space_roles', :action => 'show', :id => 1 } to /space_roles/1" do
      route_for(:controller => "space_roles", :action => "show", :id => 1).should == "/space_roles/1"
    end
  
    it "should map { :controller => 'space_roles', :action => 'edit', :id => 1 } to /space_roles/1/edit" do
      route_for(:controller => "space_roles", :action => "edit", :id => 1).should == "/space_roles/1/edit"
    end
  
    it "should map { :controller => 'space_roles', :action => 'update', :id => 1} to /space_roles/1" do
      route_for(:controller => "space_roles", :action => "update", :id => 1).should == "/space_roles/1"
    end
  
    it "should map { :controller => 'space_roles', :action => 'destroy', :id => 1} to /space_roles/1" do
      route_for(:controller => "space_roles", :action => "destroy", :id => 1).should == "/space_roles/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'space_roles', action => 'index' } from GET /space_roles" do
      params_from(:get, "/space_roles").should == {:controller => "space_roles", :action => "index"}
    end
  
    it "should generate params { :controller => 'space_roles', action => 'new' } from GET /space_roles/new" do
      params_from(:get, "/space_roles/new").should == {:controller => "space_roles", :action => "new"}
    end
  
    it "should generate params { :controller => 'space_roles', action => 'create' } from POST /space_roles" do
      params_from(:post, "/space_roles").should == {:controller => "space_roles", :action => "create"}
    end
  
    it "should generate params { :controller => 'space_roles', action => 'show', id => '1' } from GET /space_roles/1" do
      params_from(:get, "/space_roles/1").should == {:controller => "space_roles", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'space_roles', action => 'edit', id => '1' } from GET /space_roles/1;edit" do
      params_from(:get, "/space_roles/1/edit").should == {:controller => "space_roles", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'space_roles', action => 'update', id => '1' } from PUT /space_roles/1" do
      params_from(:put, "/space_roles/1").should == {:controller => "space_roles", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'space_roles', action => 'destroy', id => '1' } from DELETE /space_roles/1" do
      params_from(:delete, "/space_roles/1").should == {:controller => "space_roles", :action => "destroy", :id => "1"}
    end
  end
end
