require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QisAnswersController do
  describe "route generation" do

    it "should map { :controller => 'qis_answers', :action => 'index' } to /qis_answers" do
      route_for(:controller => "qis_answers", :action => "index").should == "/qis_answers"
    end
  
    it "should map { :controller => 'qis_answers', :action => 'new' } to /qis_answers/new" do
      route_for(:controller => "qis_answers", :action => "new").should == "/qis_answers/new"
    end
  
    it "should map { :controller => 'qis_answers', :action => 'show', :id => 1 } to /qis_answers/1" do
      route_for(:controller => "qis_answers", :action => "show", :id => 1).should == "/qis_answers/1"
    end
  
    it "should map { :controller => 'qis_answers', :action => 'edit', :id => 1 } to /qis_answers/1/edit" do
      route_for(:controller => "qis_answers", :action => "edit", :id => 1).should == "/qis_answers/1/edit"
    end
  
    it "should map { :controller => 'qis_answers', :action => 'update', :id => 1} to /qis_answers/1" do
      route_for(:controller => "qis_answers", :action => "update", :id => 1).should == "/qis_answers/1"
    end
  
    it "should map { :controller => 'qis_answers', :action => 'destroy', :id => 1} to /qis_answers/1" do
      route_for(:controller => "qis_answers", :action => "destroy", :id => 1).should == "/qis_answers/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'qis_answers', action => 'index' } from GET /qis_answers" do
      params_from(:get, "/qis_answers").should == {:controller => "qis_answers", :action => "index"}
    end
  
    it "should generate params { :controller => 'qis_answers', action => 'new' } from GET /qis_answers/new" do
      params_from(:get, "/qis_answers/new").should == {:controller => "qis_answers", :action => "new"}
    end
  
    it "should generate params { :controller => 'qis_answers', action => 'create' } from POST /qis_answers" do
      params_from(:post, "/qis_answers").should == {:controller => "qis_answers", :action => "create"}
    end
  
    it "should generate params { :controller => 'qis_answers', action => 'show', id => '1' } from GET /qis_answers/1" do
      params_from(:get, "/qis_answers/1").should == {:controller => "qis_answers", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'qis_answers', action => 'edit', id => '1' } from GET /qis_answers/1;edit" do
      params_from(:get, "/qis_answers/1/edit").should == {:controller => "qis_answers", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'qis_answers', action => 'update', id => '1' } from PUT /qis_answers/1" do
      params_from(:put, "/qis_answers/1").should == {:controller => "qis_answers", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'qis_answers', action => 'destroy', id => '1' } from DELETE /qis_answers/1" do
      params_from(:delete, "/qis_answers/1").should == {:controller => "qis_answers", :action => "destroy", :id => "1"}
    end
  end
end
