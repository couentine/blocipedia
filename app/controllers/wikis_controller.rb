class WikisController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    
   @wiki = current_user.wikis.create(wiki_params)
  @wiki.title = params[:wiki][:title]
  @wiki.body = params[:wiki][:body]
  @wiki.user = current_user
  authorize @wiki
  
  if @wiki.save
    flash[:notice] = 'Your Wiki has been saved.'
    redirect_to @wiki
  
  else
  
  flash.now[:alert] =  "There was an error saving your wiki. Please try again."
  render :new
  end
end




  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
  
  if @wiki.save
    flash[:notice] = 'Your Wiki has been updated.'
    redirect_to @wiki
  
  else
  
  flash.now[:alert] =  "There was an error saving your wiki. Please try again."
  render :edit
  end
  
  end
  def destroy
    authorize @wiki
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path

    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
end


  end
  
  
    def wiki_params
    params.require(:wiki).permit(:title, :body, :public)
end
  
end
