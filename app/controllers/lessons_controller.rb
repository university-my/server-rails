class LessonsController < InheritedResources::Base

  private

    def lesson_params
      params.require(:lesson).permit()
    end

end
