require 'gmapv3'

describe "GoogleMap::Map" do
  it "should initialize functions" do
      map = GoogleMap::Map.new('map', :center => [10.5,5.6], :zoom => 5, :mapTypeControl => true, :mapType => 'ROADMAP')
      map.center.should == [10.5,5.6]
      map.zoom.should == 5
      map.mapTypeControl.should == true
      map.mapType.should == 'ROADMAP'
  end
  
  it "should respond to to_html" do
    map = GoogleMap::Map.new('map')
    map.should respond_to 'to_html'
  end
  
  it "should be able to add markers" do
    map = GoogleMap::Map.new('map')
    map.markers.empty?.should be true
    map.markers << GoogleMap::Marker.new([10.5,5.6], :title => 'Title', :icon => 'icon.png')
    map.markers.length.should be 1
  end
  
end

describe "Marker" do
  
  before(:each) do
   @marker = GoogleMap::Marker.new([10.5,5.6], :title => 'Title', :icon => 'icon.png')
  end
  
  it "should initialize options" do
    @marker.position.should == [10.5,5.6]
    @marker.title.should == 'Title'
    @marker.icon.should == 'icon.png'
  end
  
  it "should respond to to_js" do
    @marker.should respond_to 'to_js'
  end
  
  it "should output js to create marker" do
    @marker.to_js.should include "marker = new google.maps.Marker"
  end
  
end
