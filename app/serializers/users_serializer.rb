class UsersSerializer < ActiveModel::Serializer
  attributes :username, :image_url, :bio
end
