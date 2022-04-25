require 'net/http'
require 'json'
require "uri"

class KtggService < PolitekDefaultService

  def self.timetable_url
    'http://217.76.201.218/cgi-bin/timetable.cgi'
  end

  def self.server_id
    125
  end

  def self.university
    University.ktgg
  end

end
