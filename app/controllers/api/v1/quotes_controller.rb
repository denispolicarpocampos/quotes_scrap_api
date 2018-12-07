# frozen_string_literal: true

module Api
  module V1
    # Classe controladora de quotes
    class QuotesController < Api::V1::ApiController
      before_action :authenticate_user
      def show
        quotes = Api::V1::CrawlerService.new(params[:search_tag]).call
        if quotes.present?
          render json: quotes
        else
          render json: { message: 'No quotes found!' }, status: :not_found
        end
      end
    end
  end
end