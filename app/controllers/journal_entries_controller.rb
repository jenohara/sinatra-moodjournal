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
      @journal_entry = current_user.journal_entries.create(date: params[:date], content: params[:content], mood_ids: params[:mood_ids])
      flash[:message] = "Journal entry successfully created." if @journal_entry.id
      redirect "/journal_entries/#{@journal_entry.id}"
    else
      flash[:errors] = "Something went wrong - did you add some content?"
      redirect '/journal_entries/new'
    end
  end
  
  # GET: /journal_entries/5
  get "/journal_entries/:id" do
    redirect_if_not_logged_in
      set_journal_entry
      erb :"/journal_entries/show.html"
  end

  # GET: /journal_entries/5/edit
  get "/journal_entries/:id/edit" do
    redirect_if_not_logged_in
      set_journal_entry
      if authorized_to_edit?(@journal_entry)
        erb :'/journal_entries/edit.html'
      else
        redirect "users/#{current_user.id}"
      end
  end

  # PATCH: /journal_entries/5
  patch '/journal_entries/:id' do
    redirect_if_not_logged_in
      set_journal_entry
      if @journal_entry.user == current_user && params[:content] != ""
       @journal_entry.update(date: params[:date], content: params[:content], mood_ids: params[:mood_ids])
        flash[:message] = "Successfully updated entry."
        redirect to "/journal_entries/#{@journal_entry.id}"
      else
        redirect to "users/#{current_user.id}"
      end
  end

  # DELETE: /journal_entries/5/delete
  delete "/journal_entries/:id" do
    redirect_if_not_logged_in
      set_journal_entry
      if authorized_to_edit?(@journal_entry)
        @journal_entry.destroy
        flash[:message] = "Successfully deleted entry."
        redirect '/journal_entries'
      else
        redirect '/journal_entries'
      end
  end

  private
  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end

end
