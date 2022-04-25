require 'net/http'
require 'json'
require "uri"

class KubgService < PolitekDefaultService

  def self.timetable_url
    'http://dekanat.kubg.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    118
  end

  def self.university
    University.kubg
  end

end
