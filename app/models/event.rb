class Event < ApplicationRecord
  belongs_to :event_creator, class_name: 'User', foreign_key: 'user_id',
                             inverse_of: 'created_events'
end
