require 'net/http'

class Build < ActiveRecord::Base
  def self.recent(token)
    JSON.parse(Net::HTTP.get(URI.parse("https://circleci.com/api/v1/recent-builds?circle-token=#{token}")))
  end
end
