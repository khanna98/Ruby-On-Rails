class PagesController < ApplicationController
    def about 
        @title = 'About Us';
        @content = 'This is an About Page';
    end
end
