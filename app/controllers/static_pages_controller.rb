class StaticPagesController < ApplicationController


def index
end

def home
@topsites  = Site.approved.order('hit DESC').limit(10)
@lastsites =Site.approved.order('updated_at ASC').limit(10)
@topcat = Category.public.order('hit DESC').limit(10)
#render :layout => 'home_layout'
end

end
