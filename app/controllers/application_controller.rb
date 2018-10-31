require './.key.rb'

class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    puts(key)
    JWT.encode(payload, 'my_secret')
  end

  def auth_header
      # { 'Authorization': '<token>' }
      request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header
      # headers: { 'Authorization': '<token>' }
      begin
        JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
        # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end



  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      return @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
