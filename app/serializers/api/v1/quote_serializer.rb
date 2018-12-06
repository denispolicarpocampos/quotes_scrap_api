module Api
  module V1
    class QuoteSerializer < ActiveModel::Serializer
      attributes :quote, :author, :author_about, :tags
    end
  end
end
