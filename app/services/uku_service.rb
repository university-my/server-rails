require 'net/http'
require 'json'
require "uri"

class UkuService < PolitekDefaultService

  def self.timetable_url
    'http://dekanat.ucu.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    121
  end

  def self.university
    University.uku
  end

end
