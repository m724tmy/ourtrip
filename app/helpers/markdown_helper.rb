module MarkdownHelper
    include ActionView::Helpers::SanitizeHelper
  
    def markdown_to_html(markdown_text)
      # Redcarpetの初期化
      renderer = Redcarpet::Render::HTML.new
      markdown = Redcarpet::Markdown.new(renderer, tables: true)
  
      # マークダウンをHTMLに変換
      html = markdown.render(markdown_text)
  
      # サニタイズして安全なHTMLを返す
      sanitize(html, tags: %w[p strong em a code pre blockquote h1 h2 h3 h4 h5 h6 ul ol li table thead tbody tr th td], attributes: %w[href src])
    end
  end