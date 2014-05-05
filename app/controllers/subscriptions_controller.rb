class SubscriptionsController < ApplicationController
  include EventSource
  before_action :authenticate

  def new
    @subscription = CreateSubscriptionCommand.new topic_id: params[:topic_id]
  end

  def edit
    @subscription = UpdateSubscriptionCommand.new Subscription.find(id_param).updatable_attributes
  end

  def create
    @subscription = CreateSubscriptionCommand.new subscription_params
    if store_event_id Domain.run_command(@subscription)
      redirect_to userpage_users_path, notice: 'Topic wurde abonniert.'
    else
      render 'new'
    end
  end

  def update
    @subscription = UpdateSubscriptionCommand.new subscription_params.merge(id: id_param)
    if store_event_id Domain.run_command(@subscription)
      redirect_to userpage_users_path, notice: 'Die Einstellungen wurden gespeichert.'
    else
      render 'edit'
    end
  end

  def destroy
    delete_subscription = DeleteSubscriptionCommand.new(id: id_param)
    if store_event_id Domain.run_command(delete_subscription)
      redirect_to userpage_users_path, notice: 'Das Abonnement wurde entfernt.'
    else
      redirect_to userpage_users_path, alert: 'Das Abonnerment konnte nicht gelöscht werdenn!'
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email, :topic_id).merge(user_id: session[:user])
  end

  def id_param
    params.require(:id).to_i
  end
end
