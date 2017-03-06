desc "slack notifications"
task notify_slack: [:environment] do
  SlackBot.recent_rounds_notification
end
