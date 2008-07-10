require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemOwnersController do
  describe "route generation" do

    it "should map { :controller => 'item_owners', :action => 'index' } to /item_owners" do
      route_for(:controller => "item_owners", :action => "index").should == "/item_owners"
    end
  
    it "should map { :controller => 'item_owners', :action => 'new' } to /item_owners/new" do
      route_for(:controller => "item_owners", :action => "new").should == "/item_owners/new"
    end
  
    it "should map { :controller => 'item_owners', :action => 'show', :id => 1 } to /item_owners/1" do
      route_for(:controller => "item_owners", :action => "show", :id => 1).should == "/item_owners/1"
    end
  
    it "should map { :controller => 'item_owners', :action => 'edit', :id => 1 } to /item_owners/1/edit" do
      route_for(:controller => "item_owners", :action => "edit", :id => 1).should == "/item_owners/1/edit"
    end
  
    it "should map { :controller => 'item_owners', :action => 'update', :id => 1} to /item_owners/1" do
      route_for(:controller => "item_owners", :action => "update", :id => 1).should == "/item_owners/1"
    end
  
    it "should map { :controller => 'item_owners', :action => 'destroy', :id => 1} to /item_owners/1" do
      route_for(:controller => "item_owners", :action => "destroy", :id => 1).should == "/item_owners/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'item_owners', action => 'index' } from GET /item_owners" do
      params_from(:get, "/item_owners").should == {:controller => "item_owners", :action => "index"}
    end
  
    it "should generate params { :controller => 'item_owners', action => 'new' } from GET /item_owners/new" do
      params_from(:get, "/item_owners/new").should == {:controller => "item_owners", :action => "new"}
    end
  
    it "should generate params { :controller => 'item_owners', action => 'create' } from POST /item_owners" do
      params_from(:post, "/item_owners").should == {:controller => "item_owners", :action => "create"}
    end
  
    it "should generate params { :controller => 'item_owners', action => 'show', id => '1' } from GET /item_owners/1" do
      params_from(:get, "/item_owners/1").should == {:controller => "item_owners", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_owners', action => 'edit', id => '1' } from GET /item_owners/1;edit" do
      params_from(:get, "/item_owners/1/edit").should == {:controller => "item_owners", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_owners', action => 'update', id => '1' } from PUT /item_owners/1" do
      params_from(:put, "/item_owners/1").should == {:controller => "item_owners", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_owners', action => 'destroy', id => '1' } from DELETE /item_owners/1" do
      params_from(:delete, "/item_owners/1").should == {:controller => "item_owners", :action => "destroy", :id => "1"}
    end
  end
end
