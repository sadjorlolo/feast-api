class InviteesController < ProtectedController
  before_action :set_invitee, only: [:show, :update, :destroy]

  # GET /invitees
  def index
    # @invitees = Invitee.all
    @invitees = current_user.invitees.all

    render json: @invitees
  end

  # GET /invitees/1
  def show
    render json: @invitee
  end

  # POST /invitees
  def create
    # @invitee = Invitee.new(invitee_params)
    # The current user can only invite someone to an event they created
    if current_user.created_events.find(invitee_params[:event_id])
      @invitee = Invitee.new(invitee_params)
    end

    if @invitee.save
      render json: @invitee, status: :created, location: @invitee
    else
      render json: @invitee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invitees/1
  def update
    # if current_user.created_events.find(invitee_params[:event_id]) || current_user == invitee_params[:user_id]
      if @invitee.update(invitee_params)
        render json: @invitee
      else
        render json: @invitee.errors, status: :unprocessable_entity
      end
    # end
  end

  # DELETE /invitees/1
  def destroy
    # destroy record if current_user is the invitee
    # if current_user.invitees.find(params[:id])
    #   @invitee.destroy
    # return @invitee.destroy if current_user.created_events.find(Invitee.find(params[:id]).event_id)
    # return @invitee.destroy if current_user.invitees.find(params[:id])
    if current_user.created_events.find(Invitee.find(params[:id]).event_id)
      @invitee.destroy
    # elsif current_user.invitees.find(params[:id])
    #   @invitee.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitee
      # @invitee = current_user.invitees.find(params[:id])
      # only if the current_user is the invitee, can record be deleted
      # if current_user.invitees.find(params[:id])
      @invitee = Invitee.find(params[:id])
      # end
    end

    # Only allow a trusted parameter "white list" through.
    def invitee_params
      params.require(:invitee).permit(:user_id, :event_id)
    end
end
