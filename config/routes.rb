Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/admin/jsapiconfig', to: 'admin#request_jsapi_config'
  get '/admin/users', to: 'admin#all_dingtalk_users'
end
