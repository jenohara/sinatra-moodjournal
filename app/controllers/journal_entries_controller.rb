class JournalEntriesController < ApplicationController

  # GET: /journal_entries/new
  get "/journal_entries/new" do
    erb :"/journal_entries/new.html"
  end

  # POST: /journal_entries
  post "/journal_entries" do 
    if !logged_in?
      redirect to "/"
    end
    if params[:content] != ""
    @journal_entry = JournalEntry.create(date: params[:date], happy: params[:happy], bored: params[:bored], angry: params[:angry], excited: params[:excited], tired: params[:tired], frustrated: params[:frustrated], calm: params[:calm], sad: params[:sad], hurting: params[:hurting], content: params[:content], user_id: current_user.id)
    redirect "/journal_entries/#{@journal_entry.id}"
    
    else
      redirect to '/journal_entries/new'
    end
  end

   # GET: /journal_entries index route for all entries
   get "/journal_entries" do
    @journal_entries = JournalEntry.find
    erb :"/journal_entries/index.html"
  end
  
  # GET: /journal_entries/5
  get "/journal_entries/:id" do
    @journal_entry = JournalEntry.find(params[:id])
    erb :"/journal_entries/show.html"
  end

  # GET: /journal_entries/5/edit
  get "/journal_entries/:id/edit" do
    @journal_entry = JournalEntry.find(params[:id])
    erb :"/journal_entries/edit.html"
  end

  # PATCH: /journal_entries/5
  patch "/journal_entries/:id" do
    @journal_entry = JournalEntry.find(params[:id])
    redirect "/journal_entries/:id"
  end

  # DELETE: /journal_entries/5/delete
  delete "/journal_entries/:id/delete" do
    redirect "/journal_entries"
  end

  helpers do
  
    def moods
      @moods = []
      @journal_entry = JournalEntry.find(params[:id])

      @journal_entry.all.each do |element|
        if element != nil && element != date && element != content
          @moods << element
          binding.pry
          @moods
        end
      end
    end
  end


end
