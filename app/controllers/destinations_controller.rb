class DestinationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @destination = current_user.destinations.new
  end

  def create
    @destination = current_user.destinations.new(destination_params)

    if @destination.valid?
      @destination.save!
      redirect_to user_profile_path
    else
      render :new
    end
  end

  def destroy
    @destination = current_user.destinations.find(params[:id])
    respond_to do |format|
      if @destination.destroy!
        format.html { redirect_to [:user, :profile], notice: 'Destination was successfully removed.' }
        # format.json { render :show, status: :ok, location: @todo }
      else
        format.html { redirect_to [:user, :profile], notice: 'There was a problem. Destination was not removed.' }
        # format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def destination_params
    params.require(:destination).permit(
      :name
    )
  end
end
