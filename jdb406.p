/*---------------------------------COOPERATE-----------------------13/04/2018-+
| Modulo        :                                                             |
| Sub-modulo    :                                                             |
| Programa      : teste                                                       |
| Funcao        : teste                                                       |
| Solicitacao   : eeee                                                        |
+----------------------------------------------------------------------------*/

{shared.i}.
{device.w}.
{bib00271.i}. /* add-msg-c |run show-msg | get-ask | run update-askM ...*/

def var ws-descricao1               as char format 'x(10)'.
def var ws-descricao2               as char format 'x(10)'.
def var ws-descricao3               as char format 'x(10)'.
def var ws-descricao4               as char format 'x(10)'.
def var ws-descricao5               as char format 'x(10)'.
def var ws-grupo1                   as char.
def var ws-grupo2                   as char.
def var ws-grupo3                   as char.
def var ws-grupo4                   as char.
def var ws-grupo5                   as char.
def var ws-Premio1                  as int.
def var ws-Premio1-a                as char.
def var ws-Premio2                  as int.
def var ws-Premio2-a                as char.
def var ws-Premio3                  as int.
def var ws-Premio3-a                as char.
def var ws-Premio4                  as int.
def var ws-Premio4-a                as char.
def var ws-Premio5                  as int.
def var ws-Premio5-a                as char.

def var ws-est-grupo1               as int.
def var ws-est-grupo2               as int.
def var ws-est-grupo3               as int.
def var ws-est-grupo4               as int.
def var ws-est-grupo5               as int.
def var ws-est-grupo6               as int.
def var ws-est-grupo7               as int.
def var ws-est-grupo8               as int.
def var ws-est-grupo9               as int.
def var ws-est-grupo10              as int.
def var ws-est-grupo11              as int.
def var ws-est-grupo12              as int.
def var ws-est-grupo13              as int.
def var ws-est-grupo14              as int.
def var ws-est-grupo15              as int.
def var ws-est-grupo16              as int.
def var ws-est-grupo17              as int.
def var ws-est-grupo18              as int.
def var ws-est-grupo19              as int.
def var ws-est-grupo20              as int.
def var ws-est-grupo21              as int.
def var ws-est-grupo22              as int.
def var ws-est-grupo23              as int.
def var ws-est-grupo24              as int.
def var ws-est-grupo25              as int.

def var ws-primos                 as log format 'Sim/Nao'.
def var ws-normal                 as char.
def var ws-normal-o               as char format 'x(20)'
                                     extent 2 initial
                                     ['Grupo Menos Saiu'
                                     ,'ADefinir'
                                     ].
                                                                          
def var ws-data-ini               as date form '99/99/9999'.
def var ws-data-fin               as date form '99/99/9999'.
def var ws-milhar                 as int form '9999'.

def temp-table tmp001
    field estatistica       as int
    field grupo             as int  
    field descricao         as char
    field centena           as char
    field milhar            as char
    index tmp001-01 as unique
          grupo.

def frame t-1
   ws-normal
   label 'Relatorio Geral.........'
   skip
   ws-primos
   label 'Somente numeros primos..'
   skip
   with 1 down centered row 05 side-labels overlay width 78
     title 'RELATORIO'.

def frame t2
   ws-data-ini
   label 'Data inicial...'
   ws-data-fin
   label 'Data Final.....'
   with no-labels col 25 row 9 overlay 1 down title "DATA DO RELATORIO".

def frame t1b
   ws-normal-o[1]   form 'x(16)'
   help "Tipo Relatorio"
   skip
   with no-labels col 25 row 5 overlay 1 down  title "BANCA DO JOGO".


def frame t1c
    ws-milhar
    Label 'Escolha a milhar...'
    help 'Escolha o milhar a verificar'
    with 1 down centered row 05 side-labels overlay width 78
    title 'ESCOLHA O MILHAR'.
      

function ehPrimo returns logical(p_numero as int).
def var x as int.
do.
   do x = p_numero to 1 by -1.
      if x > 1 then
      do.
         if p_numero mod x = 0 then
            return yes.
      end.
   end.
   return no.
end.
end function.


b0:
repeat with frame t-1:
   
   disp ws-normal-o with frame t1b.
   do with frame t1b:
      choose field ws-normal-o keys ws-normal.
      ws-normal = frame-value.
   end.
   disp ws-normal.
   pause 0.
   hide frame t1b.
   hide frame t2.
   hide frame t-1.
   
   update ws-data-ini 
          ws-data-fin with frame t2.
   if ws-data-fin < ws-data-ini then
   do.
      run add-msg-c('Data invalida!').
      run show-msg.
      undo, next.
   end.       

   if keyfunc(lastkey) = 'end-error' then leave.
   i_empresa   = sh-empresa.
   i_unidade   = 0.
   i_cpl       = 160.
   i_cpp       = 20.
   i_lpp       = 6.
   i_nlinhas   = 62.
   c_titulo[1] = 'ESTATISTICAS DE SORTEIOS.'.
   {device.i}.
   view frame cab01.
   if ws-normal = 'Grupo Menos Saiu' then
   do.
      run grupo-menos-saiu in this-procedure.
   end.
   {devicef.i}.
   leave.         
end.






procedure grupo-menos-saiu.
def var ws-linha     as int.

b-1:
do on error undo b-1, leave b-1.
   for each jdb003
       where jdb003.data   >= ws-data-ini
         and jdb003.data   <= ws-data-fin.
   run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/

   run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
  
   run contagem-estatisticas-grupo in this-procedure.
   end.
   run forma-temporaria in this-procedure.
   
   
   
   
   for each tmp001
       break by tmp001.estatistica.
       ws-linha = ws-linha + 1.
   if ws-linha <= 10 then
   do.
      disp
         ws-linha
         tmp001.descricao    form 'x(15)' column-label 'BICHO'
         tmp001.grupo                     column-label 'GRUPO'
         tmp001.estatistica  column-label 'SAIU N-VEZES'
         skip.
      end.
   end.
   return 'grupo-menos-saiu_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.





/***Faz a estatistica de quantas vezes saiu o grupo***/
procedure contagem-estatisticas-grupo.
def buffer jdb003b for jdb003.

b-1:
do on error undo b-1, leave b-1.
   
   
   if ws-grupo5 = '01' then
   do.
      ws-est-grupo1 = ws-est-grupo1 + 1.
   end.
   
   if ws-grupo5 = '02' then
   do.
      ws-est-grupo2 = ws-est-grupo2 + 1.
   end.
    
   if ws-grupo5 = '03' then
   do.
      ws-est-grupo3 = ws-est-grupo3 + 1.
   end.
    
   if ws-grupo5 = '04' then
   do.
      ws-est-grupo4 = ws-est-grupo4 + 1.
   end.
    
   if ws-grupo5 = '05' then
   do.
      ws-est-grupo5 = ws-est-grupo5 + 1.
   end.
    
   if ws-grupo5 = '06' then
   do.
      ws-est-grupo6 = ws-est-grupo6 + 1.
   end.
    
   if ws-grupo5 = '07' then
   do.
      ws-est-grupo7 = ws-est-grupo7 + 1.
   end.
    
   if ws-grupo5 = '08' then
   do.
      ws-est-grupo8 = ws-est-grupo8 + 1.
   end.
    
   if ws-grupo5 = '09' then
   do.
      ws-est-grupo9 = ws-est-grupo9 + 1.
   end.
    
   if ws-grupo5 = '10' then
   do.
      ws-est-grupo10 = ws-est-grupo10 + 1.
   end.
    
   if ws-grupo5 = '11' then
   do.
      ws-est-grupo11 = ws-est-grupo11 + 1.
   end.
    
   if ws-grupo5 = '12' then
   do.
      ws-est-grupo12 = ws-est-grupo12 + 1.
   end.
    
   if ws-grupo5 = '13' then
   do.
      ws-est-grupo13 = ws-est-grupo13 + 1.
   end.
    
   if ws-grupo5 = '14' then
   do.
      ws-est-grupo14 = ws-est-grupo1 + 1.
   end.
    
   if ws-grupo5 = '15' then
   do.
      ws-est-grupo15 = ws-est-grupo15 + 1.
   end.
    
   if ws-grupo5 = '16' then
   do.
      ws-est-grupo16 = ws-est-grupo16 + 1.
   end.
    
   if ws-grupo5 = '17' then
   do.
      ws-est-grupo17 = ws-est-grupo17 + 1.
   end.
    
   if ws-grupo5 = '18' then
   do.
      ws-est-grupo18 = ws-est-grupo18 + 1.
   end.
    
   if ws-grupo5 = '19' then
   do.
      ws-est-grupo19 = ws-est-grupo19 + 1.
   end.
    
   if ws-grupo5 = '20' then
   do.
      ws-est-grupo20 = ws-est-grupo20 + 1.
   end.
   
   if ws-grupo5 = '21' then
   do.
      ws-est-grupo21 = ws-est-grupo21 + 1.
   end.
    
   if ws-grupo5 = '22' then
   do.
      ws-est-grupo22 = ws-est-grupo22 + 1.
   end.
    
   if ws-grupo5 = '23' then
   do.
      ws-est-grupo23 = ws-est-grupo23 + 1.
   end.
    
   if ws-grupo5 = '24' then
   do.
      ws-est-grupo24 = ws-est-grupo24 + 1.
   end.
    
   if ws-grupo5 = '25' then
   do.
      ws-est-grupo25 = ws-est-grupo25 + 1.
   end.
   
   if ws-grupo4 = '01' then
   do.
      ws-est-grupo1 = ws-est-grupo1 + 1.
   end.
   
   if ws-grupo4 = '02' then
   do.
      ws-est-grupo2 = ws-est-grupo2 + 1.
   end.
    
   if ws-grupo4 = '03' then
   do.
      ws-est-grupo3 = ws-est-grupo3 + 1.
   end.
    
   if ws-grupo4 = '04' then
   do.
      ws-est-grupo4 = ws-est-grupo4 + 1.
   end.
    
   if ws-grupo4 = '05' then
   do.
      ws-est-grupo5 = ws-est-grupo5 + 1.
   end.
    
   if ws-grupo4 = '06' then
   do.
      ws-est-grupo6 = ws-est-grupo6 + 1.
   end.
    
   if ws-grupo4 = '07' then
   do.
      ws-est-grupo7 = ws-est-grupo7 + 1.
   end.
    
   if ws-grupo4 = '08' then
   do.
      ws-est-grupo8 = ws-est-grupo8 + 1.
   end.
    
   if ws-grupo4 = '09' then
   do.
      ws-est-grupo9 = ws-est-grupo9 + 1.
   end.
    
   if ws-grupo4 = '10' then
   do.
      ws-est-grupo10 = ws-est-grupo10 + 1.
   end.
    
   if ws-grupo4 = '11' then
   do.
      ws-est-grupo11 = ws-est-grupo11 + 1.
   end.
    
   if ws-grupo4 = '12' then
   do.
      ws-est-grupo12 = ws-est-grupo12 + 1.
   end.
    
   if ws-grupo4 = '13' then
   do.
      ws-est-grupo13 = ws-est-grupo13 + 1.
   end.
    
   if ws-grupo4 = '14' then
   do.
      ws-est-grupo14 = ws-est-grupo1 + 1.
   end.
    
   if ws-grupo4 = '15' then
   do.
      ws-est-grupo15 = ws-est-grupo15 + 1.
   end.
    
   if ws-grupo4 = '16' then
   do.
      ws-est-grupo16 = ws-est-grupo16 + 1.
   end.
    
   if ws-grupo4 = '17' then
   do.
      ws-est-grupo17 = ws-est-grupo17 + 1.
   end.
    
   if ws-grupo4 = '18' then
   do.
      ws-est-grupo18 = ws-est-grupo18 + 1.
   end.
    
   if ws-grupo4 = '19' then
   do.
      ws-est-grupo19 = ws-est-grupo19 + 1.
   end.
    
   if ws-grupo4 = '20' then
   do.
      ws-est-grupo20 = ws-est-grupo20 + 1.
   end.
   
   if ws-grupo4 = '21' then
   do.
      ws-est-grupo21 = ws-est-grupo21 + 1.
   end.
    
   if ws-grupo4 = '22' then
   do.
      ws-est-grupo22 = ws-est-grupo22 + 1.
   end.
    
   if ws-grupo4 = '23' then
   do.
      ws-est-grupo23 = ws-est-grupo23 + 1.
   end.
    
   if ws-grupo4 = '24' then
   do.
      ws-est-grupo24 = ws-est-grupo24 + 1.
   end.
    
   if ws-grupo4 = '25' then
   do.
      ws-est-grupo25 = ws-est-grupo25 + 1.
   end.
   
   

   if ws-grupo3 = '01' then
   do.
      ws-est-grupo1 = ws-est-grupo1 + 1.
   end.
   
   if ws-grupo3 = '02' then
   do.
      ws-est-grupo2 = ws-est-grupo2 + 1.
   end.
    
   if ws-grupo3 = '03' then
   do.
      ws-est-grupo3 = ws-est-grupo3 + 1.
   end.
    
   if ws-grupo3 = '04' then
   do.
      ws-est-grupo4 = ws-est-grupo4 + 1.
   end.
    
   if ws-grupo3 = '05' then
   do.
      ws-est-grupo5 = ws-est-grupo5 + 1.
   end.
    
   if ws-grupo3 = '06' then
   do.
      ws-est-grupo6 = ws-est-grupo6 + 1.
   end.
    
   if ws-grupo3 = '07' then
   do.
      ws-est-grupo7 = ws-est-grupo7 + 1.
   end.
    
   if ws-grupo3 = '08' then
   do.
      ws-est-grupo8 = ws-est-grupo8 + 1.
   end.
    
   if ws-grupo3 = '09' then
   do.
      ws-est-grupo9 = ws-est-grupo9 + 1.
   end.
    
   if ws-grupo3 = '10' then
   do.
      ws-est-grupo10 = ws-est-grupo10 + 1.
   end.
    
   if ws-grupo3 = '11' then
   do.
      ws-est-grupo11 = ws-est-grupo11 + 1.
   end.
    
   if ws-grupo3 = '12' then
   do.
      ws-est-grupo12 = ws-est-grupo12 + 1.
   end.
    
   if ws-grupo3 = '13' then
   do.
      ws-est-grupo13 = ws-est-grupo13 + 1.
   end.
    
   if ws-grupo3 = '14' then
   do.
      ws-est-grupo14 = ws-est-grupo1 + 1.
   end.
    
   if ws-grupo3 = '15' then
   do.
      ws-est-grupo15 = ws-est-grupo15 + 1.
   end.
    
   if ws-grupo3 = '16' then
   do.
      ws-est-grupo16 = ws-est-grupo16 + 1.
   end.
    
   if ws-grupo3 = '17' then
   do.
      ws-est-grupo17 = ws-est-grupo17 + 1.
   end.
    
   if ws-grupo3 = '18' then
   do.
      ws-est-grupo18 = ws-est-grupo18 + 1.
   end.
    
   if ws-grupo3 = '19' then
   do.
      ws-est-grupo19 = ws-est-grupo19 + 1.
   end.
    
   if ws-grupo3 = '20' then
   do.
      ws-est-grupo20 = ws-est-grupo20 + 1.
   end.
   
   if ws-grupo3 = '21' then
   do.
      ws-est-grupo21 = ws-est-grupo21 + 1.
   end.
    
   if ws-grupo3 = '22' then
   do.
      ws-est-grupo22 = ws-est-grupo22 + 1.
   end.
    
   if ws-grupo3 = '23' then
   do.
      ws-est-grupo23 = ws-est-grupo23 + 1.
   end.
    
   if ws-grupo3 = '24' then
   do.
      ws-est-grupo24 = ws-est-grupo24 + 1.
   end.
    
   if ws-grupo3 = '25' then
   do.
      ws-est-grupo25 = ws-est-grupo25 + 1.
   end.
   
   

   if ws-grupo2 = '01' then
   do.
      ws-est-grupo1 = ws-est-grupo1 + 1.
   end.
   
   if ws-grupo2 = '02' then
   do.
      ws-est-grupo2 = ws-est-grupo2 + 1.
   end.
    
   if ws-grupo2 = '03' then
   do.
      ws-est-grupo3 = ws-est-grupo3 + 1.
   end.
    
   if ws-grupo2 = '04' then
   do.
      ws-est-grupo4 = ws-est-grupo4 + 1.
   end.
    
   if ws-grupo2 = '05' then
   do.
      ws-est-grupo5 = ws-est-grupo5 + 1.
   end.
    
   if ws-grupo2 = '06' then
   do.
      ws-est-grupo6 = ws-est-grupo6 + 1.
   end.
    
   if ws-grupo2 = '07' then
   do.
      ws-est-grupo7 = ws-est-grupo7 + 1.
   end.
    
   if ws-grupo2 = '08' then
   do.
      ws-est-grupo8 = ws-est-grupo8 + 1.
   end.
    
   if ws-grupo2 = '09' then
   do.
      ws-est-grupo9 = ws-est-grupo9 + 1.
   end.
    
   if ws-grupo2 = '10' then
   do.
      ws-est-grupo10 = ws-est-grupo10 + 1.
   end.
    
   if ws-grupo2 = '11' then
   do.
      ws-est-grupo11 = ws-est-grupo11 + 1.
   end.
    
   if ws-grupo2 = '12' then
   do.
      ws-est-grupo12 = ws-est-grupo12 + 1.
   end.
    
   if ws-grupo2 = '13' then
   do.
      ws-est-grupo13 = ws-est-grupo13 + 1.
   end.
    
   if ws-grupo2 = '14' then
   do.
      ws-est-grupo14 = ws-est-grupo1 + 1.
   end.
    
   if ws-grupo2 = '15' then
   do.
      ws-est-grupo15 = ws-est-grupo15 + 1.
   end.
    
   if ws-grupo2 = '16' then
   do.
      ws-est-grupo16 = ws-est-grupo16 + 1.
   end.
    
   if ws-grupo2 = '17' then
   do.
      ws-est-grupo17 = ws-est-grupo17 + 1.
   end.
    
   if ws-grupo2 = '18' then
   do.
      ws-est-grupo18 = ws-est-grupo18 + 1.
   end.
    
   if ws-grupo2 = '19' then
   do.
      ws-est-grupo19 = ws-est-grupo19 + 1.
   end.
    
   if ws-grupo2 = '20' then
   do.
      ws-est-grupo20 = ws-est-grupo20 + 1.
   end.
   
   if ws-grupo2 = '21' then
   do.
      ws-est-grupo21 = ws-est-grupo21 + 1.
   end.
    
   if ws-grupo2 = '22' then
   do.
      ws-est-grupo22 = ws-est-grupo22 + 1.
   end.
    
   if ws-grupo2 = '23' then
   do.
      ws-est-grupo23 = ws-est-grupo23 + 1.
   end.
    
   if ws-grupo2 = '24' then
   do.
      ws-est-grupo24 = ws-est-grupo24 + 1.
   end.
    
   if ws-grupo2 = '25' then
   do.
      ws-est-grupo25 = ws-est-grupo25 + 1.
   end.
   
   

   if ws-grupo1 = '01' then
   do.
      ws-est-grupo1 = ws-est-grupo1 + 1.
   end.
   
   if ws-grupo1 = '02' then
   do.
      ws-est-grupo2 = ws-est-grupo2 + 1.
   end.
    
   if ws-grupo1 = '03' then
   do.
      ws-est-grupo3 = ws-est-grupo3 + 1.
   end.
    
   if ws-grupo1 = '04' then
   do.
      ws-est-grupo4 = ws-est-grupo4 + 1.
   end.
    
   if ws-grupo1 = '05' then
   do.
      ws-est-grupo5 = ws-est-grupo5 + 1.
   end.
    
   if ws-grupo1 = '06' then
   do.
      ws-est-grupo6 = ws-est-grupo6 + 1.
   end.
    
   if ws-grupo1 = '07' then
   do.
      ws-est-grupo7 = ws-est-grupo7 + 1.
   end.
    
   if ws-grupo1 = '08' then
   do.
      ws-est-grupo8 = ws-est-grupo8 + 1.
   end.
    
   if ws-grupo1 = '09' then
   do.
      ws-est-grupo9 = ws-est-grupo9 + 1.
   end.
    
   if ws-grupo1 = '10' then
   do.
      ws-est-grupo10 = ws-est-grupo10 + 1.
   end.
    
   if ws-grupo1 = '11' then
   do.
      ws-est-grupo11 = ws-est-grupo11 + 1.
   end.
    
   if ws-grupo1 = '12' then
   do.
      ws-est-grupo12 = ws-est-grupo12 + 1.
   end.
    
   if ws-grupo1 = '13' then
   do.
      ws-est-grupo13 = ws-est-grupo13 + 1.
   end.
    
   if ws-grupo1 = '14' then
   do.
      ws-est-grupo14 = ws-est-grupo1 + 1.
   end.
    
   if ws-grupo1 = '15' then
   do.
      ws-est-grupo15 = ws-est-grupo15 + 1.
   end.
    
   if ws-grupo1 = '16' then
   do.
      ws-est-grupo16 = ws-est-grupo16 + 1.
   end.
    
   if ws-grupo1 = '17' then
   do.
      ws-est-grupo17 = ws-est-grupo17 + 1.
   end.
    
   if ws-grupo1 = '18' then
   do.
      ws-est-grupo18 = ws-est-grupo18 + 1.
   end.
    
   if ws-grupo1 = '19' then
   do.
      ws-est-grupo19 = ws-est-grupo19 + 1.
   end.
    
   if ws-grupo1 = '20' then
   do.
      ws-est-grupo20 = ws-est-grupo20 + 1.
   end.
   
   if ws-grupo1 = '21' then
   do.
      ws-est-grupo21 = ws-est-grupo21 + 1.
   end.
    
   if ws-grupo1 = '22' then
   do.
      ws-est-grupo22 = ws-est-grupo22 + 1.
   end.
    
   if ws-grupo1 = '23' then
   do.
      ws-est-grupo23 = ws-est-grupo23 + 1.
   end.
    
   if ws-grupo1 = '24' then
   do.
      ws-est-grupo24 = ws-est-grupo24 + 1.
   end.
    
   if ws-grupo1 = '25' then
   do.
      ws-est-grupo25 = ws-est-grupo25 + 1.
   end.
   
   

   
   
   
   
   return 'contagem-estatisticas-grupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.

/******Coverte Grupo ao numero representado***/
procedure convertegrupo.
b-1:
do on error undo b-1, leave b-1.
   
   Case string(ws-grupo1):
   when '01' then ws-descricao1 = 'Avestruz'.
   when '02' then ws-descricao1 = 'Aguia'.
   when '03' then ws-descricao1 = 'Burro'.
   when '04' then ws-descricao1 = 'Borboleta'.
   when '05' then ws-descricao1 = 'Cachorro'.
   when '06' then ws-descricao1 = 'Cabra'.
   when '07' then ws-descricao1 = 'Carneiro'.
   when '08' then ws-descricao1 = 'Camelo'.
   when '09' then ws-descricao1 = 'Cobra'.
   when '10' then ws-descricao1 = 'Coelho'.
   when '11' then ws-descricao1 = 'Cavalo'.
   when '12' then ws-descricao1 = 'Elefante'.
   when '13' then ws-descricao1 = 'Galo'.
   when '14' then ws-descricao1 = 'Gato'.
   when '15' then ws-descricao1 = 'Jacare'.
   when '16' then ws-descricao1 = 'Leao'.
   when '17' then ws-descricao1 = 'Macaco'.
   when '18' then ws-descricao1 = 'Porco'.
   when '19' then ws-descricao1 = 'Pavao'.
   when '20' then ws-descricao1 = 'Peru'.
   when '21' then ws-descricao1 = 'Touro'.
   when '22' then ws-descricao1 = 'Tigre'.
   when '23' then ws-descricao1 = 'Urso'.
   when '24' then ws-descricao1 = 'Veado'.
   when '25' then ws-descricao1 = 'Vaca'.
   end case.
   return 'convertegrupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.



Procedure CoverteJogos.
b-1:
do on error undo b-1, leave b-1.
   ws-Premio1 = jdb003.premio1.
   run editandogrupo in this-procedure.
   ws-Premio1-a = trim(substr(String(ws-Premio1-a),003,002)).

   case ws-Premio1-a:
   when '01' then ws-grupo1 = '01'.
   when '02' then ws-grupo1 = '01'.
   when '03' then ws-grupo1 = '01'.
   when '04' then ws-grupo1 = '01'.
   when '05' then ws-grupo1 = '02'.
   when '06' then ws-grupo1 = '02'.
   when '07' then ws-grupo1 = '02'.
   when '08' then ws-grupo1 = '02'.
   when '09' then ws-grupo1 = '03'.
   when '10' then ws-grupo1 = '03'.
   when '11' then ws-grupo1 = '03'.
   when '12' then ws-grupo1 = '03'.
   when '13' then ws-grupo1 = '04'.
   when '14' then ws-grupo1 = '04'.
   when '15' then ws-grupo1 = '04'.
   when '16' then ws-grupo1 = '04'.
   when '17' then ws-grupo1 = '05'.
   when '18' then ws-grupo1 = '05'.
   when '19' then ws-grupo1 = '05'.
   when '20' then ws-grupo1 = '05'.
   when '21' then ws-grupo1 = '06'.
   when '22' then ws-grupo1 = '06'.
   when '23' then ws-grupo1 = '06'.
   when '24' then ws-grupo1 = '06'.
   when '25' then ws-grupo1 = '07'.
   when '26' then ws-grupo1 = '07'.
   when '27' then ws-grupo1 = '07'.
   when '28' then ws-grupo1 = '07'.
   when '29' then ws-grupo1 = '08'.
   when '30' then ws-grupo1 = '08'.
   when '31' then ws-grupo1 = '08'.
   when '32' then ws-grupo1 = '08'.
   when '33' then ws-grupo1 = '09'.
   when '34' then ws-grupo1 = '09'.
   when '35' then ws-grupo1 = '09'.
   when '36' then ws-grupo1 = '09'.
   when '37' then ws-grupo1 = '10'.
   when '38' then ws-grupo1 = '10'.
   when '39' then ws-grupo1 = '10'.
   when '40' then ws-grupo1 = '10'.
   when '41' then ws-grupo1 = '11'.
   when '42' then ws-grupo1 = '11'.
   when '43' then ws-grupo1 = '11'.
   when '44' then ws-grupo1 = '11'.
   when '45' then ws-grupo1 = '12'.
   when '46' then ws-grupo1 = '12'.
   when '47' then ws-grupo1 = '12'.
   when '48' then ws-grupo1 = '12'.
   when '49' then ws-grupo1 = '13'.
   when '50' then ws-grupo1 = '13'.
   when '51' then ws-grupo1 = '13'.
   when '52' then ws-grupo1 = '13'.
   when '53' then ws-grupo1 = '14'.
   when '54' then ws-grupo1 = '14'.
   when '55' then ws-grupo1 = '14'.
   when '56' then ws-grupo1 = '14'.
   when '57' then ws-grupo1 = '15'.
   when '58' then ws-grupo1 = '15'.
   when '59' then ws-grupo1 = '15'.
   when '60' then ws-grupo1 = '15'.
   when '61' then ws-grupo1 = '16'.
   when '62' then ws-grupo1 = '16'.
   when '63' then ws-grupo1 = '16'.
   when '64' then ws-grupo1 = '16'.
   when '65' then ws-grupo1 = '17'.
   when '66' then ws-grupo1 = '17'.
   when '67' then ws-grupo1 = '17'.
   when '68' then ws-grupo1 = '17'.
   when '69' then ws-grupo1 = '18'.
   when '70' then ws-grupo1 = '18'.
   when '71' then ws-grupo1 = '18'.
   when '72' then ws-grupo1 = '18'.
   when '73' then ws-grupo1 = '19'.
   when '74' then ws-grupo1 = '19'.
   when '75' then ws-grupo1 = '19'.
   when '76' then ws-grupo1 = '19'.
   when '77' then ws-grupo1 = '20'.
   when '78' then ws-grupo1 = '20'.
   when '79' then ws-grupo1 = '20'.
   when '80' then ws-grupo1 = '20'.
   when '81' then ws-grupo1 = '21'.
   when '82' then ws-grupo1 = '21'.
   when '83' then ws-grupo1 = '21'.
   when '84' then ws-grupo1 = '21'.
   when '85' then ws-grupo1 = '22'.
   when '86' then ws-grupo1 = '22'.
   when '87' then ws-grupo1 = '22'.
   when '88' then ws-grupo1 = '22'.
   when '89' then ws-grupo1 = '23'.
   when '90' then ws-grupo1 = '23'.
   when '91' then ws-grupo1 = '23'.
   when '92' then ws-grupo1 = '23'.
   when '93' then ws-grupo1 = '24'.
   when '94' then ws-grupo1 = '24'.
   when '95' then ws-grupo1 = '24'.
   when '96' then ws-grupo1 = '24'.
   when '97' then ws-grupo1 = '25'.
   when '98' then ws-grupo1 = '25'.
   when '99' then ws-grupo1 = '25'.
   when '00' then ws-grupo1 = '25'.
   end case.

 return 'CoverteJogos_ok'.
 {catch.i}.
end.
{bib00199.i}.
End Procedure.

procedure forma-centena-milhar.
b-1:
do on error undo b-1, leave b-1.

   

   return 'forma-centena-milhar_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.


procedure forma-temporaria.
def var x as int.
b-1:
do on error undo b-1, leave b-1.

   
   do x = 1  to 25:
      find first tmp001
          where tmp001.grupo  = x
          no-error.
      if not avail tmp001 then
      do.
         if x = 1 then 
         do.
            create tmp001.
            assign
               tmp001.grupo       = x
               tmp001.estatistica = ws-est-grupo1
               tmp001.descricao   = 'Avestruz(01)'.
         end.
         if x = 2 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo2
                tmp001.descricao   = 'Aguia(02)'.
                   
         end.   
         if x = 3 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo3
                tmp001.descricao   = 'Burro(03)'.
                   
         end.   
         if x = 4 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo4
                tmp001.descricao   = 'Borboleta(04)'.
                   
         end.   
         if x = 5 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo5
                tmp001.descricao   = 'Cachorro(05)'.
                   
         end.   
         if x = 6 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo6
                tmp001.descricao   = 'Cabra(06)'.
                   
         end.   
         if x = 7 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo7
                tmp001.descricao   = 'Carneiro(07)'.
                   
         end.   
         if x = 8 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo8
                tmp001.descricao   = 'Camelo(08)'.
                   
         end.   
         if x = 09 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo9
                tmp001.descricao   = 'Cobra(09)'.
                   
         end.   
         if x = 10 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo10
                tmp001.descricao   = 'Coelho(10)'.
                   
         end.   
         if x = 11 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo11
                tmp001.descricao   = 'Cavalo(11)'.
                   
         end.   
         if x = 12 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo12
                tmp001.descricao   = 'Elefante(12)'.
                   
         end.   
         if x = 13 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo13
                tmp001.descricao   = 'Galo(13)'.
                   
         end.   
         if x = 14 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo14
                tmp001.descricao   = 'Gato(14)'.
                   
         end.   
         if x = 15 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo15
                tmp001.descricao   = 'Jacare(15)'.
                   
         end.   
         if x = 16 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo16
                tmp001.descricao   = 'Leao(16)'.
                   
         end.   
         if x = 17 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo17
                tmp001.descricao   = 'Macaco(17)'.
                   
         end.   
         if x = 18 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo18
                tmp001.descricao   = 'Porco(18)'.
                   
         end.   
         if x = 19 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo19
                tmp001.descricao   = 'Pavao(19)'.
                   
         end.   
         if x = 20 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo20
                tmp001.descricao   = 'Peru(20)'.
                   
         end.   
         if x = 21 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo21
                tmp001.descricao   = 'Touro(21)'.
                   
         end.   
         if x = 22 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo22
                tmp001.descricao   = 'Tigre(22)'.
                   
         end.   
         if x = 23 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo23
                tmp001.descricao   = 'Urso(23)'.
                   
         end.   
         if x = 24 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo24
                tmp001.descricao   = 'Veado(24)'
                .
                   
         end.   
         if x = 25 then
         do.
            create tmp001.
             assign
                tmp001.grupo       = x
                tmp001.estatistica = ws-est-grupo25
                tmp001.descricao   = 'Vaca(25)'
                .
                
                   
         end.   
      end.      
   end.
   return 'forma-temporaria_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.


procedure editandogrupo.
b-1:
do on error undo b-1, leave b-1.
   
   if length(string(ws-Premio1)) = 4 then
   do.
       ws-Premio1-a = string(ws-Premio1).
   end.
   if length(string(ws-Premio1)) = 3 then
   do.
       ws-Premio1-a = '0' + string(ws-Premio1). 
   end.  
   if length(string(ws-Premio1)) = 2 then
   do.
       ws-Premio1-a = '00' + string(ws-Premio1). 
   end.  
   if length(string(ws-Premio1)) = 1 then
   do.
       ws-Premio1-a = '000' + string(ws-Premio1).
   end.
   return 'editandogrupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.

