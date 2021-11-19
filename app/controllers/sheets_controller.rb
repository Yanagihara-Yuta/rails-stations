class SheetsController < ApplicationController
    def index
        @sheet = Sheet.all
    end
end
