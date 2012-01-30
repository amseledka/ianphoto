class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end

  def new 
    @contestant = Contestant.new
    @contestant.build_categories
  end

  def create
    @contestant = Contestant.new(params[:contestant])
    @contestant.categories.reject! do |c|
      !Contestant::CATEGORY_NAMES.include?(c.name) || c.photos.blank?
    end
    if @contestant.save
      redirect_to @contestant
    else
      @contestant.build_categories if @contestant.categories.blank?
      render :new
    end
  end

  def show
    @contestant = Contestant.find(params[:id])
  end

  def destroy
    @contestant = Contestant.find(params[:id])
    @contestant.destroy
    redirect_to contestants_path
  end
end
