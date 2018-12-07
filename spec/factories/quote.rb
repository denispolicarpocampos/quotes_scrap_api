FactoryBot.define do
  factory :quote do
    quote        { FFaker::Lorem.phrase }
    tags         FFaker::Lorem.words
    author       { FFaker::Name.name }
    author_about { FFaker::Internet.http_url }
    search_tag   ''
  end
end