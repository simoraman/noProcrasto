# -*- coding: utf-8 -*-
require "rubygems"
require "fox16"
require "main.rb" 
include Fox
 
application = FXApp.new("Hello", "FoxTest")
application.init(ARGV)

main = FXMainWindow.new(application, "Hello", nil,nil, DECOR_ALL,:width => 450, :height => 550)
FXButton.new(main, "&Quit", nil, application, FXApp::ID_QUIT)
FXButton.new(main, "&Add", nil, application, FXApp::ID_QUIT)
list=FXList.new(main, :opts => LIST_BROWSESELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y)

fh=FileHandler.new()
l=fh.read('/etc/hosts')
for entry in l do
  list.appendItem(entry)
end

application.create()
main.show(PLACEMENT_SCREEN)
application.run()

