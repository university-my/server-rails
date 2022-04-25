require 'net/http'
require 'json'
require "uri"

class ZuService < PolitekDefaultService

  def self.timetable_url
    'https://dekanat.zu.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    116
  end

  def self.university
    University.zu
  end

end