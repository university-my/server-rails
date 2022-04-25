require 'net/http'
require 'json'
require "uri"

class VnuService < PolitekDefaultService

  def self.timetable_url
    'http://194.44.187.20/cgi-bin/timetable.cgi'
  end

  def self.server_id
    120
  end

  def self.university
    University.vnu
  end

end
