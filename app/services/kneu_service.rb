require 'net/http'
require 'json'
require "uri"

class KneuService < PolitekDefaultService

  def self.timetable_url
    'http://dekanat.kneu.kiev.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    115
  end

  def self.university
    University.kneu
  end

end
