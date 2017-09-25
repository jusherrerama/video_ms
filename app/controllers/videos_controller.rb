class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    render :json =>  @videos
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    render :json => @video
  end

  # POST /videos
  # POST /videos.json
  def create
     @video = Video.new(video_params)
     if video_params["url_address"] != nil
       @video.remote_address_url = video_params["url_address"]
     end    
     if @video.save
          render json: @video, status: :created
     else
          render json: @video.errors, status: :unprocessable_entity
     end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        render json: @video, status: :ok
      else
        render json: @video.errors, status: :unprocessable_entity
      end
    end
  end
  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      render json: @video.errors, status: :no_content
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :category,:time, :user_id, :address, :url_address,:likes,:dislikes,:comments,:visits)
    end
end
