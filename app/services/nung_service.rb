require 'net/http'
require 'json'
require "uri"

class NungService < PolitekDefaultService

  def self.timetable_url
    'https://dekanat.nung.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    110
  end

  def self.university
    University.nung
  end

end