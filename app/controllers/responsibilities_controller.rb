class ResponsibilitiesController < ApplicationController
  before_action :get_character
  before_action :get_responsibility, except: [:new, :create]

  def new
    @responsibilty = @character.responsibility.new
  end

  def create
    @responsibilty = @character.responsibility.new
    @responsibilty.assign_attributes(responsibilty_params)
    if @responsibilty.save
      flash[:notice] = "#{@responsibility.type} added to #{@character.name}"
      redirect_to campaign_character_path(@character.campaign_id, @character)
    else
      flash[:errors] = @responsibility.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update
    @responsibilty.assign_attributes(responsibilty_params)
    if @responsibilty.save
      flash[:notice] = "#{@responsibility.type} updated"
      redirect_to campaign_character_path(@character.campaign_id, @character)
    else
      flash[:errors] = @responsibility.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @responsibilty.destroy
      flash[:notice] = "#{@responsibilty.type} destroyed"
    else
      flash[:errors] = @responsibility.errors.full_messages
    end
    redirect_to campaign_character_path(@character.campaign_id, @character)
  end

  private

  def get_character
    @character = Character.find(params[:character_id])
  end

  def get_responsibility
    @character.responsibility.find(params[:id])
  end

  def responsibility_params
    params.require(:responsibility).permit(
      :type, :kind, :description, :score
    )
  end
end
