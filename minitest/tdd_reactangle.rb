require 'minitest/autorun'

class Rectangle
    attr_accessor :a,:b
    def initialize(a,b)
        @a = a
        @b = b
    end

    def area
        @a*@b
    end

    def perimeter
        @a*2 + @b*2
    end

    def is_square?
        @a == @b
    end
end
    



describe Rectangle do
    describe '.area' do
        it 'return calculated area of the rectangle' do
            # Given
            rect=Rectangle.new(4,5)
            #when
            area =rect.area
            #then
            _(area).must_equal(20)
        end
    end
    describe '.perimeter'do
        it 'return the calculated perimeter of the rectangle' do
            #given
            rect= Rectangle.new(4,5)
            #when
            perm = rect.perimeter
            #Then
            _(perm).must_equal(18)
        end
    end 
    describe '.is_square' do
        it "return true if the rectangle is a square" do
            # given
            rect =Rectangle.new(4,4)
            #when
            value=rect.is_square?
            #then
            _(value).must_equal(true)
        end
    end

end


