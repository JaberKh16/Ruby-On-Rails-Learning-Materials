require 'logger'

class DailyLogger < Logger
  def initialize
    dated_filename = Rails.root.join("log", "app_#{Date.today}.log")
    super(dated_filename, 'daily')
  end
end

Rails.application.configure do
  config.daily_logger = DailyLogger.new
end
