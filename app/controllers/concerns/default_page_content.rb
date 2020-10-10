module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Portfolio | Thanks for visiting"
    @seo_keywords = "Jens Vyff Portfolio"
  end
end