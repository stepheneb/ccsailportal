class QisAnswersController < ApplicationController
  # GET /qis_answers
  # GET /qis_answers.xml
  def index
    if !params[:offering_id].nil?
      @offering = Offering.find(params[:offering_id])
      @qis_question = @offering.item
      @qis_answers = []
      @offering.child_items.each do |item| 
        @qis_answers << item
      end
    else
      @qis_answers = QisAnswer.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qis_answers }
    end
  end

  # GET /qis_answers/1
  # GET /qis_answers/1.xml
  def show
    @qis_answer = QisAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qis_answer }
    end
  end

  # GET /qis_answers/new
  # GET /qis_answers/new.xml
  def new
    @qis_answer = QisAnswer.new
    if !params[:offering_id].nil?
      @offering = Offering.find(params[:offering_id])
      @qis_answer.question = @offering.item
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qis_answer }
    end
  end

  # GET /qis_answers/1/edit
  def edit
    @qis_answer = QisAnswer.find(params[:id])
  end

  # POST /qis_answers
  # POST /qis_answers.xml
  def create
    @qis_answer = QisAnswer.new(params[:qis_answer])

    respond_to do |format|
      if @qis_answer.save

        if !params[:offering_id].nil?
          @qis_answer.parent_offering = Offering.find(params[:offering_id])          
          @qis_answer.owners = [current_user]
          @qis_answer.save
        end
        
        flash[:notice] = 'QisAnswer was successfully created.'
        format.html { redirect_to(@qis_answer) }
        format.xml  { render :xml => @qis_answer, :status => :created, :location => @qis_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qis_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qis_answers/1
  # PUT /qis_answers/1.xml
  def update
    @qis_answer = QisAnswer.find(params[:id])

    respond_to do |format|
      if @qis_answer.update_attributes(params[:qis_answer])
        flash[:notice] = 'QisAnswer was successfully updated.'
        format.html { redirect_to(@qis_answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qis_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qis_answers/1
  # DELETE /qis_answers/1.xml
  def destroy
    @qis_answer = QisAnswer.find(params[:id])
    @qis_answer.destroy

    respond_to do |format|
      format.html { redirect_to(qis_answers_url) }
      format.xml  { head :ok }
    end
  end
end
