require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemServicesController do
  describe "route generation" do

    it "should map { :controller => 'item_services', :action => 'index' } to /item_services" do
      route_for(:controller => "item_services", :action => "index").should == "/item_services"
    end
  
    it "should map { :controller => 'item_services', :action => 'new' } to /item_services/new" do
      route_for(:controller => "item_services", :action => "new").should == "/item_services/new"
    end
  
    it "should map { :controller => 'item_services', :action => 'show', :id => 1 } to /item_services/1" do
      route_for(:controller => "item_services", :action => "show", :id => 1).should == "/item_services/1"
    end
  
    it "should map { :controller => 'item_services', :action => 'edit', :id => 1 } to /item_services/1/edit" do
      route_for(:controller => "item_services", :action => "edit", :id => 1).should == "/item_services/1/edit"
    end
  
    it "should map { :controller => 'item_services', :action => 'update', :id => 1} to /item_services/1" do
      route_for(:controller => "item_services", :action => "update", :id => 1).should == "/item_services/1"
    end
  
    it "should map { :controller => 'item_services', :action => 'destroy', :id => 1} to /item_services/1" do
      route_for(:controller => "item_services", :action => "destroy", :id => 1).should == "/item_services/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'item_services', action => 'index' } from GET /item_services" do
      params_from(:get, "/item_services").should == {:controller => "item_services", :action => "index"}
    end
  
    it "should generate params { :controller => 'item_services', action => 'new' } from GET /item_services/new" do
      params_from(:get, "/item_services/new").should == {:controller => "item_services", :action => "new"}
    end
  
    it "should generate params { :controller => 'item_services', action => 'create' } from POST /item_services" do
      params_from(:post, "/item_services").should == {:controller => "item_services", :action => "create"}
    end
  
    it "should generate params { :controller => 'item_services', action => 'show', id => '1' } from GET /item_services/1" do
      params_from(:get, "/item_services/1").should == {:controller => "item_services", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_services', action => 'edit', id => '1' } from GET /item_services/1;edit" do
      params_from(:get, "/item_services/1/edit").should == {:controller => "item_services", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_services', action => 'update', id => '1' } from PUT /item_services/1" do
      params_from(:put, "/item_services/1").should == {:controller => "item_services", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'item_services', action => 'destroy', id => '1' } from DELETE /item_services/1" do
      params_from(:delete, "/item_services/1").should == {:controller => "item_services", :action => "destroy", :id => "1"}
    end
  end
end
