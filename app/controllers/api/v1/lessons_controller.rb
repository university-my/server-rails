class Api::V1::LessonsController < ApplicationController

  # GET /api/v1/lessons/test
  def test
    @auditorium = University.sumdu.auditorium.first
    @records = Lesson.limit(10)
  end

  # GET /api/v1/lessons/parsing_error
  # Testing 500 response with custom code
  def parsing_error
    render status: 500, json: {
      error: "Failed to parse a schedule",
      code: "1001"
    }
  end
end
