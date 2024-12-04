class OpenAiService
  include ActionView::Helpers::SanitizeHelper
  include MarkdownHelper

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

    content = response['choices']&.first&.dig('message', 'content') || "応答が取得できませんでした。"

    # MarkdownからHTMLに変換
    content_html = markdown_to_html(content)
    content_html
  rescue StandardError => e
    Rails.logger.error("Error calling OpenAI API: #{e.message}")
    "エラーが発生しました。もう一度お試しください。"
  end
end