class BoxFinder
    def initialize(boxes)
        @boxes = boxes
        @loops = []
        @prisionersLoops = {}
    end

    def amountOfTriesTofind(prisioner)
        if !(loop = @prisionersLoops[prisioner]) then
            loop = findLoop(prisioner)
            saveLoop(loop)
        end

        prisionerActualIndex = loop.index(prisioner)
        prisionerStartingIndex = loop.index(@boxes[prisioner])
        diff = indexDifference(loop, prisionerStartingIndex, prisionerActualIndex)
        return diff
    end

    def indexDifference(loop, index1, index2)
        if index1 < index2 then return index2 - index1 end
        loop.count - index1 + index2
    end

    def saveLoop(loop)
        @loops.push(loop)
        for prisioner in loop do
            @prisionersLoops[prisioner] = loop 
        end
    end

    def findLoop(prisioner)
        loop = []
        index = prisioner
        while ((actual = @boxes[index]) != prisioner)
            loop.push(actual)
            index = actual
        end
        loop.push(actual)
        return loop
    end
end