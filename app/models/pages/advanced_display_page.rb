require 'open-uri'

module Pages
  class AdvancedDisplayPage < PageBase
    def hours_in_log_period
      element = page.css('input[name=perhrs]')
      element.attr("value").value.to_f
    end

    def records_available
      element = page.css('div.brout2 .brdata-a')
      element.last.text.to_i
    end

    protected

    def page_name
      "a.htm"
    end
  end
end
