class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :description
end
