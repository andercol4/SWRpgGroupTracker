class CharacterSessionsController < ApplicationController

  def create
    @character_session = CharacterSession.new(character_id: params[:character_id], session_id: params[:session_id])
    if @character_session.save
      flash[:notice] = 'Character added to session'
      redirect_to campaign_path(@character_session.session.campaign_id)
    else
      flash[:errors] = @character_session.errors.full_messages
      redirect_to campaign_path(@character_session.session.campaign_id)
    end
  end
end
