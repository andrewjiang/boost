desc "Send an email report containing the fee to charge each member for the day"
task :daily_fees_report_email => :environment do
  FeeMailer.daily_fees_report_email(['support@zephyrcar.com', 'core@zephyrcar.com']).deliver
end
