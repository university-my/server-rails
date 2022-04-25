require 'net/http'
require 'json'
require "uri"

class PnuService < PolitekDefaultService

  def self.timetable_url
    'http://asu.pnu.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    101
  end

  def self.university
    University.pnu
  end

end