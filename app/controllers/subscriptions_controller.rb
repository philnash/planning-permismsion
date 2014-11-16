class SubscriptionsController < ApplicationController
  def new
    @subscription = current_user.subscriptions.build
  end

  def create
    @subscription = current_user.subscriptions.build(sub_params)
    if @subscription.save
      redirect_to account_path
    else
      render :new
    end
  end

  def edit
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def update
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.update_attributes(sub_params)
      redirect_to account_path
    else
      render :edit
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    redirect_to account_path
  end

  private

  def sub_params
    params.require(:subscription).permit(:address, :radius, :phone, :email)
  end
end
