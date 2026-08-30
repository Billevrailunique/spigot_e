open Interp

let parse lexbuf = try Parser.programme Lexer.token lexbuf
                with 
                | Lexer.Error a -> Printf.eprintf "Erreur lexicale %s\n" a; exit 1
                | Parser.Error -> let pos = lexbuf.Lexing.lex_curr_p in Printf.eprintf "Erreur syntaxique à la ligne : %d et à la colonne %d\n" pos.pos_lnum (pos.Lexing.pos_cnum - pos.Lexing.pos_bol ); exit 1

                
let () = let ast =  parse (Lexing.from_channel stdin) in decode ast
