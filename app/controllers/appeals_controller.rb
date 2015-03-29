class AppealsController < ApplicationController

  def index
  end

  def show
    @appeal = Appeal.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    # render plain: params[:appeals].inspect
    @appeal = Appeal.new(appeal_params)

    if @appeal.save
    flash[:notice] = "Well saved appeal"
    end
    binding.pry
    redirect_to @appeal
  end

  def update
  end

  def destroy
  end

  private
  def appeal_params
    params.require(:appeal).permit(:name, :email, :issue_type, :title, :text)
  end
end
