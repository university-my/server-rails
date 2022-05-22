class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Peform network request and parse JSON
  def self.perform_request(url)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    
    if uri.port == 443
      http.use_ssl = true
    end
    
    http.open_timeout = 5
    http.read_timeout = 3
    http.write_timeout = 5
    http.start

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    json = JSON.parse(response.body)

    http.finish if http.started?
    return json
  end

end
