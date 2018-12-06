class Quote
  include Mongoid::Document
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :search_tag, type: String
  field :tags, type: Array

end
