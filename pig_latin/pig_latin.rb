class PigLatin
  VOWEL_SOUND = ["a","e","i","o","u","yt","xr"]
  CONSONANT_SOUND =["qu"]
  ADD_UP_SOUND = "ay"

  def self.translate(phrase)
    array_words = phrase.downcase.split(" ")
    array_words.map! {|word| self.pig_latin_word(word)}
    array_words.join(" ")
  end

  def self.pig_latin_word(word)
    array_alphet = word.downcase.split("")
    i = 0
    if !(VOWEL_SOUND.include?(word[0]) || VOWEL_SOUND.include?(word[0,2]))
      while !VOWEL_SOUND.include?(array_alphet[i])
        test_for_consonant = array_alphet[i] + array_alphet[i+1]
        if CONSONANT_SOUND.include?(test_for_consonant)
          i = i + 2
          break
        end
        i = i + 1
      end
    end
    array_alphet.rotate!(i)
    array_alphet.join + ADD_UP_SOUND
  end
end