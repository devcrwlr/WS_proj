class LyricsController < ApplicationController
  before_action :set_lyric, only: [:show, :edit, :update, :destroy]

  # GET /lyrics
  # GET /lyrics.json
  def index
    @lyrics = Lyric.all



  end

  # GET /lyrics/1
  # GET /lyrics/1.json
  def show
  end

  # GET /lyrics/new
  def new
    @lyric = $songandsingerlist
    songAry = []
    @lyric.each do |lyrics|
      songAry << lyrics["lyrics"]
    end

    @song = songAry

    @song.each do |getLyrics|

        require 'mechanize'
        require 'open-uri'
        require 'rubygems'
        require 'nokogiri'

        begin
        pagelyrics = Nokogiri::HTML(open(getLyrics, 'User-Agent' => 'firefox'))
        @lyricscontent = pagelyrics.css('div.inner-song-page-content p#lyrics_text')
        rescue
          @rescue = "E R R O R"
        end


    end






  end

  # GET /lyrics/1/edit
  def edit
  end

  # POST /lyrics
  # POST /lyrics.json
  def create
    @lyric = Lyric.new(lyric_params)

    respond_to do |format|
      if @lyric.save
        format.html { redirect_to @lyric, notice: 'Lyric was successfully created.' }
        format.json { render :show, status: :created, location: @lyric }
      else
        format.html { render :new }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lyrics/1
  # PATCH/PUT /lyrics/1.json
  def update
    respond_to do |format|
      if @lyric.update(lyric_params)
        format.html { redirect_to @lyric, notice: 'Lyric was successfully updated.' }
        format.json { render :show, status: :ok, location: @lyric }
      else
        format.html { render :edit }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lyrics/1
  # DELETE /lyrics/1.json
  def destroy
    @lyric.destroy
    respond_to do |format|
      format.html { redirect_to lyrics_url, notice: 'Lyric was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def get_lyrics
    @qwerty = "Hello World"
  end

  private
    # Use callbacks to lyricslinkshare common setup or constraints between actions.
    def set_lyric

      begin
        @lyric = Lyric.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @lyric = nil
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lyric_params
      params.fetch(:lyric, {})
    end
end
