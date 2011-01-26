#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'nokogiri'

module SignalMediator
  VERSION = '1.0.0'
end

desc "Updates all source and test file headers"
task :headers do
  header = <<EOS
//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

EOS
  Dir[ '{src,test}/**/*.as' ].each do |uri|
    src = IO.read( uri )
    File.open( uri, 'w+' ) do |f|
      f << src.sub( /.+?(?=package)/m, header )
    end
  end
end

desc "Builds documentation"
task :docs do
  `asdoc \
   -output build/docs \
   -source-path src \
   -library-path libs/bin \
   -doc-sources src \
   -compiler.debug=true \
   -warnings=true \
   -main-title 'SignalMediator API Documentation' \
   -window-title 'SignalMediator API Documentation'`
end

desc "Builds SWC"
task :swc do
  `compc \
   -source-path src \
   -library-path libs/bin \
   -include-sources src \
   -output build/bin/operations-#{SignalMediator::VERSION}.swc`
end

desc "Compiles and runs the test suite"
task :test do
  `mxmlc \
  -source-path+=test,src,libs/src \
  -library-path+=libs/bin \
  -output deploy/SignalMediatorTestRunner.swf \
  -static-link-runtime-shared-libraries=false \
  test/SignalMediatorTestRunner.mxml`
  File.delete 'deploy/SignalMediatorTestRunner.swf.cache' if File.exist? 'deploy/SignalMediatorTestRunner.swf.cache'
  `open deploy/index.html`
end

desc "Builds SWC, docs, manifest, and tests"
task :release => [ :headers, :docs, :swc, :test ]