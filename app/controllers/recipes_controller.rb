class RecipesController < ApplicationController

    # skip_before_action :authorize, only: :index
    def index
        recipes = Recipe.all 
        render json: recipes, serializer: RecipesSerializer
    end
end
