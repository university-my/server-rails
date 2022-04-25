require 'net/http'
require 'json'
require "uri"

class LdubgdService < PolitekDefaultService

  def self.timetable_url
    'https://rozklad.ldubgd.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    109
  end

  def self.university
    University.ldubgd
  end

end