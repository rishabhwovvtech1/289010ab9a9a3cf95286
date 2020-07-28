module Api
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :name, :phone_number, :address, :user_type, :status, :important, :sub_locality_id
  end
end
