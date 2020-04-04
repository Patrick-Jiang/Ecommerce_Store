# frozen_string_literal: true

class PagesController < ApplicationController
  def about
    @about = Page.find(1)
  end

  def contact
    @contact = Page.find(2)
  end
end
