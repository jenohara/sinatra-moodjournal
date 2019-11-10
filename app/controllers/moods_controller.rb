class MoodsController < ApplicationController

    get "/moods" do
        @moods = Mood.all 
        erb :'moods/show.html'
    end

    post "/moods" do
        @mood = Mood.create(mood_type: params[:mood_type])
        redirect to "/moods"
    end

end