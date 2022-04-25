require 'net/http'
require 'json'
require "uri"

class KemkService < PolitekDefaultService

  def self.timetable_url
    'http://test.kemt.kiev.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    124
  end

  def self.university
    University.kemk
  end

end
