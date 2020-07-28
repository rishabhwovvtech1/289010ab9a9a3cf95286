module Api
  class DepartmentIssueSerializer < ActiveModel::Serializer
    attributes :id, :issue_name, :status
  end
end
