desc "Send an email report containing the fee to charge each member for tomorrow"
task :tomorrow_fees_report_email => :environment do
  FeeMailer.daily_fees_report_email(['support@zephyrcar.com', 'core@zephyrcar.com'], DateTime.current.advance(:days => +1)).deliver
end
