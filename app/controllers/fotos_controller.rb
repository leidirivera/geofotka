class FotosController < ApplicationController
  def map
    @foto = Foto.find(params[:id])
    # show map.html.erb
  end
  
  # GET /fotos
  # GET /fotos.xml
  def index
    @fotos = Foto.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fotos }
    end
  end

  # GET /fotos/1
  # GET /fotos/1.xml
  def show
    @foto = Foto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foto }
    end
  end

  # GET /fotos/new
  # GET /fotos/new.xml
  def new
    @foto = Foto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foto }
    end
  end

  # GET /fotos/1/edit
  def edit
    @foto = Foto.find(params[:id])
  end

  # POST /fotos
  # POST /fotos.xml
  def create
  	params[:foto]['gallery'] = Gallery.find(params[:foto]['gallery'].to_s)
    @foto = Foto.new(params[:foto])
	file = DataFile.save(params[:upload])
	@foto.file_path = path = params[:upload]['datafile'].original_filename()
	
    respond_to do |format|
      if @foto.save
        flash[:notice] = 'Foto was successfully created.'
        format.html { redirect_to :action => 'show',
		  :controller => 'galleries', :id => @foto.gallery }
        format.xml  { render :xml => @foto, :status => :created, :location => @foto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fotos/1
  # PUT /fotos/1.xml
  def update
  	params[:foto]['gallery'] = Gallery.find(params[:foto]['gallery'].to_s)
    @foto = Foto.find(params[:id])
	
    if params[:upload]['datafile'].class.to_s != 'String'
	  DataFile.destroy(@foto.file_path)
	  DataFile.save(params[:upload])
	  params[:foto]['file_path'] = \
	    params[:upload]['datafile'].original_filename()
	end
	
    respond_to do |format|
      if @foto.update_attributes(params[:foto])
        flash[:notice] = 'Foto was successfully updated.'
        format.html { redirect_to :action => 'show',
        :controller => 'galleries',
        :id => @foto.gallery }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.xml
  def destroy
    @foto = Foto.find(params[:id])
	@gallery = @foto.gallery
	DataFile.destroy(@foto.file_path)
    @foto.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'show',
        :controller => 'galleries',
        :id => @gallery	}
      format.xml  { head :ok }
    end
  end
end
