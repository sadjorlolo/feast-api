class AddRejectionToInvitees < ActiveRecord::Migration[5.1]
  def change
    add_column :invitees, :rejection, :boolean, default: false
  end
end
