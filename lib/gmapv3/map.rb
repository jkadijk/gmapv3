module GoogleMap
  class Map
    attr_accessor :zoom,
                  :center,
                  :mapTypeControl,
                  :mapType,
                  :markers,
                  :div
                  
    #Initializes the map 
    #
    #Options:
    # * :zoom - specify the zoomlevel of the map
    # * :center ([lat,lng]) - specify the center of the map
    # * :mapTypeControl (a boolean) - Specifies what controls to show on the map
    # * :mapType (a string) - Specify the type of map HYBRID etc.               
    def initialize(div, options = {})
      self.div = div
      self.zoom = 10
      self.center = [53.602, 6.222]
      self.mapTypeControl = false
      self.mapType = 'HYBRID'
      self.markers = []
      options.each_pair { |key, value| send("#{key}=", value) }
    end
    
    
    def to_html
      html = []
      html << "<script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js?sensor=false\"></script>"
      html << "<script type=\"text/javascript\">"

      html << to_js
      html << "</script>"
      return html.join("\n")
    end
    
    def to_js
      js = []
      js << "document.addEventListener('DOMContentLoaded', function() {"
      js << "initialize();"
      js <<  "}, false);"
      js << "function initialize() {"
      js <<  "var latlng = new google.maps.LatLng(#{center[0]}, #{center[1]});"
      js <<  "var myOptions = {"
      js <<   " zoom: #{zoom},"
      js <<    "center: latlng,"
   		js <<	 "mapTypeControl: #{mapTypeControl},"
      js <<    "mapTypeId: google.maps.MapTypeId.#{mapType}"
      js <<   " };"
      js << "var map = new google.maps.Map(document.getElementById(\"#{self.div}\"), myOptions);"
      ########## Marker stuff #########
      js << "var marker;"
 		  js << "var myLatLng;"
 		  js << "var icon"
 		  js << "var content"
 		  js << "var infowindow = new google.maps.InfoWindow({"
	    js <<	"size: new google.maps.Size(500,200)"
			js << "});"
			
			js << "function makeInfoWindow(markerer, content, infowindow){ "
    	js << "   google.maps.event.addListener(markerer, 'click', function () { "
    	js << "    infowindow.set_content(content); "
    	js <<    "infowindow.open(map, markerer); "
    	js << " }); "
    	js << "}"
 		  
 		  markers.each do |marker|
 		    js << marker.to_js
	    end
	    
      
      ##################################

      
      js << "}"
      return js.join("\n")
    end
  end
end