class CharactersController < ApplicationController
  before_action :get_campaign
  before_action :get_character, except: [:index, :new, :create]

  def show
  end

  def new
    @character = @campaign.characters.new
  end

  def create
    @character = @campaign.characters.new
    @character.assign_attributes(character_params)
    if @character.save
      flash.notice = "Character is created."
      redirect_to campaign_character_path(@campaign, @character)
    else
      flash.errors = @character.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @character.assign_attributes(character_params)
    if @character.save
      flash.notice = "Character is created."
      redirect_to campaign_character_path(@campaign, @character)
    else
      flash.errors = @character.errors.full_messages
      render :new
    end
  end

  def destroy
    if @character.destroy
      flash.notice = 'Character succsessfully destroyed'
      redirect_to campaign_path(@campaign)
    else
      flash.errors = @character.errors.full_messages
      redirect_to campaign_character_path(@campaign, @character)
    end
  end

  private

  def get_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def get_character
    @character = @campaign.characters.find(params[:id])
  end

  def character_params
    params.require(:character).permit(
      :name, :player_name, :total_experience,
      :race, :class
    )
  end
end
