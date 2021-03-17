FactoryBot.define do
  factory :message do
    uuid { "123e4567-e89b-12d3-a456-426614174000" }
    comment { "Sample comment" }
    counter { 0 }
  end
end
