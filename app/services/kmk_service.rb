require 'net/http'
require 'json'
require "uri"

class KmkService < PolitekDefaultService

  def self.timetable_url
    'http://80.91.179.229:81/cgi-bin/timetable.cgi'
  end

  def self.server_id
    119
  end

  def self.university
    University.kmk
  end

end
