module RequestHelper
  def json
    JSON.parse(response.body)
  end

  def auth_header(user)
    token_header = %[Token token="#{user.auth_token}", email="#{user.email}"]
    { 'Authorization' => token_header }
  end

  def log_in(user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate) { true }
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
  end
end
