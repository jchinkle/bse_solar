require 'open-uri'

class PageBase
  attr_accessor :page, :time_initialized, :base_url

  def initialize(base_url)
    @time_initialized = DateTime.now
    @base_url = base_url
    @page = Nokogiri::HTML(get_html)
  end

  protected

  def page_name
    raise NotImplementedError.new("page_name not implemented.") 
  end

  private

  def get_html
    open("#{base_url}/#{page_name}")
  end
end
