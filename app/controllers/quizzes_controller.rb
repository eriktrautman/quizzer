class QuizzesController < ApplicationController

  def index
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
    @quiz = Quiz.find(params[:quiz_id])
    @user = @quiz.user
    @cards = @quiz.cards
    @current_card = @quiz.current_card
  end

  private

  def quiz_params
    params.require(:quiz).permit(:user_id, :name, :category_ids => [])
  end


end
