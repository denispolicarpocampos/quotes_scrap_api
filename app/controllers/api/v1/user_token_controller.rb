module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      skip_before_action :verify_authenticity_token

      rescue_from Mongoid::Errors::DocumentNotFound do |msg|
        render(json: { message: msg }, status: :bad_request)
      end
    end
  end
end
