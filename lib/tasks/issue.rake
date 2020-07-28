namespace :issue do
  desc "TODO"
  task close: :environment do
    Issue.where("issue_closed_at < ?", 2.days.ago).update_all(:status => "Closed")
  end

end
