class CardsController < ApplicationController

  # cards will always be shown as part of a quiz (okay, for now)
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @card = Card.find(params[:id])
    @user = @quiz.user
    @user.rebuild_category_queue(@card.category.id)
    cv = @card.card_views.where(:user => @user)
    if cv.empty?
      @card_views = nil
    else
      @card_views = cv.first
    end
  end


  def index
    @cards = Card.all
    @categories = Category.includes(:cards)
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:success] = "Card #{@card.title} created!"
      redirect_to cards_path
    else
      flash.now[:error] = "Couldn't create card because: #{@card.errors.full_messages}"
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      flash[:success] = "Card #{@card.title} updated!"
      redirect_to cards_path
    else
      flash.now[:error] = "Couldn't update card because: #{@card.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])
    if @card.destroy
      flash[:success] = "Destroyed card #{@card.title}!"
      redirect_to cards_path
    else
      flash.now[:error] = "Couldn't delete card for some reason, check logs.  Errors: #{@card.errors.full_messages}."
      render :edit
    end
  end


  private

  def card_params
    params.require(:card).permit(:title, :body, :category_id)
  end

end
