require 'net/http'
require 'json'
require "uri"

class GpnuService < PolitekDefaultService

  def self.timetable_url
    'http://193.169.125.234/cgi-bin/timetable.cgi'
  end

  def self.server_id
    105
  end

  def self.university
    University.gpnu
  end

end