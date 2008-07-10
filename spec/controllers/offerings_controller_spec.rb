require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OfferingsController do

  def mock_offering(stubs={})
    @mock_offering ||= mock_model(Offering, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all offerings as @offerings" do
      Offering.should_receive(:find).with(:all).and_return([mock_offering])
      get :index
      assigns[:offerings].should == [mock_offering]
    end

    describe "with mime type of xml" do
  
      it "should render all offerings as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Offering.should_receive(:find).with(:all).and_return(offerings = mock("Array of Offerings"))
        offerings.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested offering as @offering" do
      Offering.should_receive(:find).with("37").and_return(mock_offering)
      get :show, :id => "37"
      assigns[:offering].should equal(mock_offering)
    end
    
    describe "with mime type of xml" do

      it "should render the requested offering as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Offering.should_receive(:find).with("37").and_return(mock_offering)
        mock_offering.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new offering as @offering" do
      Offering.should_receive(:new).and_return(mock_offering)
      get :new
      assigns[:offering].should equal(mock_offering)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested offering as @offering" do
      Offering.should_receive(:find).with("37").and_return(mock_offering)
      get :edit, :id => "37"
      assigns[:offering].should equal(mock_offering)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created offering as @offering" do
        Offering.should_receive(:new).with({'these' => 'params'}).and_return(mock_offering(:save => true))
        post :create, :offering => {:these => 'params'}
        assigns(:offering).should equal(mock_offering)
      end

      it "should redirect to the created offering" do
        Offering.stub!(:new).and_return(mock_offering(:save => true))
        post :create, :offering => {}
        response.should redirect_to(offering_url(mock_offering))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved offering as @offering" do
        Offering.stub!(:new).with({'these' => 'params'}).and_return(mock_offering(:save => false))
        post :create, :offering => {:these => 'params'}
        assigns(:offering).should equal(mock_offering)
      end

      it "should re-render the 'new' template" do
        Offering.stub!(:new).and_return(mock_offering(:save => false))
        post :create, :offering => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested offering" do
        Offering.should_receive(:find).with("37").and_return(mock_offering)
        mock_offering.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offering => {:these => 'params'}
      end

      it "should expose the requested offering as @offering" do
        Offering.stub!(:find).and_return(mock_offering(:update_attributes => true))
        put :update, :id => "1"
        assigns(:offering).should equal(mock_offering)
      end

      it "should redirect to the offering" do
        Offering.stub!(:find).and_return(mock_offering(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(offering_url(mock_offering))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested offering" do
        Offering.should_receive(:find).with("37").and_return(mock_offering)
        mock_offering.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offering => {:these => 'params'}
      end

      it "should expose the offering as @offering" do
        Offering.stub!(:find).and_return(mock_offering(:update_attributes => false))
        put :update, :id => "1"
        assigns(:offering).should equal(mock_offering)
      end

      it "should re-render the 'edit' template" do
        Offering.stub!(:find).and_return(mock_offering(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested offering" do
      Offering.should_receive(:find).with("37").and_return(mock_offering)
      mock_offering.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the offerings list" do
      Offering.stub!(:find).and_return(mock_offering(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(offerings_url)
    end

  end

end
