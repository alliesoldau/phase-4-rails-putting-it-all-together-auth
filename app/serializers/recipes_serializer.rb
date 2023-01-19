class RecipesSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructions, :minutes_to_complete
  has_one :user, serializer: UsersSerializer
end
