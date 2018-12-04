module ApplicationHelper
  def time
     Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end
end
