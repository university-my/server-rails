require 'net/http'
require 'json'
require "uri"

class NuftService < PolitekDefaultService

  def self.timetable_url
    'http://nmu.nuft.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    103
  end

  def self.university
    University.nuft
  end

end
