class ResponsibilitiesController < ApplicationController
  before_action :get_character
  before_action :get_responsibility, except: [:new, :create]

  def new
    @responsibilty = @character.responsibilities.new
  end

  def create
    @responsibility = @character.responsibilities.new
    @responsibility.assign_attributes(responsibility_params)
    if @responsibility.save
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
    @responsibility.assign_attributes(responsibility_params)
    if @responsibility.save
      flash[:notice] = "#{@responsibility.type} updated"
      redirect_to campaign_character_path(@character.campaign_id, @character)
    else
      flash[:errors] = @responsibility.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @responsibility.destroy
      flash[:notice] = "#{@responsibility.type} destroyed"
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
    @character.responsibilities.find(params[:id])
  end

  def responsibility_params
    params.require(:responsibility).permit(
      :type, :name, :description, :score
    )
  end
end
