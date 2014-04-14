class SubscriptionsController < ApplicationController
  before_action :authenticate

  def new
    @subscription = CreateSubscriptionCommand.new
  end

  def edit
    @subscription = UpdateSubscriptionCommand.new email: Subscription.find(params[:id]).email
  end

  def create
    @subscription = CreateSubscriptionCommand.new subscription_params
    if @subscription.valid? && (session[:tmp_event_id] = Domain.run_command(@subscription))
      redirect_to userpage_path, notice: 'Topic wurde abonniert.'
    else
      render action: 'new'
    end
  end

  def update
    @subscription = UpdateSubscriptionCommand.new subscription_params.merge(id: params[:id])
    if @subscription.valid? && (session[:tmp_event_id] = Domain.run_command(@subscription))
      redirect_to userpage_path, notice: 'Die Einstellungen wurden gespeichert.'
    else
      render action: 'edit'
    end
  end

  def destroy
    delete_subscription = DeleteSubscriptionCommand.new(id: params[:id])
    session[:tmp_event_id] = event_id = Domain.run_command(delete_subscription)
    if event_id
      redirect_to userpage_path, notice: 'Das Abonnement wurde entfernt.'
    else
      redirect_to userpage_path, alert: 'Das Abonnerment konnte nicht gelöscht werdenn!'
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email).merge(user_id: session[:user])
  end

end
