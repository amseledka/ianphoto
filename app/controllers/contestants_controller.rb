class ContestantsController < ApplicationController
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
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @contestant = Contestant.find(params[:id])
  end
end
