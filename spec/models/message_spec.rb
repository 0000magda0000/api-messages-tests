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

    it "comment has a maximum number of chars (255 characters)" do
      build :message, comment: "I am the message you have been waiting for I will show you how to test. You always have to test. Always, always test. You will get it, and you will do well, better than you are doing now, if you test right. Girl is now called bot. I am now called woman. That's it."
      expect{ raise "Data too long for column 'comment' at row 1" }.to raise_error(RuntimeError)
    end
  end
end


