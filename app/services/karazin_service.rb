require 'net/http'
require 'json'
require "uri"

class KarazinService < PolitekDefaultService

  def self.timetable_url
    'https://online.karazin.ua:1443/cgi-bin/timetable.cgi'
  end

  def self.server_id
    123
  end

  def self.university
    University.karazin
  end

end
