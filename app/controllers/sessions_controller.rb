class SessionsController < ApplicationController

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @session = @campaign.sessions.new(start_date: DateTime.now)
    if @session.save
      flash[:notice] = 'Session Started'
      redirect_to campaign_path(@campaign)
    else
      flash[:errors] = @session.errors.full_messages
      redirect_to campaign_path(@campaign)
    end
  end
end
