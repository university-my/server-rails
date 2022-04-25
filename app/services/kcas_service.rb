require 'net/http'
require 'json'
require "uri"

class KcasService < PolitekDefaultService

  def self.timetable_url
    'http://94.131.204.108/cgi-bin/timetable.cgi'
  end

  def self.server_id
    126
  end

  def self.university
    University.kcas
  end

end
