class GocdEvent
  def initialize(event)
    @event = event
    toggle_broken!
  end

  def toggle_broken!
    data = Database.new
    key = master? ? 'master_broken' : 'feature_broken'
    @previously_broken = data[key]
    Rails.logger.debug @previously_broken == true ? 'true' : 'false'
    data[key] = true if broken?
    data[key] = false if fixed?
    data.save if @previously_broken != data[key]
  end

  def broken?
    @event =~ /broken/i && !@previously_broken
  end

  def fixed?
    @event =~ /fixed/i && @previously_broken
  end

  def master?
    @event =~ /master/i
  end

  def self.matches?(request)
    request.headers['X-Gocd-Event'].present?
  end
end
