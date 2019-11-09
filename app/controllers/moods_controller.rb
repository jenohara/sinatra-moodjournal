class MoodsController < ApplicationController

    get "/moods" do
        @moods = Mood.all 
        erb :'moods/show.html'
    end


end