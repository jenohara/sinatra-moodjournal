class JournalEntriesController < ApplicationController

  # GET: /journal_entries
  get "/journal_entries" do
    erb :"/journal_entries/index.html"
  end

  # GET: /journal_entries/new
  get "/journal_entries/new" do
    erb :"/journal_entries/new.html"
  end

  # POST: /journal_entries
  post "/journal_entries" do
    redirect "/journal_entries"
  end

  # GET: /journal_entries/5
  get "/journal_entries/:id" do
    erb :"/journal_entries/show.html"
  end

  # GET: /journal_entries/5/edit
  get "/journal_entries/:id/edit" do
    erb :"/journal_entries/edit.html"
  end

  # PATCH: /journal_entries/5
  patch "/journal_entries/:id" do
    redirect "/journal_entries/:id"
  end

  # DELETE: /journal_entries/5/delete
  delete "/journal_entries/:id/delete" do
    redirect "/journal_entries"
  end
end
