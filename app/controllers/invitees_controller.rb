class InviteesController < ProtectedController
  before_action :set_invitee, only: [:show, :update, :destroy]

  # GET /invitees
  def index
    @invitees = current_user.invitees.all

    render json: @invitees
  end

  # GET /invitees/1
  def show
      render json: @invitee
  end

  # POST /invitees
  def create
    # The current user can only invite someone to an event they created
    # The invitee cannot have already been invited
    if current_user.created_events.find(invitee_params[:event_id]) \
       && !Invitee.find_by(user_id: invitee_params[:user_id], \
                           event_id: invitee_params[:event_id])
      @invitee = Invitee.new(invitee_params)

      if @invitee.save
        render json: @invitee, status: :created, location: @invitee
      else
        render json: @invitee.errors, status: :unprocessable_entity
      end
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
      @invitee = current_user.invitees.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invitee_params
      params.require(:invitee).permit(:user_id, :event_id)
    end
end
