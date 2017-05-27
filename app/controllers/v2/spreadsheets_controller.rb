class V2::SpreadsheetsController < ApplicationController
  def show
    json_response({ message: 'Hello there'})
  end
end
