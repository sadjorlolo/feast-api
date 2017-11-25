class InviteesController < ApplicationController
  before_action :set_invitee, only: [:show, :update, :destroy]

  # GET /invitees
  def index
    @invitees = Invitee.all

    render json: @invitees
  end

  # GET /invitees/1
  def show
    render json: @invitee
  end

  # POST /invitees
  def create
    @invitee = Invitee.new(invitee_params)

    if @invitee.save
      render json: @invitee, status: :created, location: @invitee
    else
      render json: @invitee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invitees/1
  def update
    if @invitee.update(invitee_params)
      render json: @invitee
    else
      render json: @invitee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invitees/1
  def destroy
    @invitee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitee
      @invitee = Invitee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invitee_params
      params.require(:invitee).permit(:user_id, :event_id)
    end
end
