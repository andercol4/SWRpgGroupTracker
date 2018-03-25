class CampaignsController < ApplicationController
  before_action :get_campaign, except: [:index, :new, :create]
  def index
    @campaigns = Campaign.where(game_master: current_user)
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new
    @campaign.assign_attributes(campaign_params)
    @campaign.game_master = current_user
    if @campaign.save
      flash[:notice] = 'Campaign Successfully Created. Don\'t forget add characters'
      redirect_to campaign_path(@campaign)
    else
      flash.now[:errors] = @campaign.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @campaign.assign_attributes(campaign_params)
    if @campaign.save
      flash[:notice] = 'Campaign Successfully Updated.'
      redirect_to campaign_path(@campaign)
    else
      flash.now[:errors] = @campaign.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @campaign.destroy
      flash[:notice] = 'Campaign Successfully Destroyed'
      redirect_to campaigns_path
    else
      flash[:errors] = @campaign.errors.full_messages
      redirect_to campaign_path(@campaign)
    end
  end

  private

  def get_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :game_master_id)
  end
end
