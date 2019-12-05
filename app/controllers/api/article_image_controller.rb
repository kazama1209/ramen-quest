class Api::ArticleImageController < Api::ApplicationController
  def create
    files = params.require(:files)
    @image = ArticleImage.new
    @image.file = files[0]
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json do
          render json: {
            files:
              [
                {
                  url: @image.file.url,
                  thumbnail_url: @image.file.thumb.url,
                  size: 0
                }
              ]
          }
        end
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
end
