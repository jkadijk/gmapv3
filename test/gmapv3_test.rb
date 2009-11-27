require 'test_helper'

class Gmapv3Test < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "map creation" do
    @map = GoogleMap::Map.new('test', :center => [10.5,4.6])
    assert_equal @map.center, [10.5,4.6]
  end
end
