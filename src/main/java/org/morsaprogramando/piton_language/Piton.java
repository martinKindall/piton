package org.morsaprogramando.piton_language;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

public class Piton {

//    void testing() {
//        Map<String, Integer> variables = new HashMap<>();
//        variables.containsKey("");
//        variables.get("");
//    }

    public static void main(String[] args) throws Exception {

        while (true) {
            System.out.println("Enter text: ");
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            String input = br.readLine();

            LexerGenerated lexer = new LexerGenerated(new StringReader(input));
            Parser parser = new Parser(lexer);

            try {
                parser.parse();
                System.out.println("Parsing completed successfully");
            } catch (Exception e) {
                System.out.println("Error during parsing: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}
