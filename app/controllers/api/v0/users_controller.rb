class Api::V0::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
  
  def create 
    @user = User.create!(user_params)
    render json: UsersSerializer.new(@user), status: 201
  end

  def invalid_response(error) 
    render json: {error: error.message}, status: 400
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end