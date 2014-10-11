require 'spec_helper'

def json
  JSON.parse(response.body)
end

def log_in(user = factory_user)
  allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
end

def factory_user
  FactoryGirl.create(:user)
end
