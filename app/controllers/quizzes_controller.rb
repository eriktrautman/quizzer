class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    # @users = User.all
  end

  def create
    user = User.find_by_id(params[:quiz][:user_id])
    if user
      @quiz = Quiz.new(quiz_params)
      if @quiz.save
        user.create_category_queues(quiz_params[:category_ids])
        flash[:success] = "Quiz Created!"
        redirect_to quiz_current_card_path(@quiz)
      else
        flash[:error] = "Quiz couldn't be created because: #{@quiz.errors.full_messages}!"
        render :new
      end
    else
      flash[:error] = "Quiz couldn't be created because the User was invalid"
      render :new
    end
  end

  def current_card
    quiz = Quiz.find(params[:quiz_id])
    current_card = quiz.current_card
    redirect_to quiz_card_path(quiz, current_card)
  end

  # Advance to the next card, first stashing the current card
  # and updating its status depending whether it passed or failed
  def next_card
    if ["pass","fail"].include?(params[:card_status])
      quiz = Quiz.find(params[:quiz_id])
      user = quiz.user
      current_card = quiz.current_card
      user.pass_card(current_card) if params[:card_status] == "pass"
      user.fail_card(current_card) if params[:card_status] == "fail"
      flash[:success] = "Good work! Next card:"
      current_card = quiz.current_card
      redirect_to quiz_card_path(quiz, current_card)
    else
      flash[:error] = "Couldn't figure out whether you passed or failed that particular card... try again?"
      redirect_to :back
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:user_id, :name, :category_ids => [])
  end


end
