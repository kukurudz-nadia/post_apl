class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.create(user_params)
    respond_with(user)
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :nickname, :email, :role_id)
  end
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: 'Signed up sucessfully.'}, status: 200
    else
      render json:  {message: "User couldn't be created successfully"}, status: :unprocessable_entity
    end
  end
  # def respond_with(resource, _opts = {})
  #   register_success && return if resource.persisted?
  #
  #   register_failed
  # end
  #
  # def register_success
  #   render json: { message: 'Signed up sucessfully.' }
  # end
  #
  # def register_failed
  #   render json: { message: "Something went wrong." }, status: 404
  # end
end