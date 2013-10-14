class CardsController < ApplicationController

  # cards will always be shown as part of a quiz (okay, for now)
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @card = Card.find(params[:id])
    @user = @quiz.user
    cv = @card.card_views.where(:user => @user)
    if cv.empty?
      @card_views = nil
    else
      @card_views = cv.first
    end
  end

end
