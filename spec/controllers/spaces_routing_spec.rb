require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpacesController do
  describe "route generation" do

    it "should map { :controller => 'spaces', :action => 'index' } to /spaces" do
      route_for(:controller => "spaces", :action => "index").should == "/spaces"
    end
  
    it "should map { :controller => 'spaces', :action => 'new' } to /spaces/new" do
      route_for(:controller => "spaces", :action => "new").should == "/spaces/new"
    end
  
    it "should map { :controller => 'spaces', :action => 'show', :id => 1 } to /spaces/1" do
      route_for(:controller => "spaces", :action => "show", :id => 1).should == "/spaces/1"
    end
  
    it "should map { :controller => 'spaces', :action => 'edit', :id => 1 } to /spaces/1/edit" do
      route_for(:controller => "spaces", :action => "edit", :id => 1).should == "/spaces/1/edit"
    end
  
    it "should map { :controller => 'spaces', :action => 'update', :id => 1} to /spaces/1" do
      route_for(:controller => "spaces", :action => "update", :id => 1).should == "/spaces/1"
    end
  
    it "should map { :controller => 'spaces', :action => 'destroy', :id => 1} to /spaces/1" do
      route_for(:controller => "spaces", :action => "destroy", :id => 1).should == "/spaces/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'spaces', action => 'index' } from GET /spaces" do
      params_from(:get, "/spaces").should == {:controller => "spaces", :action => "index"}
    end
  
    it "should generate params { :controller => 'spaces', action => 'new' } from GET /spaces/new" do
      params_from(:get, "/spaces/new").should == {:controller => "spaces", :action => "new"}
    end
  
    it "should generate params { :controller => 'spaces', action => 'create' } from POST /spaces" do
      params_from(:post, "/spaces").should == {:controller => "spaces", :action => "create"}
    end
  
    it "should generate params { :controller => 'spaces', action => 'show', id => '1' } from GET /spaces/1" do
      params_from(:get, "/spaces/1").should == {:controller => "spaces", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'spaces', action => 'edit', id => '1' } from GET /spaces/1;edit" do
      params_from(:get, "/spaces/1/edit").should == {:controller => "spaces", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'spaces', action => 'update', id => '1' } from PUT /spaces/1" do
      params_from(:put, "/spaces/1").should == {:controller => "spaces", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'spaces', action => 'destroy', id => '1' } from DELETE /spaces/1" do
      params_from(:delete, "/spaces/1").should == {:controller => "spaces", :action => "destroy", :id => "1"}
    end
  end
end
