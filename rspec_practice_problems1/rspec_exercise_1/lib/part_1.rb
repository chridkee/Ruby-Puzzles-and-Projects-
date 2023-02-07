def average(num1, num2)
    return (num1.to_f + num2.to_f) / 2.0
end

def average_array(arr)
    total = arr.sum
    return total.to_f / arr.length
end

def repeat(str, num)
    newstr = ""
    num.times do
        newstr += str
    end
    return newstr
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    newarr = []
    str_arr = str.split(" ")
    str_arr.each_with_index do |word, idx|
        if idx.even?
            newarr << word.upcase
        else
            newarr << word.downcase
        end
    end
    return newarr.join(" ")
end


def hipsterfy(word)
    vowels = "AEIOUaeiou"
    arr = []
    rev = word.reverse
    count = 0
    rev.each_char do |char|
        if !vowels.include?(char)
            arr << char
        elsif vowels.include?(char) && count == 0
            count += 1
        else
            arr << char
        end
    end
    return arr.reverse.join("")
end

def vowel_counts(str)
    vowels = "aeiou"
    counts = Hash.new(0)
    str.downcase.each_char do |char|
        if vowels.include?(char)
            counts[char] += 1
        end
    end
    return counts
end

def caesar_cipher(msg, n)
    alpha = ("a".."z").to_a
    msg_arr = msg.split("")

    msg_arr.map! do |char|
        if !alpha.include?(char)
            char
        else
            rotate(char, n)
        end
    end
    return msg_arr.join('')
end

def rotate(char, num)
    alpha = ("a".."z").to_a
    original_idx = alpha.index(char)

    new_idx = original_idx + num
    if new_idx >= 52
        until new_idx < 52
            new_idx -= 26
        end
    end

    if new_idx > 25
        return alpha[new_idx-26]
    else
        return alpha[new_idx]
    end
end
