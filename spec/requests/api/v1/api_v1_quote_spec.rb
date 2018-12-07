require 'rails_helper'
require 'rspec/json_expectations'
require 'nokogiri'
require 'open-uri'

RSpec.describe 'Api::V1::Quotes', type: :request do
  describe 'GET /api/v1/quotes/:search_tag' do
    context 'Unauthenticated' do
      it_behaves_like :deny_without_authorization, :get, "/api/v1/quotes/-1"
    end

    context 'Authenticated' do
      context 'tag found' do
        let(:user) { create(:user) }
        parse = Nokogiri::HTML(open('http://quotes.toscrape.com/'))
        tags = parse.xpath('/html/body/div/div[2]/div[1]/div[1]/div/meta').attr('content').text.split(',')

        before { get "/api/v1/quotes/#{tags.sample}", headers: header_with_authentication(user) }

        it { expect(response).to have_http_status(:success) }
      end
      context 'tag not found' do
        let(:user) { create(:user) }
        before { get "/api/v1/quotes/-1", headers: header_with_authentication(user) }
        it { expect(response).to have_http_status(:not_found) }
      end
    end
  end
end