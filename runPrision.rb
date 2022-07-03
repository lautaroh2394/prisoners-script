require_relative 'log'

def runPrision(length)
    prisioners = (0..length - 1).to_a.shuffle
    boxes = prisioners.shuffle

    finder = BoxFinder.new(boxes)

    for prisioner in prisioners do
        tries = finder.amountOfTriesTofind(prisioner)
        if tries > $ALLOWED_BOXES_TO_LOOK
            return false
        end
    end

    return true
end