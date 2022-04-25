require 'net/http'
require 'json'
require "uri"

class NpuService < PolitekDefaultService

  def self.timetable_url
    'http://nmu.npu.edu.ua/cgi-bin/timetable.cgi'
  end

  def self.server_id
    112
  end

  def self.university
    University.npu
  end

end
