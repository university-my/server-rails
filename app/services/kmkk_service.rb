require 'net/http'
require 'json'
require "uri"

class KmkkService < PolitekDefaultService

  def self.timetable_url
    'http://178.150.254.27/cgi-bin/timetable.cgi'
  end

  def self.server_id
    129
  end

  def self.university
    University.kmkk
  end

end
