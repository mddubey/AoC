input = File.readlines('./005/input.txt').map { |line| line.scan(/\d+/).map(&:to_i) }

def find_points_between(x0, y0, x1, y1)
    points = []
    steep = ((y1-y0).abs) > ((x1-x0).abs)
    if steep
      x0,y0 = y0,x0
      x1,y1 = y1,x1
    end
    if x0 > x1
      x0,x1 = x1,x0
      y0,y1 = y1,y0
    end
    deltax = x1-x0
    deltay = (y1-y0).abs
    error = (deltax / 2).to_i
    y = y0
    ystep = nil
    if y0 < y1
      ystep = 1
    else
      ystep = -1
    end
    for x in x0..x1
      if steep
        points.append("(#{y}, #{x})")
      else
        points.append("(#{x}, #{y})")
      end
      error -= deltay
      if error < 0
        y += ystep
        error += deltax
      end
    end
    return points
end


all_points = input
# .select {|row| row[0] == row[2] || row[1] == row[3]}
.map do |row|
    find_points_between(row[0], row[1], row[2], row[3])
end

points_occurance = all_points.flatten.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
puts points_occurance.select {|p, v| v>1}.length

