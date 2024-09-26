/*---------------------------------COOPERATE-----------------------23/04/2018-+
| Programa      : jdb425.p                                                    |
| Funcao        : Menu de relatorios                                          |
| Desenvolvedor : josimesio pereira                                           |
| Solicitacao   : nao possui                                                  |
+----------------------------------------------------------------------------*/
{shared.i}.


def var ws-normal                 as char.
def var ws-normal-o               as char format 'x(78)'
                                     extent 7 initial
['jdb403.p - Relatorio Geral com varias posições.'
,'jdb404.p - Relatorio para escolher Cruz Do dia.'
,'jdb405.p - Relatorio geral da Cruz de dias 00 a 09.'
,'jdb406.p - 10 grupos que menos sairam no periodo.'
,'jdb407.p - Comparativo de milhar que ja repitiu no primeiro premio.'
,'jdb408.p - Relatorio geral no periodo e qual premio deseja.'
,'jdb409.p - A definir.'
].


def frame t1b
   ws-normal-o[1]   form 'x(78)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[2]   form 'x(78)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[3]   form 'x(78)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[4]   form 'x(78)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[5]   form 'x(78)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[6]   form 'x(78)'
   help "Tipo Relatorio"
   skip
   with no-labels col 1 row 3 overlay 1 down  title "BANCA DO JOGO".
b0:
repeat with frame t-1:
   disp ws-normal-o with frame t1b.
   do with frame t1b:
      choose field ws-normal-o keys ws-normal.
      ws-normal = frame-value.
   end.
   hide frame t1b.
if ws-normal = 'jdb403.p - Relatorio Geral com varias posições.' then
do.
   run jdb403.p.
end.

if ws-normal = 'jdb404.p - Relatorio para escolher Cruz Do dia.' then
do.
   run jdb404.p.
end.

if ws-normal = 'jdb405.p - Relatorio geral da Cruz de dias 00 a 09.'then
do.
   run jdb405.p.
end.   
 
if ws-normal = 'jdb406.p - 10 grupos que menos sairam no periodo.' then
do.
   run jdb406.p.
end.   
 
if ws-normal = 'jdb407.p - Comparativo de milhar que ja repitiu no primeiro premio.' then
do.
   run jdb407.p.
end.   
 
if ws-normal = 'jdb408.p - Relatorio geral no periodo e qual premio deseja.' then
do.
   run jdb408.p.
end.   
      
   
   
   leave.
end.   
                                     
                                     
                                     
                                     







