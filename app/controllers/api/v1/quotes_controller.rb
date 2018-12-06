# frozen_string_literal: true

module Api
  module V1
    # Classe controladora de quotes
    class QuotesController < Api::V1::ApiController
      def show
        @quotes = Api::V1::CrawlersService.new(params[:search_tag]).call
        render json: @quotes
      end
    end
  end
end