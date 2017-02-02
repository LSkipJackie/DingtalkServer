class AdminController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  # 请求jsapi_config
  def request_jsapi_config
    params_url = params[:url] || ''
    url = Base64.decode64(params_url) || ''
    server = Dingtalk::Server.new(Dingtalk.corpid, Dingtalk.corpsecret)
    config = server.create_jsapi_config(url)
    result = {}
    if config.nil?
      result[:status] = 'error'
      result[:config] = {}
    else
      result[:status] = 'OK'
      result[:config] = config
    end
    render json: result
  end

  # 查询钉钉上的所有用户
  def all_dingtalk_users
    server = Dingtalk::Server.new(Dingtalk.corpid, Dingtalk.corpsecret)
    users = server.query_all_users
    render json: users.map { |u| {name: u.name, userid: u.userid} }
  end
end
