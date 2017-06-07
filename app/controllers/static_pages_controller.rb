class StaticPagesController < ApplicationController


def index
end

def home
@topsites  = Site.approved.limit(10)
@lastsites =Site.approved.limit(10)
@topcat = Category.public.limit(10)
render :layout => 'home_layout'
end

end
