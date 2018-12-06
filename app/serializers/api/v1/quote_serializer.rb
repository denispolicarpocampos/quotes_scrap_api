class Api::V1::QuoteSerializer < ActiveModel::Serializer
  attributes :quote, :author, :author_about, :tags
end
