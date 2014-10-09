require 'spec_helper'

def json
  JSON.parse(response.body)
end
