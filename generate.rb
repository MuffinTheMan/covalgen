# ----- ----- ----- ------ ----- ----- ----- #
# Written by MuffinTheMan (aka Caleb Larsen) #
# ----- ----- ----- ------ ----- ----- ----- #
#
# Program written in order to generate skeleton programs for CodeEval cahallenges.
#
require_relative "classes"
#
# ----- ----- ----- ------ ----- ----- ----- #
#                 Variables                  #
# ----- ----- ----- ------ ----- ----- ----- #
#
difficulties = ["easy","moderate","hard"]
languages = ["Ruby","PHP","Java"]
file_endings = Hash["Ruby" => "rb", "PHP" => "php", "Java" => "java"]
#
# ----- ----- ----- ------ ----- ----- ----- #
#                   Script                   #
# ----- ----- ----- ------ ----- ----- ----- #
#
print "What is the difficulty of the challenge? (easy/moderate/hard) "
difficulty = gets.chomp
unless difficulties.include?(difficulty)
  puts "Next time, try 'easy' or 'moderate' or 'hard'"
  exit
end

print "What language are you using? (Ruby/PHP/Java) "
language = gets.chomp
unless languages.include?(language)
  puts "Next time, try 'Ruby' or 'PHP' or 'Java'"
  exit
end
klass = Object.const_get(language)
f_ending = file_endings[language]

print "What is the name of the challenge (e.g. String Permutations)? "
challenge_name = gets.chomp
unless language === "Java"
  program_name = challenge_name.downcase.split.join('_') << ".#{f_ending}"
else
  program_name = "Main.java"
end
directory = "#{difficulty}/incomplete/#{challenge_name.downcase.split.join('_')}-#{f_ending}"

`mkdir #{directory}`
`touch #{directory}/input.txt`
`cp makefile-java #{directory}/makefile` if language === "Java"
`cp finish.sh #{directory}/`

File.open("#{directory}/#{program_name}",'w') do |f|
  f.puts "<?php" if language === "PHP"
  f.puts klass::SPACER
  f.puts klass::AUTHOR_HEADER
  f.puts klass::SPACER
  f.puts klass::COMMENT_MARKER
  f.puts "#{klass::COMMENT_MARKER} Program written as solution to \"#{challenge_name}\" challenge on codeeval.com"
  f.puts klass::COMMENT_MARKER
  f.puts klass::SPACER
  if klass::MONKEYPATCHING_HEADER
    f.puts klass::MONKEYPATCHING_HEADER
    f.puts klass::SPACER
    f.puts klass::COMMENT_MARKER
    f.puts "class Class"
    f.puts "end"
    f.puts klass::COMMENT_MARKER
    f.puts klass::SPACER
  end
  f.puts klass::SCRIPT_HEADER
  f.puts klass::SPACER
  f.puts klass::COMMENT_MARKER
  f.puts klass::OPEN_FILE
  f.puts "end" if language === "Ruby"
end

puts "Complete!"
puts "Run the following command to find your new project:"
puts "cd #{directory}/"