class DashboardsController < ApplicationController
  def show
    @user = current_user.bookings
    # @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
  end

end
