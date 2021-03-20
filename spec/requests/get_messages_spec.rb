require 'rails_helper'
# describe "get all messages route", :type => :request do
#   let!(:messages) {FactoryBot.create_list(:random_message, 20)}
# before {get '/api/v1/messages'}
# it 'returns all messages' do
#     expect(JSON.parse(response.body).size).to eq(20)
#   end
# it 'returns status code 200' do
#     expect(response).to have_http_status(:success)
#   end
# end

RSpec.describe 'messages', type: :request do
  describe 'GET /index' do
    it 'returns HTTP success' do
      get '/api/v1/messages'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'should return proper json' do
      messages = build :message, counter: 0
      get '/api/v1/messages'
      Message.all.each_with_index do |message, index|
        expect(Json.parse(response.body)).to eq({
          "uuid" => message.uuid,
          "comment" => message.comment,
          "counter" => article.counter.to_i
        })
      end
    end

    it 'can contain characters coming from different languages' do
      post "/api/v1/messages", :params => { message: { comment: "ეს არის ჩემი შესანიშნავი გზავნილი"} }
      expect(JSON.parse(response.body)["comment"]).to eq("ეს არის ჩემი შესანიშნავი გზავნილი")
    end
  end
end


