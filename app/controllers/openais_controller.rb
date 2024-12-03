class OpenaisController < ApplicationController
  before_action :set_room

  def create
    user_message = params[:message]
    @room.chat_histories.create!(role: 'user', content: user_message)

    ai_response = OpenAiService.new(chat_history_for_room).call
    @room.chat_histories.create!(role: 'assistant', content: ai_response)

    @chat_history = @room.chat_histories.order(:created_at)

    respond_to do |format|
      format.turbo_stream # Turbo Streamのレスポンスを返す
      format.html { redirect_to room_path(@room), notice: "AIからの応答を受け取りました。" }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def chat_history_for_room
    @room.chat_histories.select(:role, :content).map do |history|
      { role: history.role, content: history.content }
    end
  end
end
