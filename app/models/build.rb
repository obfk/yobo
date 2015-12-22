require 'net/http'

class Build < ActiveRecord::Base
  def self.recent(token)
    filter_builds(
      JSON.parse(
        Net::HTTP.get(
          URI.parse("https://circleci.com/api/v1/recent-builds?circle-token=#{token}")
        )
      )
    )
  end

  private

  def self.filter_builds(builds)
    builds.reject do |build|
      build["status"] == 'not_run' ||
      build["status"] == 'canceled' ||
      build["branch"] == 'green-latest' ||
      build["reponame"] != 'tracker-frontend'
    end
  end
end
