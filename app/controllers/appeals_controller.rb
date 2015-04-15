class AppealsController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!
  after_filter :verify_policy_scoped, :only => :index
  # after_action :verify_authorized, :except => :index
 # before_filter :authorize, :except => [:index, :new]

  def index
    @appeals = Appeal.all
    @posts = policy_scope(Appeal)
    # binding.pry
    respond_with(@appeals)
  end

  def show
    @appeal = Appeal.find(params[:id])
    authorize @appeal, :update?
    @appeal.publish!
    respond_with(@appeal)
  end

  def new
    @appeal = Appeal.new
    @posts = policy_scope(Appeal)
    respond_with(@appeal)
  end

  def edit
    @appeal = Appeal.find(params[:id])
    respond_with(@appeal)
  end

  def create
    # render plain: params[:appeals].inspect
    # @user = User.find(params[:user_id])
    @appeal = Appeal.new(appeal_params)
    # @user = current_user
    # @appeal = @user.appeals.create(appeal_params)

    if @appeal.save
      flash[:notice] = 'Well saved appeal'
    end
    respond_with(@appeal)
  end

  def update
    @appeal = Appeal.find(params[:id])

    if @appeal.update_attributes(appeal_params)
      flash[:notice] = 'Saving is success'
    end
    respond_with(@appeal)
  end

  def destroy
    respond_with(@appeal)
  end

  private
  def appeal_params
    # params.require(:appeal).permit(:name, :email, :issue_type, :title, :text)
    binding.pry
    params.require(:appeal).permit(policy(Appeal).permitted_attributes)
  end
end
