class LRUCache

   def initialize(length)
     @max = length
     @cache = []
   end

   def count
     @cache.count
   end

   def add(el)
     if @cache.include?(el)
       @cache.delete(el)
       @cache << el
     else
       if count == @max
           @cache.shift
           @cache << el
       else
         @cache << el
       end
     end
   end

   def show
     print @cache
   end

   private
   # helper methods go here!


 end
