json.array! @messages do |message|
  json.extract! message, :uuid, :comment, :counter
end
