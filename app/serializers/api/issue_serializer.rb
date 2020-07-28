module Api
  class IssueSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :department_issue_id, :comment, :image_upload, :engineer_assigned, :contractor_assigned, :engineer_comment, :user_comment, :contractor_comment, :authority_comment, :status, :department_issue, :important, :user, :engineer, :contractor, :created_at

    def engineer
      if object.engineer_assigned.present?
      eng = Engineer.find(object.engineer_assigned)
      engineer =
        {
            id: eng.id,
            name: eng.name,
            username: eng.username,
            phone_number: eng.phone_number
        }
      else
        engineer = {
            id: nil,
            name: nil,
            username: nil,
            phone_number: nil
        }
      end
    end

    def contractor
      if object.contractor_assigned.present?
      con = Contractor.find(object.contractor_assigned)
      contractor = {
          id: con.id,
          name: con.name,
          username: con.username,
          phone_number: con.phone_number
      }
      else
        contractor = {
            id: nil,
            name: nil,
            username: nil,
            phone_number: nil
        }
      end
    end

    def user
      user = User.find(object.user_id)
      user_detail = {
          id: user.id,
          username: user.username,
          address: user.address,
          phone_number: user.phone_number
      }
    end

    def created_at
      object.created_at.strftime("%d/%m/%y | %I:%M%p")
    end
  end
end
