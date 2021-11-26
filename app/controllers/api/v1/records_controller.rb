class Api::V1::RecordsController < ApplicationController

  # GET /api/v1/records/test
  # For testing serialization of records on the client
  def test
    @records = Record.limit(10)
  end

  # GET /api/v1/records/parsing_error
  # Testing 404 response with custom code
  def parsing_error
    render status: 404, json: {
      error: "Failed to parse a schedule",
      code: "1001"
    }
  end
end
