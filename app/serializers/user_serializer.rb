class UserSerializer
  include JSONAPI::Serializer

  attributes :username, :email

  has_many :articles, serializer: ArticleSerializer
end