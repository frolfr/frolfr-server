module RequestHelper
  def json
    JSON.parse(response.body)
  end

  def auth_header(user)
    token_header = %[Token token="#{user.auth_token}", email="#{user.email}"]
    { 'Authorization' => token_header }
  end
end
