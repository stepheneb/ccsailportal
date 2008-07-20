class QisQuestionsController < ApplicationController
  # GET /qis_questions
  # GET /qis_questions.xml
  def index
    @qis_questions = QisQuestion.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qis_questions }
    end
  end

  # GET /qis_questions/1
  # GET /qis_questions/1.xml
  def show
    @qis_question = QisQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qis_question }
    end
  end

  # GET /qis_questions/new
  # GET /qis_questions/new.xml
  def new
    @qis_question = QisQuestion.new    
    
    if !params[:offering_id].nil?
      @offering = Offering.find(params[:offering_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qis_question }
    end
  end

  # GET /qis_questions/1/edit
  def edit
    @qis_question = QisQuestion.find(params[:id])
  end

  # POST /qis_questions
  # POST /qis_questions.xml
  def create
    @qis_question = QisQuestion.new(params[:qis_question])

    respond_to do |format|
      if @qis_question.save

        if !params[:offering_id].nil?
          @qis_question.parent_offering = Offering.find(params[:offering_id])
          @qis_question.owners = [current_user]
          @qis_question.save
        end

        

        flash[:notice] = 'QisQuestion was successfully created.'
        format.html { redirect_to(@qis_question) }
        format.xml  { render :xml => @qis_question, :status => :created, :location => @qis_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qis_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qis_questions/1
  # PUT /qis_questions/1.xml
  def update
    @qis_question = QisQuestion.find(params[:id])

    respond_to do |format|
      if @qis_question.update_attributes(params[:qis_question])
        flash[:notice] = 'QisQuestion was successfully updated.'
        format.html { redirect_to(@qis_question) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qis_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qis_questions/1
  # DELETE /qis_questions/1.xml
  def destroy
    @qis_question = QisQuestion.find(params[:id])
    @qis_question.destroy

    respond_to do |format|
      format.html { redirect_to(qis_questions_url) }
      format.xml  { head :ok }
    end
  end
end
