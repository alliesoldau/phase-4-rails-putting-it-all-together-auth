class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_message

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id 
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user, status: :ok
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    def render_unprocessable_entity_message (e)
        render json: { errors: e.record.errors }, status: :unprocessable_entity
    end
end

