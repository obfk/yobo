require 'net/http'

class Build
  def initialize(token)
    @builds = JSON.parse(
      Net::HTTP.get(
        URI.parse("https://circleci.com/api/v1/recent-builds?circle-token=#{token}")
      )
    )
  end

  def recent
    filter_general_builds(@builds)
  end

  def master_frontend
    select_master_build(@builds, 'tracker-frontend')
  end

  private

  def filter_general_builds(builds)
    results = builds.reject do |build|
      build['status'] == 'not_run' ||
      build['status'] == 'canceled' ||
      build['branch'] == 'green-latest' ||
      build['branch'] == 'master' ||
      build['reponame'] != 'tracker-frontend'
    end

    results.uniq { |result| result['branch'] }
  end

  def select_master_build(builds, reponame)
    builds.select {|build|
      build['branch'] == 'master' &&
      build['reponame'] == reponame
    }.first
  end
end
