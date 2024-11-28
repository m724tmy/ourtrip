class OpenAiService
    def initialize(chat_history)
      @chat_history = chat_history
    end
  
    def call
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: @chat_history
        }
      )
      # 応答のログ
      Rails.logger.debug("OpenAI response: #{response.inspect}")
  
      response['choices']&.first&.dig('message', 'content') || "応答が取得できませんでした。"
    end
  end