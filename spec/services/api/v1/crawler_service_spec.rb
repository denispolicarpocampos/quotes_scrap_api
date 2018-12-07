require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe Api::V1::CrawlerService do
  describe '#call' do
    context 'there is tag on db' do
      let(:quote_params) { attributes_for(:quote) }
      let(:quote) { create(:quote, quote_params.merge!(search_tag: quote_params[:tags][0]) ) }
      let(:crawler_service) { double(Api::V1::CrawlerService.new(quote.tags[0])) }

      it do
        allow(crawler_service).to receive(:call).and_return(Quote.find_by(search_tag: quote.tags[0]))
        expect(crawler_service.call).to eql(quote)

      end
    end
    context 'there is not tag on db' do
      let(:crawler_service) { double(Api::V1::CrawlerService.new('any')) }
      let(:quote_params) { attributes_for(:quote) }
      
      it do
        allow(crawler_service).to receive(:call).and_return(
          @quote = create(:quote, quote_params.merge!(search_tag: quote_params[:tags][0]) ) 
        )
        expect(crawler_service.call).to eql(@quote)
      end
    end
  end
end