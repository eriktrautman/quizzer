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
        redirect_to take_quiz_path
      else
        flash[:error] = "Quiz couldn't be created because: #{@quiz.errors.full_messages}!"
        render :new
      end
    else
      flash[:error] = "Quiz couldn't be created because the User was invalid"
      render :new
    end
  end

  def take_quiz

  end

  private

  def quiz_params
    params.require(:quiz).permit(:user_id, :name, :category_ids => [])
  end


end
