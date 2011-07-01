# -*- coding: utf-8 -*-
require "rubygems"
require "fox16"
require "main.rb" 
include Fox
 
application = FXApp.new("Hello", "FoxTest")
application.init(ARGV)

mainWindow = FXMainWindow.new(application, "Hello", nil,nil, DECOR_ALL,:width => 450, :height => 550)
main= FXHorizontalFrame.new(mainWindow,
      LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y,
      :padLeft => 0, :padRight => 0, :padTop => 0, :padBottom => 0)

listFrame = FXVerticalFrame.new(main,
      FRAME_SUNKEN|LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,
      :padLeft => 10, :padRight => 10, :padTop => 10, :padBottom => 10)
buttonFrame = FXVerticalFrame.new(main,
      FRAME_SUNKEN|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,
      :padLeft => 10, :padRight => 10, :padTop => 10, :padBottom => 10)

FXButton.new(buttonFrame, "&Quit", nil, application, FXApp::ID_QUIT)
FXButton.new(buttonFrame, "&Add", nil, application, FXApp::ID_QUIT)
FXButton.new(buttonFrame, "&Delete", nil, application, FXApp::ID_QUIT)
list=FXList.new(listFrame, :opts => LIST_BROWSESELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y)

fh=FileHandler.new()
entries=fh.read('/etc/hosts')
for entry in entries do
  list.appendItem(entry)
end

application.create()
mainWindow.show(PLACEMENT_SCREEN)
application.run()

