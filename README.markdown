Gmapv3
======

A simple wrapper around the google maps v3 JS api.

Not a lot of options are implemented yet but I will implement options as I use them in my project.

This is loosely based on this project http://github.com/bhedana/google_maps


Example
=======

	@map = GoogleMap::Map.new('map', :mapTypeControl => true)
	
And in the view:
	
	<%= @map.to_html%> 
	<div id="map" style="width:300px; height:300px;"></div>

The @map.to_html call probably belongs in the head so I use it like this:

	<% content_for :head do %>
		<%= @map.to_html %>
	<% end %>

Copyright (c) 2009 Jan Kadijk, released under the MIT license
