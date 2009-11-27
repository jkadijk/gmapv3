module GoogleMap
  class Marker
    attr_accessor :position,
                  :title,
                  :icon,
                  :map,
                  :infowindow
                  
    def initialize(position, options = {})
      self.position = position
      self.map = 'map'
      options.each_pair { |key, value| send("#{key}=", value) }
    end
    
    def to_js
      js = []
      js << "myLatLng = new google.maps.LatLng(#{position[0]}, #{position[1]});"
      js <<	  "marker = new google.maps.Marker({"
      js <<      "position: myLatLng,"
      js <<      "map: map,"
      js <<     "icon: \"#{icon}\"," if icon
      js <<			"title: \"#{title}\""
      js <<	   "});"
      
      if infowindow 
        js << "content = \"#{infowindow}\";"
        js << "makeInfoWindow(marker, content , infowindow);"
      end
    end
  end
end