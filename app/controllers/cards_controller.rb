class CardsController < ApplicationController

  # cards will always be shown as part of a quiz (okay, for now)
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @card = Card.find(params[:id])
    @user = @quiz.user
  end

end
