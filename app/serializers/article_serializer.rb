class ArticleSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :created_at
end