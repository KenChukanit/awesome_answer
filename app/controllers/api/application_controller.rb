
# rails g controller Api::Application --no-assets --no-helper --skip-template-engine
class Api::ApplicationController < ApplicationController


    skip_before_action :verify_authenticity_token


end
