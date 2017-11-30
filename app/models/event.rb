class Event < ApplicationRecord
  belongs_to :event_creator, class_name: 'User', foreign_key: 'user_id',
                             inverse_of: 'created_events'

  has_many :invitees, dependent: :destroy
  has_many :event_attendees, through: :invitees
end
