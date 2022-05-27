class LessonsController < ApplicationController

  private

    def lesson_params
      params.require(:lesson).permit()
    end

end
