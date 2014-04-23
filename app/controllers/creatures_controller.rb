class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    render :index
  end

  def new
    render :new
  end


  def create
    creature = params.require(:creature).permit(:name, :description)
    creature = Creature.create(creature)
    creature_name = creature[:name]
    redirect_to "/creatures/#{creature.id}"
  end

  def show
    name_search = params[:name]
    creature_id = params[:id]
    @creature = Creature.find(creature_id)

  render :show
  end

  def edit
    name_search = params[:id]
    @creature = Creature.find(name_search)
    # binding.pry
    render :edit
  end


end
