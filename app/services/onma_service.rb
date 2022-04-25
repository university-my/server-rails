require 'net/http'
require 'json'
require "uri"

class OnmaService < PolitekDefaultService

  def self.timetable_url
    'http://212.111.205.2/cgi-bin/timetable.cgi'
  end

  def self.server_id
    127
  end

  def self.university
    University.onma
  end

end
