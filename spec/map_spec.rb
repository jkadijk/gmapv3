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
end
