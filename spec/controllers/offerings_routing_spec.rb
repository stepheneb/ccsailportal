require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OfferingsController do
  describe "route generation" do

    it "should map { :controller => 'offerings', :action => 'index' } to /offerings" do
      route_for(:controller => "offerings", :action => "index").should == "/offerings"
    end
  
    it "should map { :controller => 'offerings', :action => 'new' } to /offerings/new" do
      route_for(:controller => "offerings", :action => "new").should == "/offerings/new"
    end
  
    it "should map { :controller => 'offerings', :action => 'show', :id => 1 } to /offerings/1" do
      route_for(:controller => "offerings", :action => "show", :id => 1).should == "/offerings/1"
    end
  
    it "should map { :controller => 'offerings', :action => 'edit', :id => 1 } to /offerings/1/edit" do
      route_for(:controller => "offerings", :action => "edit", :id => 1).should == "/offerings/1/edit"
    end
  
    it "should map { :controller => 'offerings', :action => 'update', :id => 1} to /offerings/1" do
      route_for(:controller => "offerings", :action => "update", :id => 1).should == "/offerings/1"
    end
  
    it "should map { :controller => 'offerings', :action => 'destroy', :id => 1} to /offerings/1" do
      route_for(:controller => "offerings", :action => "destroy", :id => 1).should == "/offerings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'offerings', action => 'index' } from GET /offerings" do
      params_from(:get, "/offerings").should == {:controller => "offerings", :action => "index"}
    end
  
    it "should generate params { :controller => 'offerings', action => 'new' } from GET /offerings/new" do
      params_from(:get, "/offerings/new").should == {:controller => "offerings", :action => "new"}
    end
  
    it "should generate params { :controller => 'offerings', action => 'create' } from POST /offerings" do
      params_from(:post, "/offerings").should == {:controller => "offerings", :action => "create"}
    end
  
    it "should generate params { :controller => 'offerings', action => 'show', id => '1' } from GET /offerings/1" do
      params_from(:get, "/offerings/1").should == {:controller => "offerings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'offerings', action => 'edit', id => '1' } from GET /offerings/1;edit" do
      params_from(:get, "/offerings/1/edit").should == {:controller => "offerings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'offerings', action => 'update', id => '1' } from PUT /offerings/1" do
      params_from(:put, "/offerings/1").should == {:controller => "offerings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'offerings', action => 'destroy', id => '1' } from DELETE /offerings/1" do
      params_from(:delete, "/offerings/1").should == {:controller => "offerings", :action => "destroy", :id => "1"}
    end
  end
end
