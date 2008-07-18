require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QisQuestionsController do
  describe "route generation" do

    it "should map { :controller => 'qis_questions', :action => 'index' } to /qis_questions" do
      route_for(:controller => "qis_questions", :action => "index").should == "/qis_questions"
    end
  
    it "should map { :controller => 'qis_questions', :action => 'new' } to /qis_questions/new" do
      route_for(:controller => "qis_questions", :action => "new").should == "/qis_questions/new"
    end
  
    it "should map { :controller => 'qis_questions', :action => 'show', :id => 1 } to /qis_questions/1" do
      route_for(:controller => "qis_questions", :action => "show", :id => 1).should == "/qis_questions/1"
    end
  
    it "should map { :controller => 'qis_questions', :action => 'edit', :id => 1 } to /qis_questions/1/edit" do
      route_for(:controller => "qis_questions", :action => "edit", :id => 1).should == "/qis_questions/1/edit"
    end
  
    it "should map { :controller => 'qis_questions', :action => 'update', :id => 1} to /qis_questions/1" do
      route_for(:controller => "qis_questions", :action => "update", :id => 1).should == "/qis_questions/1"
    end
  
    it "should map { :controller => 'qis_questions', :action => 'destroy', :id => 1} to /qis_questions/1" do
      route_for(:controller => "qis_questions", :action => "destroy", :id => 1).should == "/qis_questions/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'qis_questions', action => 'index' } from GET /qis_questions" do
      params_from(:get, "/qis_questions").should == {:controller => "qis_questions", :action => "index"}
    end
  
    it "should generate params { :controller => 'qis_questions', action => 'new' } from GET /qis_questions/new" do
      params_from(:get, "/qis_questions/new").should == {:controller => "qis_questions", :action => "new"}
    end
  
    it "should generate params { :controller => 'qis_questions', action => 'create' } from POST /qis_questions" do
      params_from(:post, "/qis_questions").should == {:controller => "qis_questions", :action => "create"}
    end
  
    it "should generate params { :controller => 'qis_questions', action => 'show', id => '1' } from GET /qis_questions/1" do
      params_from(:get, "/qis_questions/1").should == {:controller => "qis_questions", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'qis_questions', action => 'edit', id => '1' } from GET /qis_questions/1;edit" do
      params_from(:get, "/qis_questions/1/edit").should == {:controller => "qis_questions", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'qis_questions', action => 'update', id => '1' } from PUT /qis_questions/1" do
      params_from(:put, "/qis_questions/1").should == {:controller => "qis_questions", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'qis_questions', action => 'destroy', id => '1' } from DELETE /qis_questions/1" do
      params_from(:delete, "/qis_questions/1").should == {:controller => "qis_questions", :action => "destroy", :id => "1"}
    end
  end
end
