class ReviewsController < ApplicationController

  def index
    #this is our list page for our reviews
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    #start with all the Reviews
    @reviews = Review.all
    #filtering by prices
    if @price.present?
      @reviews = @reviews.where(price: @price)
    end
    #filtering by Cuisine
    if @cuisine.present?
      @reviews = @reviews.where(cuisine: @cuisine)
    end
    #search near locaation
    if @location.present?
      @reviews = @reviews.near(@location)
    end
  end

  def new
    # the form adding a new review
    @review = Review.new
  end

  def create
    # take info from the form and add it to the model
    @review = Review.new(form_params)

    # we want to check if the model can be saved
    # if it is we are go the homepage again
    # if it isn´t show the new form

    if @review.save
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"
    end

  end

  def show
    #individual review homepage
    @review = Review.find(params[:id])
  end

  def destroy
    #find the individual # REVIEW:
    @review = Review.find(params[:id])
    #destroy
    @review.destroy
    #redirect to home homepage
    redirect_to root_path
  end
  def edit
    #find the individual review to edit
    @review = Review.find(params[:id])
  end

  def update
    #find the individual review
    @review = Review.find(params[:id])
    #update
    if @review.update(form_params)
      #redirect
      redirect_to review_path(@review)
    else
      render "edit"
    end
  end

  def form_params
    params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance, :cuisine, :price, :address)
  end

end
