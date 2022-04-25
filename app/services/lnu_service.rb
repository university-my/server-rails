require 'net/http'
require 'json'
require "uri"

class LnuService < PolitekDefaultService

  def self.timetable_url
    'https://dekanat.lnu.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    106
  end

  def self.university
    University.lnu
  end

end