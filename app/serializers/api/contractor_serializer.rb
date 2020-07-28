module Api
  class ContractorSerializer < ActiveModel::Serializer
    attributes :id, :username, :name, :phone_number, :status, :user_type
    def user_type
      return "contractor"
    end
  end
end
