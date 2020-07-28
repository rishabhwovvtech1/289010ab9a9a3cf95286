module Api
  class EngineerSerializer < ActiveModel::Serializer
    attributes :id, :username, :name, :phone_number, :status, :user_type
    def user_type
      return "engineer"
    end
  end
end
