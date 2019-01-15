class GitHubClient
  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = '87542f8d63cb45eb1ddff159030203fdcfbf69d'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @response = @http_client.create_gist(params.to_json)
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
