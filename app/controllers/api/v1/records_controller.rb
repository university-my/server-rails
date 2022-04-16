class Api::V1::RecordsController < ApplicationController

  # GET /api/v1/records/test
  # For testing serialization of records on the client
  def test
    @auditorium = University.sumdu.auditorium.first
    @records = Lesson.limit(10)
  end

  # GET /api/v1/records/parsing_error
  # Testing 500 response with custom code
  def parsing_error
    render status: 500, json: {
      error: "Failed to parse a schedule",
      code: "1001"
    }
  end
end
