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
    # システムメッセージを追加
    system_message = {
      role: "system",
      content: "あなたは旅行プランのエキスパートです。ユーザーが提供する情報を基に、最適な旅行プランやアドバイスを生成してください。"
    }
  
    # ユーザーとAIの履歴を取得
    user_and_ai_messages = @room.chat_histories.select(:role, :content).map do |history|
      { role: history.role, content: history.content }
    end
  
    # システムメッセージを履歴の先頭に追加
    [system_message] + user_and_ai_messages
  end  
end
