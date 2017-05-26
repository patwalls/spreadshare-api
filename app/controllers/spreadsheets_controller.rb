class SpreadsheetsController < ApplicationController
  before_action :set_spreadsheet, only: [:show]

  # GET /todos
  def index
    @spreadsheets = current_user.spreadsheets
    json_response(@spreadsheets)
  end

  # GET /spreadsheets/:id
  def show
    json_response(@spreadsheet)
  end

  private

  def set_spreadsheet
    @spreadsheet = Spreadsheet.find(params[:id])
  end
end
