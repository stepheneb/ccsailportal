require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QisQuestionsController do

  def mock_qis_question(stubs={})
    @mock_qis_question ||= mock_model(QisQuestion, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all qis_questions as @qis_questions" do
      QisQuestion.should_receive(:find).with(:all).and_return([mock_qis_question])
      get :index
      assigns[:qis_questions].should == [mock_qis_question]
    end

    describe "with mime type of xml" do
  
      it "should render all qis_questions as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        QisQuestion.should_receive(:find).with(:all).and_return(qis_questions = mock("Array of QisQuestions"))
        qis_questions.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested qis_question as @qis_question" do
      QisQuestion.should_receive(:find).with("37").and_return(mock_qis_question)
      get :show, :id => "37"
      assigns[:qis_question].should equal(mock_qis_question)
    end
    
    describe "with mime type of xml" do

      it "should render the requested qis_question as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        QisQuestion.should_receive(:find).with("37").and_return(mock_qis_question)
        mock_qis_question.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new qis_question as @qis_question" do
      QisQuestion.should_receive(:new).and_return(mock_qis_question)
      get :new
      assigns[:qis_question].should equal(mock_qis_question)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested qis_question as @qis_question" do
      QisQuestion.should_receive(:find).with("37").and_return(mock_qis_question)
      get :edit, :id => "37"
      assigns[:qis_question].should equal(mock_qis_question)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created qis_question as @qis_question" do
        QisQuestion.should_receive(:new).with({'these' => 'params'}).and_return(mock_qis_question(:save => true))
        post :create, :qis_question => {:these => 'params'}
        assigns(:qis_question).should equal(mock_qis_question)
      end

      it "should redirect to the created qis_question" do
        QisQuestion.stub!(:new).and_return(mock_qis_question(:save => true))
        post :create, :qis_question => {}
        response.should redirect_to(qis_question_url(mock_qis_question))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved qis_question as @qis_question" do
        QisQuestion.stub!(:new).with({'these' => 'params'}).and_return(mock_qis_question(:save => false))
        post :create, :qis_question => {:these => 'params'}
        assigns(:qis_question).should equal(mock_qis_question)
      end

      it "should re-render the 'new' template" do
        QisQuestion.stub!(:new).and_return(mock_qis_question(:save => false))
        post :create, :qis_question => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested qis_question" do
        QisQuestion.should_receive(:find).with("37").and_return(mock_qis_question)
        mock_qis_question.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :qis_question => {:these => 'params'}
      end

      it "should expose the requested qis_question as @qis_question" do
        QisQuestion.stub!(:find).and_return(mock_qis_question(:update_attributes => true))
        put :update, :id => "1"
        assigns(:qis_question).should equal(mock_qis_question)
      end

      it "should redirect to the qis_question" do
        QisQuestion.stub!(:find).and_return(mock_qis_question(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(qis_question_url(mock_qis_question))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested qis_question" do
        QisQuestion.should_receive(:find).with("37").and_return(mock_qis_question)
        mock_qis_question.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :qis_question => {:these => 'params'}
      end

      it "should expose the qis_question as @qis_question" do
        QisQuestion.stub!(:find).and_return(mock_qis_question(:update_attributes => false))
        put :update, :id => "1"
        assigns(:qis_question).should equal(mock_qis_question)
      end

      it "should re-render the 'edit' template" do
        QisQuestion.stub!(:find).and_return(mock_qis_question(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested qis_question" do
      QisQuestion.should_receive(:find).with("37").and_return(mock_qis_question)
      mock_qis_question.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the qis_questions list" do
      QisQuestion.stub!(:find).and_return(mock_qis_question(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(qis_questions_url)
    end

  end

end
