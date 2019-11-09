class JournalEntriesController < ApplicationController
  
  get '/journal_entries' do
    redirect_if_not_logged_in
      @journal_entries = current_user.journal_entries
      erb :'journal_entries/index.html'
  end

  # GET: /journal_entries/new
  get "/journal_entries/new" do
    redirect_if_not_logged_in
    erb :"/journal_entries/new.html"
  end

  # POST: /journal_entries
  post "/journal_entries" do 
    redirect_if_not_logged_in
      if params[:content] != ""
      @journal_entry = JournalEntry.create(date: params[:date], content: params[:content], user_id: current_user.id)
      @journal_entry.moods.create(happy: params[:happy], bored: params[:bored], angry: params[:angry], excited: params[:excited], tired: params[:tired], frustrated: params[:frustrated], calm: params[:calm], sad: params[:sad], hurting: params[:hurting], user_id: current_user.id, journal_entry_id: @journal_entry.id)
      flash[:message] = "Journal entry successfully created." if @journal_entry.id
      redirect "/journal_entries/#{@journal_entry.id}"
    else
      flash[:errors] = "Something went wrong - you must provide content for your entry."
      redirect '/journal_entries/new'
    end
  end
  
  # GET: /journal_entries/5
  get "/journal_entries/:id" do
    if logged_in?
      set_journal_entry
      erb :"/journal_entries/show.html"
    else
      redirect to "/"
    end
  end

  # GET: /journal_entries/5/edit
  get "/journal_entries/:id/edit" do
    if logged_in?
      set_journal_entry
      erb :"/journal_entries/edit.html"
    else
      redirect to "/"
    end
  end

  # PATCH: /journal_entries/5
  patch '/journal_entries/:id' do
    if logged_in?

      set_journal_entry
      if @journal_entry.user == current_user && params[:content] != ""
        @journal_entry.update(date: params[:date], happy: params[:happy], bored: params[:bored], angry: params[:angry], excited: params[:excited], tired: params[:tired], frustrated: params[:frustrated], calm: params[:calm], sad: params[:sad], hurting: params[:hurting], content: params[:content], user_id: current_user.id)
        redirect to "/journal_entries/#{@journal_entry.id}"
      else
        redirect to "users/#{current_user.id}"
      end
    else
      redirect to "/"
    end
  end

  # DELETE: /journal_entries/5/delete
  delete "/journal_entries/:id" do
    if logged_in?
      set_journal_entry
      @journal_entry.delete
      redirect '/journal_entries'
    else
      redirect to "/"
    end
  end

  private
  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end

end
