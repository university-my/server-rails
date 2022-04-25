require 'net/http'
require 'json'
require "uri"

class SspuService < PolitekDefaultService

  def self.timetable_url
    'https://rozklad.sspu.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    104
  end

  def self.university
    University.sspu
  end

end