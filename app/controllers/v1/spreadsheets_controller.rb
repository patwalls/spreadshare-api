module V1
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

    # GET /spreadsheets/:id/upvote
    def upvote
      @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
      Upvote.create!(user_id: current_user.id, spreadsheet_id: @spreadsheet.id)
      json_response(@spreadsheet)
    end

    # POST /spreadsheets/:id/update, returns updated spreadsheet object
    def update
      @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
      @spreadsheet.update_attributes!(spreadsheet_params)
      json_response(@spreadsheet)
    end

    private

    def set_spreadsheet
      @spreadsheet = Spreadsheet.find(params[:id])
    end

    def spreadsheet_params
      params.require(:spreadsheet).permit(:title)
    end
  end
end
