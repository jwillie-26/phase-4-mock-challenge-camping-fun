class SignupsController < ApplicationController
    def create
      signup = Signup.new(signup_params)
      if signup.save
        render json: signup.activity, serializer: ActivitiesSerializer, status: :created
      else
        render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def signup_params
      params.require(:signup).permit(:time, :camper_id, :activity_id)
    end
end