require 'net/http'
require 'json'
require "uri"

class ItstepService < PolitekDefaultService

  def self.timetable_url
    'http://stud.high.itstep.org/cgi-bin/timetable.cgi'
  end

  def self.server_id
    130
  end

  def self.university
    University.itstep
  end

end
