class Settings
  AUTHOR = "MuffinTheMan (aka Caleb Larsen)"
end

class Ruby
  SPACER = "# ----- ----- ----- ------ ----- ----- ----- #"
  AUTHOR_HEADER = "# Written by " + Settings::AUTHOR + " #"
  MONKEYPATCHING_HEADER = "#               MonkeyPatching               #"
  SCRIPT_HEADER = "#                   Script                   #"
  COMMENT_MARKER = "#"
  OPEN_FILE = "# Open file (name supplied as first argument) and read through one line at a time.\n\
File.open(ARGV[0]).each_line do |line|"
end

class PHP
  SPACER = "// ----- ----- ----- ------ ----- ----- ----- //"
  AUTHOR_HEADER = "// Written by " + Settings::AUTHOR + " //"
  MONKEYPATCHING_HEADER = nil
  SCRIPT_HEADER = "//                   Script                   //"
  COMMENT_MARKER = "//"
  OPEN_FILE = "// Open file (name supplied as first argument) and read through one line at a time.\n\
  $fh = fopen($argv[1], \"r\");\n\n\
  while ($line = fgets($fh)) {\n\
  }"
end

class Java
  SPACER = "// ----- ----- ----- ------ ----- ----- ----- //"
  AUTHOR_HEADER = "// Written by " + Settings::AUTHOR + " //"
  MONKEYPATCHING_HEADER = nil
  SCRIPT_HEADER = "//                   Script                   //"
  COMMENT_MARKER = "//"
  OPEN_FILE = "import java.io.*;\n\n\
public class Main {\n\
    public static void main (String[] args) throws IOException {\n\
        // Open file (name supplied as first argument) and read through one line at a time.\n\
        File file = new File(args[0]);\n\
        BufferedReader buffer = new BufferedReader(new FileReader(file));\n\
        String line;\n\
        while ((line = buffer.readLine()) != null) {\n\
            line = line.trim();\n\
            // Process line of input Here\n\
        }\n\
    }\n\
}"
end