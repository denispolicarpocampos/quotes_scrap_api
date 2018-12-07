module Api
  module V1
    class CrawlerService
      def initialize(tag)
        @tag = tag
        @url = 'http://quotes.toscrape.com'
      end

      def call
        quote_tag = Quote.where(search_tag: @tag)
        return quote_tag if quote_tag.present?

        search
        Quote.create(@data)
      end

      private

      def search
        require 'nokogiri'
        require 'open-uri'
        doc = Nokogiri::HTML(open("#{@url}/tag/#{@tag}/"))
        crawler(doc)
      end

      def crawler(doc)
        @data = []
        doc.css('.quote').each do |link|
          hash_data = {}
          hash_data[:tags] = link.css('meta.keywords')[0].attr('content').split(',')
          hash_data[:quote] = link.css('span.text')[0].text
          hash_data[:author] = link.css('small.author')[0].text
          hash_data[:author_about] = @url + link.css('a')[0].attr('href')
          hash_data[:search_tag] = @tag
          @data << hash_data
        end
      end
    end
  end
end