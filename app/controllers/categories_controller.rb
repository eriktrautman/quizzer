class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category #{@category.name} created!"
      redirect_to categories_path
    else
      flash.now[:error] = "Couldn't create category because: #{@category.errors.full_messages}"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category #{@category.name} updated!"
      redirect_to categories_path
    else
      flash.now[:error] = "Couldn't update category because: #{@category.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Destroyed category #{@category.name}!"
      redirect_to categories_path
    else
      flash.now[:error] = "Couldn't delete category for some reason, check logs.  Errors: #{@category.errors.full_messages}."
      render :edit
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end
