class ContestsController < ApplicationController
  use_tinymce :all
  before_filter :require_user

  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find(params[:id])
    @contestants = @contest.contestants
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(params[:contest])
    if @contest.save
      redirect_to contests_path
    else
      render :new
    end
  end

  def edit
    @contest = Contest.find(params[:id])
  end

  def update
    @contest = Contest.find(params[:id])
    if @contest.update_attributes(params[:contest])
      redirect_to contests_path
    else
      render :edit
    end
  end

  def destroy
    @contest = Contest.find(params[:id])
    @contest.destroy
    redirect_to contests_path
  end
end
