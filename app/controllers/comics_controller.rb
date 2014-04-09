class ComicsController < ApplicationController
  before_filter :set_comic, except: [:index, :new, :create] 
  authorize_resource except: [:index, :show]

  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.all
  end

  def new
    @comic = current_user.comics.build
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = current_user.comics.build(comic_params)
    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comic }
      else
        format.html { render action: 'new' }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
    respond_to do |format|
      debugger
      if @comic.update(comic_params)
        format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:title, :genre, :state, :description, :thumbnail)
    end
end
