require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#validations' do
    let(:message) { build(:message) }
    it 'tests that factory is valid' do
      expect(message).to be_valid
      message.save!
      another_message = build(:message)
      expect(another_message).to be_valid
    end

    it 'should validate the presence of uuid' do
      message = build :message, uuid: ''
      expect(message).not_to be_valid
      expect(message.errors.messages[:uuid]).to include ("can't be blank")
    end

    it 'should validate the presence of counter' do
      message = build :message, counter: nil
      expect(message).not_to be_valid
      expect(message.errors.messages[:counter]).to include ("is not a number")
    end

    it 'should validate the presence of comment' do
      message = build :message, comment: ''
      expect(message).not_to be_valid
      expect(message.errors.messages[:comment]).to include ("can't be blank")
    end
  end
end



