unit module SQL;
use v6;
use SQL::Lexer;

grammar Basic:ver<0.1.2> is Lexer:ver<0.1.2..*> {
    rule TOP {
        \s*
        [   <comment>
         || <statement> <semicolon>
        ] +
    }
    rule statement {
        <drop-statement>
     || <generic-statement>
    }
    rule drop-statement {
        DROP [ <keyword> ]+ <regular-identifier>
    }
    rule generic-statement {
        <keyword>
        [
            <regular-identifier>
          | <keyword>
          | <quoted-label>
          | <variable>
          | <period>
          | <literal>
          | <left-paren>
          | <right-paren>
          | <comma>
          | <operator-symbol>
          | <comment>
        ]*
    }
}
