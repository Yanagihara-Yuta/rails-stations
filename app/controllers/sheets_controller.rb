class SheetsController < ApplicationController
    def index
        @sheets = Sheet.all
        @column = 5
        @row = ["a","b","c"]
        @leg = @sheets.length
        
    end
end
