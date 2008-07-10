require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemReferencesController do
  describe "route generation" do

    it "should map { :controller => 'item_references', :action => 'index' } to /item_references" do
      route_for(:controller => "item_references", :action => "index").should == "/item_references"
    end
  
    it "should map { :controller => 'item_references', :action => 'new' } to /item_references/new" do
      route_for(:controller => "item_references", :action => "new").should == "/item_references/new"
    end
  
    it "should map { :controller => 'item_references', :action => 'show', :id => 1 } to /item_references/1" do
      route_for(:controller => "item_references", :action => "show", :id => 1).should == "/item_references/1"
    end
  
    it "should map { :controller => 'item_references', :action => 'edit', :id => 1 } to /item_references/1/edit" do
      route_for(:controller => "item_references", :action => "edit", :id => 1).should == "/item_references/1/edit"
    end
  
    it "should map { :controller => 'item_references', :action => 'update', :id => 1} to /item_references/1" do
      route_for(:controller => "item_references", :action => "update", :id => 1).should == "/item_references/1"
    end
  
    it "should map { :controller => 'item_references', :action => 'destroy', :id => 1} to /item_references/1" do
      route_for(:controller => "item_references", :action => "destroy", :id => 1).should == "/item_references/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'item_references', action => 'index' } from GET /item_references" do
      params_from(:get, "/item_references").should == {:controller => "item_references", :action => "index"}
    end
  
    it "should generate params { :controller => 'item_references', action => 'new' } from GET /item_references/new" do
      params_from(:get, "/item_references/new").should == {:controller => "item_references", :action => "new"}
    end
  
    it "should generate params { :controller => 'item_references', action => 'create' } from POST /item_references" do
      params_from(:post, "/item_references").should == {:controller => "item_references", :action => "create"}
    end
  
    it "should generate params { :controller => 'item_references', action => 'show', id => '1' } from GET /item_references/1" do
      params_from(:get, "/item_references/1").should == {:controller => "item_references", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_references', action => 'edit', id => '1' } from GET /item_references/1;edit" do
      params_from(:get, "/item_references/1/edit").should == {:controller => "item_references", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_references', action => 'update', id => '1' } from PUT /item_references/1" do
      params_from(:put, "/item_references/1").should == {:controller => "item_references", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_references', action => 'destroy', id => '1' } from DELETE /item_references/1" do
      params_from(:delete, "/item_references/1").should == {:controller => "item_references", :action => "destroy", :id => "1"}
    end
  end
end
