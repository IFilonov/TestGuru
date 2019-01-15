class GitHubClient
  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @response = @http_client.create_gist(params.to_json)
    @response[:url]
  end

  def success?
    @response[:url]
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN,
      api_endpoint: ROOT_ENDPOINT);
  end
end
