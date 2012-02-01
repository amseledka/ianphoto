class ContestantsController < ApplicationController
  before_filter :require_active_contest

  def index
    @contestants = Contest.current.contestants
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

  private
    def require_active_contest
      if !current_user && Contest.current.blank?
        redirect_to :root
      end  
    end
end
