class ExtrasController < ApplicationController
    def index
        @projects = Project.all
    end
end