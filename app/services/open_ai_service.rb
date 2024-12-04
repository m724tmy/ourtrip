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
        model: "gpt-4", # 必要なら "gpt-3.5-turbo" から "gpt-4" に変更
        messages: @chat_history,
        temperature: 0.7, # 応答のランダム性: 0に近いほど確定的
        max_tokens: 1000, # 応答の長さを増やしたい場合は調整
        top_p: 1.0, # ランダム性の補完
        frequency_penalty: 0.0, # 同じ内容の繰り返し抑制
        presence_penalty: 0.0 # 新しい話題の引き出し
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