require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QisAnswersController do

  def mock_qis_answer(stubs={})
    @mock_qis_answer ||= mock_model(QisAnswer, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all qis_answers as @qis_answers" do
      QisAnswer.should_receive(:find).with(:all).and_return([mock_qis_answer])
      get :index
      assigns[:qis_answers].should == [mock_qis_answer]
    end

    describe "with mime type of xml" do
  
      it "should render all qis_answers as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        QisAnswer.should_receive(:find).with(:all).and_return(qis_answers = mock("Array of QisAnswers"))
        qis_answers.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested qis_answer as @qis_answer" do
      QisAnswer.should_receive(:find).with("37").and_return(mock_qis_answer)
      get :show, :id => "37"
      assigns[:qis_answer].should equal(mock_qis_answer)
    end
    
    describe "with mime type of xml" do

      it "should render the requested qis_answer as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        QisAnswer.should_receive(:find).with("37").and_return(mock_qis_answer)
        mock_qis_answer.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new qis_answer as @qis_answer" do
      QisAnswer.should_receive(:new).and_return(mock_qis_answer)
      get :new
      assigns[:qis_answer].should equal(mock_qis_answer)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested qis_answer as @qis_answer" do
      QisAnswer.should_receive(:find).with("37").and_return(mock_qis_answer)
      get :edit, :id => "37"
      assigns[:qis_answer].should equal(mock_qis_answer)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created qis_answer as @qis_answer" do
        QisAnswer.should_receive(:new).with({'these' => 'params'}).and_return(mock_qis_answer(:save => true))
        post :create, :qis_answer => {:these => 'params'}
        assigns(:qis_answer).should equal(mock_qis_answer)
      end

      it "should redirect to the created qis_answer" do
        QisAnswer.stub!(:new).and_return(mock_qis_answer(:save => true))
        post :create, :qis_answer => {}
        response.should redirect_to(qis_answer_url(mock_qis_answer))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved qis_answer as @qis_answer" do
        QisAnswer.stub!(:new).with({'these' => 'params'}).and_return(mock_qis_answer(:save => false))
        post :create, :qis_answer => {:these => 'params'}
        assigns(:qis_answer).should equal(mock_qis_answer)
      end

      it "should re-render the 'new' template" do
        QisAnswer.stub!(:new).and_return(mock_qis_answer(:save => false))
        post :create, :qis_answer => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested qis_answer" do
        QisAnswer.should_receive(:find).with("37").and_return(mock_qis_answer)
        mock_qis_answer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :qis_answer => {:these => 'params'}
      end

      it "should expose the requested qis_answer as @qis_answer" do
        QisAnswer.stub!(:find).and_return(mock_qis_answer(:update_attributes => true))
        put :update, :id => "1"
        assigns(:qis_answer).should equal(mock_qis_answer)
      end

      it "should redirect to the qis_answer" do
        QisAnswer.stub!(:find).and_return(mock_qis_answer(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(qis_answer_url(mock_qis_answer))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested qis_answer" do
        QisAnswer.should_receive(:find).with("37").and_return(mock_qis_answer)
        mock_qis_answer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :qis_answer => {:these => 'params'}
      end

      it "should expose the qis_answer as @qis_answer" do
        QisAnswer.stub!(:find).and_return(mock_qis_answer(:update_attributes => false))
        put :update, :id => "1"
        assigns(:qis_answer).should equal(mock_qis_answer)
      end

      it "should re-render the 'edit' template" do
        QisAnswer.stub!(:find).and_return(mock_qis_answer(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested qis_answer" do
      QisAnswer.should_receive(:find).with("37").and_return(mock_qis_answer)
      mock_qis_answer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the qis_answers list" do
      QisAnswer.stub!(:find).and_return(mock_qis_answer(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(qis_answers_url)
    end

  end

end
