require 'net/http'
require 'json'
require "uri"

class UbsService < PolitekDefaultService

  def self.timetable_url
    'http://decanat.cibs.ubs.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    108
  end

  def self.university
    University.ubs
  end

end