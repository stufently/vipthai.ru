# _plugins/flatten.rb
require 'json'

module Jekyll
  module FaqItemsCustom
    module FaqItemsFilter
      def faq_items(items)
        unless items.kind_of?(Array)
          items = [items]
        end
        JSON.generate(
          items.map {
            |item|
            {
              "@type" => "Question",
              "name" => item.question,
              "acceptedAnswer" => {
                "@type" => "Answer",
                "text" => item.output
              }
            }
          })
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::FaqItemsCustom::FaqItemsFilter)