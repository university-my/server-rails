require 'net/http'
require 'json'
require "uri"

class UgiService < PolitekDefaultService

  def self.timetable_url
    'https://education.ugi.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    114
  end

  def self.university
    University.ugi
  end

end
