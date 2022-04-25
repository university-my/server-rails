require 'net/http'
require 'json'
require "uri"

class ZnauService < PolitekDefaultService

  def self.timetable_url
    'http://rozklad.znau.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    102
  end

  def self.university
    University.znau
  end

end