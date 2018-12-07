# frozen_string_literal: true

module Api
  module V1
    # Application API. Herdado por outras classes da pasta Api.
    class ApiController < ApplicationController
      include Knock::Authenticable
      include CanCan::ControllerAdditions

      rescue_from ActionController::ParameterMissing do |exception|
        render(json: { message: exception.param }, status: :bad_request)
      end

      rescue_from Mongoid::Errors::DocumentNotFound do |msg|
        render(json: { message: 'Not found' }, status: :not_found)
      end

      rescue_from CanCan::AccessDenied do |msg|
        render(json: { message: msg }, status: :forbidden)
      end

      rescue_from URI::InvalidURIError do |msg|
        render(json: { message: msg }, status: :bad_request)
      end
    end
  end
end