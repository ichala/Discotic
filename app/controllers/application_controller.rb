class ApplicationController < ActionController::Base
  add_flash_types :error
  require 'image_processing/mini_magick'
  file_system = Shrine.storages[:cache]
  file_system.clear! { |path| path.mtime < Time.now } # delete files older than 1 week
end
