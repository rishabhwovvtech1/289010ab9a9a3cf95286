module Api
  class UsersSerializer < ActiveModel::Serializer
    attributes :id, :username
  end
end
