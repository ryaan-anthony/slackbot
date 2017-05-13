class GitlabRouter
  def self.matches?(request)
    request.headers['X-Gocd-Event'].present?
  end
end
