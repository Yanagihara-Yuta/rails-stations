class SheetsController < ApplicationController
    def sheets
        @sheet = Sheet.all
    end
end
