class ActivitiesController < ApplicationController
    def index
      activities = Activity.all
      render json: activities, each_serializer: ActivitiesSerializer, status: :ok
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
    
        if activity.nil?
          render json: { error: "Activity not found" }, status: :not_found
        else
          activity.signups.destroy_all
          activity.destroy
          head :no_content
        end
    end
end