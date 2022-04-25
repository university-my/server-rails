require 'net/http'
require 'json'
require "uri"

class KmkkovelService < PolitekDefaultService

  def self.timetable_url
    'http://93.183.214.222/cgi-bin/timetable.cgi'
  end

  def self.server_id
    128
  end

  def self.university
    University.kmkkovel
  end

end
