module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: true
    field :email, String, null: true
    field :articles, [Types::ArticleType], null: true
    field :articles_count, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :password_digest, String, null: true
    field :admin, Boolean, null: true

    def articles_count
      object.articles.size
    end
  end
end
