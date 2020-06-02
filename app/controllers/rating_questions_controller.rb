class RatingQuestionsController < ApplicationController
  
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  
  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    # strong_parameters will catch this for you and return the same status (400). You do not need this line here in the controller. However, removing it might cause some of your tests to fail -- they will likely raise an ActionController::ParameterMissing exception. See if you can solve these tests.
    head 400 if !rating_question_params[:title]
 
    @rating_question = RatingQuestion.new(rating_question_params)

    if @rating_question.save
      respond_to do |format|
        format.html { redirect_to '/', notice: "Your question has been created." }
        format.json { render 'show', status: 201 }
      end
    else
      errors = { 'errors' => @rating_question.errors.messages }

      respond_to do |format|
        # A better behaviour for the fail case: re-render the new template and display the flash msg. We should present the user with a form containing whatever they've entered, and error messages indicating which fields have failed.
        format.html { redirect_to '/', alert: "Your question has NOT been created." }
        format.json { render json: errors, status: 422 }
      end
    end
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end
  
  def show
 
  end

  def update
    @rating_question.update(rating_question_params)
    # What happens if someone tries to update a question with a blank title here?

    notice = "Your question has been updated."

    respond_to do |format|
      format.html { redirect_to "/", notice: notice }
      format.json { render :show }
    end
  end

  def edit
  end

  def destroy
    @rating_question.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: "Your question has been deleted." }
      format.json { head 204 }
    end
  end

  private
  def rating_question_params
    params.require(:rating_question).permit(:title, :tag)
  end

  def find_question
    @rating_question = RatingQuestion.find(params[:id])
    
    return head 404 unless @rating_question
  end
end
