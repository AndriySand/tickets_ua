class MessagesController < ApplicationController
  before_action :set_message, only: :show

  def show
    @user = User.find(params[:user_id])
  end

  # POST /messages
  def create
    @user = User.find(params[:user_id])
    @message = current_user.messages.new(message_params)
    @messages = Message.between(current_user.id, @user.id)

    if @message.save
      redirect_to user_path(@user), notice: 'Message was sent to this user.'
    else
      render template: '/users/show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:title, :body, :author_id, :recipient_id)
    end
end
