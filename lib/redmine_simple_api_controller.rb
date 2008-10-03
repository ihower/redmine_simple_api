class RedmineSimpleApiController < ActionController::Base

  SIMPLE_SECRET_TOKEN = 'qwert'
  before_filter :check_secret_token
  before_filter :find_wiki_page, :only => [:get_wiki, :update_wiki]

  # project_id, :page, :version(optional)
  def get_wiki
    @page.content = WikiContent.new(:page => @page) if @page.new_record?
    @content = @page.content_for_version(params[:version])
    @content.text = "h1. #{@page.pretty_title}" if @content.text.blank?
    render :text => @content.text
  end

  # project_id, :page, :content_text, :user_id, :content_comments(optional)
  def update_wiki
    return unless request.post?
    @page.content = WikiContent.new(:page => @page) if @page.new_record?
    @content = @page.content_for_version(params[:version])
    @content.text = "h1. #{@page.pretty_title}" if @content.text.blank?
    @content.comments = nil

    if !@page.new_record? && @content.text == params[:content_text]
      # don't save if text wasn't changed
      return
    end

    # @content.attributes = params[:content_text]
    @content.text = params[:content_text]
    @content.author = User.find_by_login( params[:user] )
    @content.comments = params[:content_comments]
    if (@page.new_record? ? @page.save : @content.save)
      render :text => 'ok'
    else
      render :text => 'err'
    end

  end

  # issue_id, :hours, :activity_id, :user, :comments(optional)
  def timelog_issue
    begin
      if params[:issue_id]
        @issue = Issue.find(params[:issue_id])
        @project = @issue.project
      else
        render_404
        return false
      end
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    @time_entry ||= TimeEntry.new(:project => @project, :issue => @issue, 
                                  :user => User.find_by_login( params[:user] ), :spent_on => Date.today)
    @time_entry.hours = params[:hours]
    @time_entry.comments = params[:comments]
    @time_entry.activity_id = params[:activity_id]
    
    if @time_entry.save
      render :text => 'ok' 
    else
      render :text => @time_entry.errors.full_messages.to_s
    end
  end

  protected

  def check_secret_token
    render_403 unless params[:token] == SIMPLE_SECRET_TOKEN
  end

  def find_wiki_page
    begin
      @project = Project.find(params[:project_id])
      @wiki = @project.wiki
      @page = @wiki.find_or_new_page(params[:page])
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end

end
