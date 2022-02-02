class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts)
    unless current_user.nil?
    render json: { message: 'You are logged in.' }, status: 200
    else
      render json: { message: 'Wrong login or password'}, status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened."}, status: :unauthorized
  end
  end