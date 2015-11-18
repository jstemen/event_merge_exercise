class Point
  attr_accessor :start_pt, :end_pt

  def initialize(start_pt, end_pt)
    @start_pt = start_pt
    @end_pt = end_pt
  end

  def <=> (other) #1 if self>other; 0 if self==other; -1 if self<other
    self.start_pt <=> other.start_pt
  end

  def == (other)
    (self.start_pt == other.start_pt) && (self.end_pt == other.end_pt)
  end

end

def merge_overlapping_pts(points)

  #puts "Unsorted points: #{points.inspect}"

  points.sort!

  #puts "Sorted points: #{points.inspect}"

  merged_points = []
  standing_start_pt = nil
  standing_end_pt = 0
  points.each { |pt|

    if standing_start_pt.nil?
      standing_start_pt = pt.start_pt
    else
      if pt.start_pt <= standing_end_pt
        #continue merge
      else
        #break the merge
        merged_points << Point.new(standing_start_pt, standing_end_pt)
        #restart merge
        standing_start_pt = pt.start_pt
      end

    end
    standing_end_pt = [standing_end_pt, pt.end_pt].max
    #puts "Merged points: #{merged_points.inspect}"
  }
  if standing_start_pt
    #finish off the what's left in the "buffer"
    merged_points << Point.new(standing_start_pt, standing_end_pt)
  end
  merged_points
end
