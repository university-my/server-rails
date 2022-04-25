require 'net/http'
require 'json'
require "uri"

class NuwmService < PolitekDefaultService

  def self.timetable_url
    'https://desk.nuwm.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    107
  end

  def self.university
    University.nuwm
  end

end