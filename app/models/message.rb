class Message < ApplicationRecord
  include UuidHelper

  attribute :uuid, MySQLBinUUID::Type.new
  self.primary_key = "uuid"
  attribute :counter, default: 0
  validates :counter, presence: true, numericality: { only_integer: true }
  validates :comment, presence: true, format: { without: /\A<\w*>.*<\/\w*>\z/, message: "no HTML-tags allowed"}
end
