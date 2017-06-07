module V1
  class SpreadsheetsController < ApplicationController
    before_action :set_spreadsheet, only: [:show]
    skip_before_action :authorize_request

    # GET /spreadsheets
    def index
      @spreadsheets = Spreadsheet.all
      json_response(@spreadsheets)
    end

    # GET /spreadsheets/upvoted
    def upvoted
      @spreadsheets = current_user.upvoted_spreadsheets
      json_response(@spreadsheets)
    end

    # GET /spreadsheets/created
    def created
      @spreadsheets = current_user.created_spreadsheets
      json_response(@spreadsheets)
    end

    # GET /spreadsheets/submitted
    def submitted
      @spreadsheets = current_user.submitted_spreadsheets
      json_response(@spreadsheets)
    end

    # POST /spreadsheets, returns spreadsheet object
    def create
      @spreadsheet = current_user.spreadsheets.create!(spreadsheet_params)
      json_response(@spreadsheet)
    end

    # GET /spreadsheets/:id
    def show
      json_response(@spreadsheet)
    end

    # GET /spreadsheets/:spreadsheet_id/upvote
    def upvote
      @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
      Upvote.create!(user_id: current_user.id, spreadsheet_id: @spreadsheet.id)
      json_response(@spreadsheet)
    end

    # POST /spreadsheets/:spreadsheet_id/update, returns updated spreadsheet object
    def update
      @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
      @spreadsheet.update_attributes!(spreadsheet_params)
      json_response(@spreadsheet)
    end

    # POST /spreadsheets/:spreadsheet_id/update, returns deleted spreadsheet data
    def destroy
      @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
      @spreadsheet.update_attributes!(deleted_at: Time.now)
      json_response(@spreadsheet)
    end

    private

    def set_spreadsheet
      @spreadsheet = Spreadsheet.find(params[:id])
    end

    def spreadsheet_params
      params.require(:spreadsheet).permit(:title, :description, :url)
    end
  end
end
