class CiEvent
  EVENT_KEY = 'X-CI-Event'.freeze
  EVENT_ID_KEY = 'X-CI-ID'.freeze

  def initialize(request)
    @event = request.headers[EVENT_KEY]
    @event_id = request.headers[EVENT_ID_KEY]
    @previous_state = true
    detect_state!
  end

  def fail?
    @event =~ /fail/i && @previous_state == true
  end

  def success?
    @event =~ /success/i && @previous_state == false
  end

  def self.matches?(request)
    request.headers[EVENT_KEY].present? && request.headers[EVENT_ID_KEY].present?
  end

  private

  def detect_state!
    states = Filesystem.new
    @previous_state = states[@event_id] unless states[@event_id].nil?
    states[@event_id] = false if fail?
    states[@event_id] = true if success?
    states.save if @previous_state != states[@event_id]
  end
end
