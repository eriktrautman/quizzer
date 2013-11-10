class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    user = User.find_by_id(params[:quiz][:user_id])
    if user
      @quiz = Quiz.new(quiz_params)
      if @quiz.save
        @quiz.create_queue
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

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    user = User.find_by_id(params[:quiz][:user_id])
    if user
      @quiz = Quiz.find_by_id(params[:id])
      if @quiz.update_attributes(quiz_params)
        user.create_category_queues(quiz_params[:category_ids])
        flash[:success] = "Quiz Updated!"
        redirect_to quizzes_path
      else
        flash[:error] = "Quiz couldn't be updated because: #{@quiz.errors.full_messages}!"
        render :new
      end
    else
      flash[:error] = "Quiz couldn't be updated because the User was invalid"
      render :new
    end
  end

  def destroy
    quiz = Quiz.find(params[:id])
    if quiz.destroy
      flash[:success] = "Quiz #{quiz.name} was destroyed successfully"
      redirect_to quizzes_path
    else
      flash[:error] = "Quiz #{quiz.name} couldn't be destroyed because of errors: #{quiz.errors.full_messages}"
      redirect_to quizzes_path
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
      card = Card.find(params[:card_id])

      card.pass(user) if params[:card_status] == "pass"
      card.fail(user) if params[:card_status] == "fail"

      cv = CardView.find_or_create(user, card)
      quiz.shuffle_card_into_queue(cv)

      current_card = quiz.current_card
      redirect_to quiz_card_path(quiz, current_card)
    else
      flash[:error] = "Couldn't figure out whether you passed or failed that particular card... try again?"
      redirect_to :back
    end
  end

  def reshuffle_queue
    quiz = Quiz.find(params[:quiz_id])
    quiz.shuffle_queue
    redirect_to quiz_card_path(quiz, quiz.current_card)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:user_id, :name, :category_ids => [])
  end


end
