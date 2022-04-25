require 'net/http'
require 'json'
require "uri"

class ZhimService < PolitekDefaultService

  def self.timetable_url
    'http://46.219.3.27:8080/cgi-bin/timetable.cgi'
  end

  def self.server_id
    117
  end

  def self.university
    University.zhim
  end

end