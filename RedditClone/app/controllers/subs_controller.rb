class SubsController < ApplicationController
  def index
    @subs = Sub.all
    render :index
  end
  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  before_action :ensure_logged

  def new
    @sub = Sub.new
    render :new
  end 
  
  def create
    #creating a new instance of sub 
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub.id)
    else   
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub.id)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = current_user.subs.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end 