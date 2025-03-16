package org.morsaprogramando.piton_language;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.StringReader;

public class Piton {

    public static void main(String[] args) throws Exception {
        boolean isInteractive = false;

        if (args.length > 1) {
            isInteractive = Boolean.parseBoolean(args[1]);
        }

        if (!isInteractive) {
            String filepath = "./simple_program.pi";

            try {
                // Create a file reader for the input file
                FileReader fileReader = new FileReader(filepath);

                // Create lexer and parser with the file input
                LexerGenerated lexer = new LexerGenerated(fileReader);
                Parser parser = new Parser(lexer);

                // Parse the file
                parser.parse();
            } catch (java.io.FileNotFoundException e) {
                System.err.println("Error: File not found: " + filepath);
                System.exit(1);
            } catch (Exception e) {
                System.err.println("Error during parsing: " + e.getMessage());
                e.printStackTrace();
                System.exit(1);
            }

            return;
        }

        while (true) {
            System.out.print("piton > ");
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            String input = br.readLine();

            if ("quit".equalsIgnoreCase(input)) {
                System.exit(0);
            }

            LexerGenerated lexer = new LexerGenerated(new StringReader(input));
            Parser parser = new Parser(lexer);

            try {
                parser.parse();
            } catch (Exception e) {
                System.out.println("Error during parsing: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}
