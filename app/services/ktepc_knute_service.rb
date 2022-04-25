require 'net/http'
require 'json'
require "uri"

class KtepcKnuteService < PolitekDefaultService

  def self.timetable_url
    'http://178.151.58.56/cgi-bin/timetable.cgi'
  end

  def self.server_id
    113
  end

  def self.university
    University.ktepc_knute
  end

end
