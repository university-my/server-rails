require 'net/http'
require 'json'
require "uri"

class ChdtuService < PolitekDefaultService

  def self.timetable_url
    'http://195.95.232.162:8082/cgi-bin/timetable.cgi'
  end

  def self.server_id
    122
  end

  def self.university
    University.chdtu
  end

end
