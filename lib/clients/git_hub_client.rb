class GitHubClient

  ROOT_ENDPOINT = "https://api.github.com"
  # ACCESS_TOKEN = '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' #Just save token here. 
  ACCESS_TOKEN = ENV['GITHUB_TOKEN'] 

  def initialize
    @http_client = setup_http_client
  end 

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end 
  end

  private

  def setup_http_client 
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
