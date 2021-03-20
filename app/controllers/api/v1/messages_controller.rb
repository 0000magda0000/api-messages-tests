class Api::V1::MessagesController < Api::V1::BaseController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      render :show, status: :created
    else render_error
    end
  end


  private
  def message_params
    params.require(:message).permit(:comment)
  end
end
