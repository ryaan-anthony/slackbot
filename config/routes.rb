Rails.application.routes.draw do
  def api_operations
    constraints(GitlabRouter) do
      post '/build', to: 'ci#build'
      post '/deploy', to: 'ci#deploy'
    end
  end

  scope module: :v1, path: '/api/v1' do
    api_operations
  end
end
