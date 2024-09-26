/*---------------------------------COOPERATE-----------------------26/01/2018-+
| Modulo        :                                                             |
| Sub-modulo    :                                                             |
| Programa      : jdb403.p                                                    |
| Funcao        : Relatorio Geral.                                            |
| Desenvolvedor : josimesio pereira                                           |
| Solicitacao   :                                                             |
+----------------------------------------------------------------------------*/
{shared.i}.
{device.w}.
{bib00271.i}. /* add-msg-c |run show-msg | get-ask | run update-askM ...*/
{jdb603.w}.

def var ws-primos                 as log format 'Sim/Nao'.
def var ws-normal                 as char.
def var ws-normal-o               as char format 'x(20)'
                                     extent 7 initial
                                     ['Rel.Geral'
                                     ,'Rel.Geral.Grupo'
                                     ,'Num.Primos'
     ,'Grupo Menos Saiu(Considera Todos Os jogos)'
                                     ,'Grupo Mais Saiu'
                                     ,'Busca.Milhar'
                                     ,'Compara Corujinha/PT'
                                     ].
                                                                          
def var ws-data-ini               as date form '99/99/9999'.
def var ws-data-fin               as date form '99/99/9999'.
def var ws-milhar                 as int form '9999'.

def temp-table tmp001
    field estatistica       as int
    field grupo             as int  
    field descricao         as char
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
   ws-normal-o[1]   form 'x(70)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[2]   form 'x(70)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[3]   form 'x(70)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[4]   form 'x(70)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[5]   form 'x(70)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[6]   form 'x(70)'
   help "Tipo Relatorio"
   skip
   
   with no-labels col 1 row 5 overlay 1 down  title "BANCA DO JOGO".


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
   if ws-normal = 'Busca.milhar' then
   do.
      hide frame t1b.
      hide frame t2.
      hide frame t-1.
      update ws-milhar with frame t1c.
   end.
   hide frame t1c.
   
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
   if ws-normal = 'Busca.milhar' then
   do.
      run Procura-milhar in this-procedure.
   end.
   if ws-normal = 'Rel.Geral' then
   do.
      run relatorio-geral in this-procedure.
   end.   
   if ws-normal = 'Rel.Geral.Grupo' then
   do.
      run estatistica-grupo in this-procedure.
   end.
   if ws-normal = 'Num.Primos' then
   do.
      run numeros-primos in this-procedure. 
   end.
   if ws-normal = 'Grupo Menos Saiu(Considera Todos Os jogos)' then
   do.
      run grupo-menos-saiu in this-procedure.
   end.
   if ws-normal = 'Grupo Mais Saiu'  then
   do.
      run grupo-mais-saiu in this-procedure.
   end.
   {devicef.i}.
   leave.         
end.


Procedure CoverteJogos.
b-1:
do on error undo b-1, leave b-1.
   ws-Premio1 = jdb003.premio1.
   ws-Premio2 = jdb003.premio2.
   ws-Premio3 = jdb003.premio3.
   ws-Premio4 = jdb003.premio4.
   ws-Premio5 = jdb003.premio5.
   
   run editandogrupo in this-procedure.
   
   ws-Premio1-a = trim(substr(String(ws-Premio1-a),003,002)).
   ws-Premio2-a = trim(substr(String(ws-Premio2-a),003,002)).
   ws-Premio3-a = trim(substr(String(ws-Premio3-a),003,002)).
   ws-Premio4-a = trim(substr(String(ws-Premio4-a),003,002)).
   ws-Premio5-a = trim(substr(String(ws-Premio5-a),003,002)).
   
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
   
   case ws-Premio2-a:     
   when '01' then ws-grupo2 = '01'.
   when '02' then ws-grupo2 = '01'.
   when '03' then ws-grupo2 = '01'.
   when '04' then ws-grupo2 = '01'.
   when '05' then ws-grupo2 = '02'.
   when '06' then ws-grupo2 = '02'.
   when '07' then ws-grupo2 = '02'.
   when '08' then ws-grupo2 = '02'.
   when '09' then ws-grupo2 = '03'.
   when '10' then ws-grupo2 = '03'.
   when '11' then ws-grupo2 = '03'.
   when '12' then ws-grupo2 = '03'.
   when '13' then ws-grupo2 = '04'.
   when '14' then ws-grupo2 = '04'.
   when '15' then ws-grupo2 = '04'.
   when '16' then ws-grupo2 = '04'.
   when '17' then ws-grupo2 = '05'.
   when '18' then ws-grupo2 = '05'.
   when '19' then ws-grupo2 = '05'.
   when '20' then ws-grupo2 = '05'.
   when '21' then ws-grupo2 = '06'.
   when '22' then ws-grupo2 = '06'.
   when '23' then ws-grupo2 = '06'.
   when '24' then ws-grupo2 = '06'.
   when '25' then ws-grupo2 = '07'.
   when '26' then ws-grupo2 = '07'.
   when '27' then ws-grupo2 = '07'.
   when '28' then ws-grupo2 = '07'.
   when '29' then ws-grupo2 = '08'.
   when '30' then ws-grupo2 = '08'.
   when '31' then ws-grupo2 = '08'.
   when '32' then ws-grupo2 = '08'.
   when '33' then ws-grupo2 = '09'.
   when '34' then ws-grupo2 = '09'.
   when '35' then ws-grupo2 = '09'.
   when '36' then ws-grupo2 = '09'.
   when '37' then ws-grupo2 = '10'.
   when '38' then ws-grupo2 = '10'.
   when '39' then ws-grupo2 = '10'.
   when '40' then ws-grupo2 = '10'.
   when '41' then ws-grupo2 = '11'.
   when '42' then ws-grupo2 = '11'.
   when '43' then ws-grupo2 = '11'.
   when '44' then ws-grupo2 = '11'.
   when '45' then ws-grupo2 = '12'.
   when '46' then ws-grupo2 = '12'.
   when '47' then ws-grupo2 = '12'.
   when '48' then ws-grupo2 = '12'.
   when '49' then ws-grupo2 = '13'.
   when '50' then ws-grupo2 = '13'.
   when '51' then ws-grupo2 = '13'.
   when '52' then ws-grupo2 = '13'.
   when '53' then ws-grupo2 = '14'.
   when '54' then ws-grupo2 = '14'.
   when '55' then ws-grupo2 = '14'.
   when '56' then ws-grupo2 = '14'.
   when '57' then ws-grupo2 = '15'.
   when '58' then ws-grupo2 = '15'.
   when '59' then ws-grupo2 = '15'.
   when '60' then ws-grupo2 = '15'.
   when '61' then ws-grupo2 = '16'.
   when '62' then ws-grupo2 = '16'.
   when '63' then ws-grupo2 = '16'.
   when '64' then ws-grupo2 = '16'.
   when '65' then ws-grupo2 = '17'.
   when '66' then ws-grupo2 = '17'.
   when '67' then ws-grupo2 = '17'.
   when '68' then ws-grupo2 = '17'.
   when '69' then ws-grupo2 = '18'.
   when '70' then ws-grupo2 = '18'.
   when '71' then ws-grupo2 = '18'.
   when '72' then ws-grupo2 = '18'.
   when '73' then ws-grupo2 = '19'.
   when '74' then ws-grupo2 = '19'.
   when '75' then ws-grupo2 = '19'.
   when '76' then ws-grupo2 = '19'.
   when '77' then ws-grupo2 = '20'.
   when '78' then ws-grupo2 = '20'.
   when '79' then ws-grupo2 = '20'.
   when '80' then ws-grupo2 = '20'.
   when '81' then ws-grupo2 = '21'.
   when '82' then ws-grupo2 = '21'.
   when '83' then ws-grupo2 = '21'.
   when '84' then ws-grupo2 = '21'.
   when '85' then ws-grupo2 = '22'.
   when '86' then ws-grupo2 = '22'.
   when '87' then ws-grupo2 = '22'.
   when '88' then ws-grupo2 = '22'.
   when '89' then ws-grupo2 = '23'.
   when '90' then ws-grupo2 = '23'.
   when '91' then ws-grupo2 = '23'.
   when '92' then ws-grupo2 = '23'.
   when '93' then ws-grupo2 = '24'.
   when '94' then ws-grupo2 = '24'.
   when '95' then ws-grupo2 = '24'.
   when '96' then ws-grupo2 = '24'.
   when '97' then ws-grupo2 = '25'.
   when '98' then ws-grupo2 = '25'.
   when '99' then ws-grupo2 = '25'.
   when '00' then ws-grupo2 = '25'.
   end case.

   case ws-Premio3-a:     
   when '01' then ws-grupo3 = '01'.
   when '02' then ws-grupo3 = '01'.
   when '03' then ws-grupo3 = '01'.
   when '04' then ws-grupo3 = '01'.
   when '05' then ws-grupo3 = '02'.
   when '06' then ws-grupo3 = '02'.
   when '07' then ws-grupo3 = '02'.
   when '08' then ws-grupo3 = '02'.
   when '09' then ws-grupo3 = '03'.
   when '10' then ws-grupo3 = '03'.
   when '11' then ws-grupo3 = '03'.
   when '12' then ws-grupo3 = '03'.
   when '13' then ws-grupo3 = '04'.
   when '14' then ws-grupo3 = '04'.
   when '15' then ws-grupo3 = '04'.
   when '16' then ws-grupo3 = '04'.
   when '17' then ws-grupo3 = '05'.
   when '18' then ws-grupo3 = '05'.
   when '19' then ws-grupo3 = '05'.
   when '20' then ws-grupo3 = '05'.
   when '21' then ws-grupo3 = '06'.
   when '22' then ws-grupo3 = '06'.
   when '23' then ws-grupo3 = '06'.
   when '24' then ws-grupo3 = '06'.
   when '25' then ws-grupo3 = '07'.
   when '26' then ws-grupo3 = '07'.
   when '27' then ws-grupo3 = '07'.
   when '28' then ws-grupo3 = '07'.
   when '29' then ws-grupo3 = '08'.
   when '30' then ws-grupo3 = '08'.
   when '31' then ws-grupo3 = '08'.
   when '32' then ws-grupo3 = '08'.
   when '33' then ws-grupo3 = '09'.
   when '34' then ws-grupo3 = '09'.
   when '35' then ws-grupo3 = '09'.
   when '36' then ws-grupo3 = '09'.
   when '37' then ws-grupo3 = '10'.
   when '38' then ws-grupo3 = '10'.
   when '39' then ws-grupo3 = '10'.
   when '40' then ws-grupo3 = '10'.
   when '41' then ws-grupo3 = '11'.
   when '42' then ws-grupo3 = '11'.
   when '43' then ws-grupo3 = '11'.
   when '44' then ws-grupo3 = '11'.
   when '45' then ws-grupo3 = '12'.
   when '46' then ws-grupo3 = '12'.
   when '47' then ws-grupo3 = '12'.
   when '48' then ws-grupo3 = '12'.
   when '49' then ws-grupo3 = '13'.
   when '50' then ws-grupo3 = '13'.
   when '51' then ws-grupo3 = '13'.
   when '52' then ws-grupo3 = '13'.
   when '53' then ws-grupo3 = '14'.
   when '54' then ws-grupo3 = '14'.
   when '55' then ws-grupo3 = '14'.
   when '56' then ws-grupo3 = '14'.
   when '57' then ws-grupo3 = '15'.
   when '58' then ws-grupo3 = '15'.
   when '59' then ws-grupo3 = '15'.
   when '60' then ws-grupo3 = '15'.
   when '61' then ws-grupo3 = '16'.
   when '62' then ws-grupo3 = '16'.
   when '63' then ws-grupo3 = '16'.
   when '64' then ws-grupo3 = '16'.
   when '65' then ws-grupo3 = '17'.
   when '66' then ws-grupo3 = '17'.
   when '67' then ws-grupo3 = '17'.
   when '68' then ws-grupo3 = '17'.
   when '69' then ws-grupo3 = '18'.
   when '70' then ws-grupo3 = '18'.
   when '71' then ws-grupo3 = '18'.
   when '72' then ws-grupo3 = '18'.
   when '73' then ws-grupo3 = '19'.
   when '74' then ws-grupo3 = '19'.
   when '75' then ws-grupo3 = '19'.
   when '76' then ws-grupo3 = '19'.
   when '77' then ws-grupo3 = '20'.
   when '78' then ws-grupo3 = '20'.
   when '79' then ws-grupo3 = '20'.
   when '80' then ws-grupo3 = '20'.
   when '81' then ws-grupo3 = '21'.
   when '82' then ws-grupo3 = '21'.
   when '83' then ws-grupo3 = '21'.
   when '84' then ws-grupo3 = '21'.
   when '85' then ws-grupo3 = '22'.
   when '86' then ws-grupo3 = '22'.
   when '87' then ws-grupo3 = '22'.
   when '88' then ws-grupo3 = '22'.
   when '89' then ws-grupo3 = '23'.
   when '90' then ws-grupo3 = '23'.
   when '91' then ws-grupo3 = '23'.
   when '92' then ws-grupo3 = '23'.
   when '93' then ws-grupo3 = '24'.
   when '94' then ws-grupo3 = '24'.
   when '95' then ws-grupo3 = '24'.
   when '96' then ws-grupo3 = '24'.
   when '97' then ws-grupo3 = '25'.
   when '98' then ws-grupo3 = '25'.
   when '99' then ws-grupo3 = '25'.
   when '00' then ws-grupo3 = '25'.
   end case.
 
   
   case ws-Premio4-a:
   when '01' then ws-grupo4 = '01'.
   when '02' then ws-grupo4 = '01'.
   when '03' then ws-grupo4 = '01'.
   when '04' then ws-grupo4 = '01'.
   when '05' then ws-grupo4 = '02'.
   when '06' then ws-grupo4 = '02'.
   when '07' then ws-grupo4 = '02'.
   when '08' then ws-grupo4 = '02'.
   when '09' then ws-grupo4 = '03'.
   when '10' then ws-grupo4 = '03'.
   when '11' then ws-grupo4 = '03'.
   when '12' then ws-grupo4 = '03'.
   when '13' then ws-grupo4 = '04'.
   when '14' then ws-grupo4 = '04'.
   when '15' then ws-grupo4 = '04'.
   when '16' then ws-grupo4 = '04'.
   when '17' then ws-grupo4 = '05'.
   when '18' then ws-grupo4 = '05'.
   when '19' then ws-grupo4 = '05'.
   when '20' then ws-grupo4 = '05'.
   when '21' then ws-grupo4 = '06'.
   when '22' then ws-grupo4 = '06'.
   when '23' then ws-grupo4 = '06'.
   when '24' then ws-grupo4 = '06'.
   when '25' then ws-grupo4 = '07'.
   when '26' then ws-grupo4 = '07'.
   when '27' then ws-grupo4 = '07'.
   when '28' then ws-grupo4 = '07'.
   when '29' then ws-grupo4 = '08'.
   when '30' then ws-grupo4 = '08'.
   when '31' then ws-grupo4 = '08'.
   when '32' then ws-grupo4 = '08'.
   when '33' then ws-grupo4 = '09'.
   when '34' then ws-grupo4 = '09'.
   when '35' then ws-grupo4 = '09'.
   when '36' then ws-grupo4 = '09'.
   when '37' then ws-grupo4 = '10'.
   when '38' then ws-grupo4 = '10'.
   when '39' then ws-grupo4 = '10'.
   when '40' then ws-grupo4 = '10'.
   when '41' then ws-grupo4 = '11'.
   when '42' then ws-grupo4 = '11'.
   when '43' then ws-grupo4 = '11'.
   when '44' then ws-grupo4 = '11'.
   when '45' then ws-grupo4 = '12'.
   when '46' then ws-grupo4 = '12'.
   when '47' then ws-grupo4 = '12'.
   when '48' then ws-grupo4 = '12'.
   when '49' then ws-grupo4 = '13'.
   when '50' then ws-grupo4 = '13'.
   when '51' then ws-grupo4 = '13'.
   when '52' then ws-grupo4 = '13'.
   when '53' then ws-grupo4 = '14'.
   when '54' then ws-grupo4 = '14'.
   when '55' then ws-grupo4 = '14'.
   when '56' then ws-grupo4 = '14'.
   when '57' then ws-grupo4 = '15'.
   when '58' then ws-grupo4 = '15'.
   when '59' then ws-grupo4 = '15'.
   when '60' then ws-grupo4 = '15'.
   when '61' then ws-grupo4 = '16'.
   when '62' then ws-grupo4 = '16'.
   when '63' then ws-grupo4 = '16'.
   when '64' then ws-grupo4 = '16'.
   when '65' then ws-grupo4 = '17'.
   when '66' then ws-grupo4 = '17'.
   when '67' then ws-grupo4 = '17'.
   when '68' then ws-grupo4 = '17'.
   when '69' then ws-grupo4 = '18'.
   when '70' then ws-grupo4 = '18'.
   when '71' then ws-grupo4 = '18'.
   when '72' then ws-grupo4 = '18'.
   when '73' then ws-grupo4 = '19'.
   when '74' then ws-grupo4 = '19'.
   when '75' then ws-grupo4 = '19'.
   when '76' then ws-grupo4 = '19'.
   when '77' then ws-grupo4 = '20'.
   when '78' then ws-grupo4 = '20'.
   when '79' then ws-grupo4 = '20'.
   when '80' then ws-grupo4 = '20'.
   when '81' then ws-grupo4 = '21'.
   when '82' then ws-grupo4 = '21'.
   when '83' then ws-grupo4 = '21'.
   when '84' then ws-grupo4 = '21'.
   when '85' then ws-grupo4 = '22'.
   when '86' then ws-grupo4 = '22'.
   when '87' then ws-grupo4 = '22'.
   when '88' then ws-grupo4 = '22'.
   when '89' then ws-grupo4 = '23'.
   when '90' then ws-grupo4 = '23'.
   when '91' then ws-grupo4 = '23'.
   when '92' then ws-grupo4 = '23'.
   when '93' then ws-grupo4 = '24'.
   when '94' then ws-grupo4 = '24'.
   when '95' then ws-grupo4 = '24'.
   when '96' then ws-grupo4 = '24'.
   when '97' then ws-grupo4 = '25'.
   when '98' then ws-grupo4 = '25'.
   when '99' then ws-grupo4 = '25'.
   when '00' then ws-grupo4 = '25'.
   end case.                
 


   case ws-Premio5-a:
   when '01' then ws-grupo5 = '01'.
   when '02' then ws-grupo5 = '01'.
   when '03' then ws-grupo5 = '01'.
   when '04' then ws-grupo5 = '01'.
   when '05' then ws-grupo5 = '02'.
   when '06' then ws-grupo5 = '02'.
   when '07' then ws-grupo5 = '02'.
   when '08' then ws-grupo5 = '02'.
   when '09' then ws-grupo5 = '03'.
   when '10' then ws-grupo5 = '03'.
   when '11' then ws-grupo5 = '03'.
   when '12' then ws-grupo5 = '03'.
   when '13' then ws-grupo5 = '04'.
   when '14' then ws-grupo5 = '04'.
   when '15' then ws-grupo5 = '04'.
   when '16' then ws-grupo5 = '04'.
   when '17' then ws-grupo5 = '05'.
   when '18' then ws-grupo5 = '05'.
   when '19' then ws-grupo5 = '05'.
   when '20' then ws-grupo5 = '05'.
   when '21' then ws-grupo5 = '06'.
   when '22' then ws-grupo5 = '06'.
   when '23' then ws-grupo5 = '06'.
   when '24' then ws-grupo5 = '06'.
   when '25' then ws-grupo5 = '07'.
   when '26' then ws-grupo5 = '07'.
   when '27' then ws-grupo5 = '07'.
   when '28' then ws-grupo5 = '07'.
   when '29' then ws-grupo5 = '08'.
   when '30' then ws-grupo5 = '08'.
   when '31' then ws-grupo5 = '08'.
   when '32' then ws-grupo5 = '08'.
   when '33' then ws-grupo5 = '09'.
   when '34' then ws-grupo5 = '09'.
   when '35' then ws-grupo5 = '09'.
   when '36' then ws-grupo5 = '09'.
   when '37' then ws-grupo5 = '10'.
   when '38' then ws-grupo5 = '10'.
   when '39' then ws-grupo5 = '10'.
   when '40' then ws-grupo5 = '10'.
   when '41' then ws-grupo5 = '11'.
   when '42' then ws-grupo5 = '11'.
   when '43' then ws-grupo5 = '11'.
   when '44' then ws-grupo5 = '11'.
   when '45' then ws-grupo5 = '12'.
   when '46' then ws-grupo5 = '12'.
   when '47' then ws-grupo5 = '12'.
   when '48' then ws-grupo5 = '12'.
   when '49' then ws-grupo5 = '13'.
   when '50' then ws-grupo5 = '13'.
   when '51' then ws-grupo5 = '13'.
   when '52' then ws-grupo5 = '13'.
   when '53' then ws-grupo5 = '14'.
   when '54' then ws-grupo5 = '14'.
   when '55' then ws-grupo5 = '14'.
   when '56' then ws-grupo5 = '14'.
   when '57' then ws-grupo5 = '15'.
   when '58' then ws-grupo5 = '15'.
   when '59' then ws-grupo5 = '15'.
   when '60' then ws-grupo5 = '15'.
   when '61' then ws-grupo5 = '16'.
   when '62' then ws-grupo5 = '16'.
   when '63' then ws-grupo5 = '16'.
   when '64' then ws-grupo5 = '16'.
   when '65' then ws-grupo5 = '17'.
   when '66' then ws-grupo5 = '17'.
   when '67' then ws-grupo5 = '17'.
   when '68' then ws-grupo5 = '17'.
   when '69' then ws-grupo5 = '18'.
   when '70' then ws-grupo5 = '18'.
   when '71' then ws-grupo5 = '18'.
   when '72' then ws-grupo5 = '18'.
   when '73' then ws-grupo5 = '19'.
   when '74' then ws-grupo5 = '19'.
   when '75' then ws-grupo5 = '19'.
   when '76' then ws-grupo5 = '19'.
   when '77' then ws-grupo5 = '20'.
   when '78' then ws-grupo5 = '20'.
   when '79' then ws-grupo5 = '20'.
   when '80' then ws-grupo5 = '20'.
   when '81' then ws-grupo5 = '21'.
   when '82' then ws-grupo5 = '21'.
   when '83' then ws-grupo5 = '21'.
   when '84' then ws-grupo5 = '21'.
   when '85' then ws-grupo5 = '22'.
   when '86' then ws-grupo5 = '22'.
   when '87' then ws-grupo5 = '22'.
   when '88' then ws-grupo5 = '22'.
   when '89' then ws-grupo5 = '23'.
   when '90' then ws-grupo5 = '23'.
   when '91' then ws-grupo5 = '23'.
   when '92' then ws-grupo5 = '23'.
   when '93' then ws-grupo5 = '24'.
   when '94' then ws-grupo5 = '24'.
   when '95' then ws-grupo5 = '24'.
   when '96' then ws-grupo5 = '24'.
   when '97' then ws-grupo5 = '25'.
   when '98' then ws-grupo5 = '25'.
   when '99' then ws-grupo5 = '25'.
   when '00' then ws-grupo5 = '25'.
   end case.

  return 'CoverteJogos_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.


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
   
   
   Case string(ws-grupo2):
   when '01' then ws-descricao2 = 'Avestruz'.
   when '02' then ws-descricao2 = 'Aguia'.
   when '03' then ws-descricao2 = 'Burro'.
   when '04' then ws-descricao2 = 'Borboleta'.
   when '05' then ws-descricao2 = 'Cachorro'.
   when '06' then ws-descricao2 = 'Cabra'.
   when '07' then ws-descricao2 = 'Carneiro'.
   when '08' then ws-descricao2 = 'Camelo'.
   when '09' then ws-descricao2 = 'Cobra'.
   when '10' then ws-descricao2 = 'Coelho'.
   when '11' then ws-descricao2 = 'Cavalo'.
   when '12' then ws-descricao2 = 'Elefante'.
   when '13' then ws-descricao2 = 'Galo'.
   when '14' then ws-descricao2 = 'Gato'.
   when '15' then ws-descricao2 = 'Jacare'.
   when '16' then ws-descricao2 = 'Leao'.
   when '17' then ws-descricao2 = 'Macaco'.
   when '18' then ws-descricao2 = 'Porco'.
   when '19' then ws-descricao2 = 'Pavao'.
   when '20' then ws-descricao2 = 'Peru'.
   when '21' then ws-descricao2 = 'Touro'.
   when '22' then ws-descricao2 = 'Tigre'.
   when '23' then ws-descricao2 = 'Urso'.
   when '24' then ws-descricao2 = 'Veado'.
   when '25' then ws-descricao2 = 'Vaca'.
   end case.
   

   Case string(ws-grupo3):
   when '01' then ws-descricao3 = 'Avestruz'.
   when '02' then ws-descricao3 = 'Aguia'.
   when '03' then ws-descricao3 = 'Burro'.
   when '04' then ws-descricao3 = 'Borboleta'.
   when '05' then ws-descricao3 = 'Cachorro'.
   when '06' then ws-descricao3 = 'Cabra'.
   when '07' then ws-descricao3 = 'Carneiro'.
   when '08' then ws-descricao3 = 'Camelo'.
   when '09' then ws-descricao3 = 'Cobra'.
   when '10' then ws-descricao3 = 'Coelho'.
   when '11' then ws-descricao3 = 'Cavalo'.
   when '12' then ws-descricao3 = 'Elefante'.
   when '13' then ws-descricao3 = 'Galo'.
   when '14' then ws-descricao3 = 'Gato'.
   when '15' then ws-descricao3 = 'Jacare'.
   when '16' then ws-descricao3 = 'Leao'.
   when '17' then ws-descricao3 = 'Macaco'.
   when '18' then ws-descricao3 = 'Porco'.
   when '19' then ws-descricao3 = 'Pavao'.
   when '20' then ws-descricao3 = 'Peru'.
   when '21' then ws-descricao3 = 'Touro'.
   when '22' then ws-descricao3 = 'Tigre'.
   when '23' then ws-descricao3 = 'Urso'.
   when '24' then ws-descricao3 = 'Veado'.
   when '25' then ws-descricao3 = 'Vaca'.
   end case.                  
   

   Case string(ws-grupo4):
   when '01' then ws-descricao4 = 'Avestruz'.
   when '02' then ws-descricao4 = 'Aguia'.
   when '03' then ws-descricao4 = 'Burro'.
   when '04' then ws-descricao4 = 'Borboleta'.
   when '05' then ws-descricao4 = 'Cachorro'.
   when '06' then ws-descricao4 = 'Cabra'.
   when '07' then ws-descricao4 = 'Carneiro'.
   when '08' then ws-descricao4 = 'Camelo'.
   when '09' then ws-descricao4 = 'Cobra'.
   when '10' then ws-descricao4 = 'Coelho'.
   when '11' then ws-descricao4 = 'Cavalo'.
   when '12' then ws-descricao4 = 'Elefante'.
   when '13' then ws-descricao4 = 'Galo'.
   when '14' then ws-descricao4 = 'Gato'.
   when '15' then ws-descricao4 = 'Jacare'.
   when '16' then ws-descricao4 = 'Leao'.
   when '17' then ws-descricao4 = 'Macaco'.
   when '18' then ws-descricao4 = 'Porco'.
   when '19' then ws-descricao4 = 'Pavao'.
   when '20' then ws-descricao4 = 'Peru'.
   when '21' then ws-descricao4 = 'Touro'.
   when '22' then ws-descricao4 = 'Tigre'.
   when '23' then ws-descricao4 = 'Urso'.
   when '24' then ws-descricao4 = 'Veado'.
   when '25' then ws-descricao4 = 'Vaca'.
   end case.
   

   Case string(ws-grupo5):
   when '01' then ws-descricao5 = 'Avestruz'.
   when '02' then ws-descricao5 = 'Aguia'.
   when '03' then ws-descricao5 = 'Burro'.
   when '04' then ws-descricao5 = 'Borboleta'.
   when '05' then ws-descricao5 = 'Cachorro'.
   when '06' then ws-descricao5 = 'Cabra'.
   when '07' then ws-descricao5 = 'Carneiro'.
   when '08' then ws-descricao5 = 'Camelo'.
   when '09' then ws-descricao5 = 'Cobra'.
   when '10' then ws-descricao5 = 'Coelho'.
   when '11' then ws-descricao5 = 'Cavalo'.
   when '12' then ws-descricao5 = 'Elefante'.
   when '13' then ws-descricao5 = 'Galo'.
   when '14' then ws-descricao5 = 'Gato'.
   when '15' then ws-descricao5 = 'Jacare'.
   when '16' then ws-descricao5 = 'Leao'.
   when '17' then ws-descricao5 = 'Macaco'.
   when '18' then ws-descricao5 = 'Porco'.
   when '19' then ws-descricao5 = 'Pavao'.
   when '20' then ws-descricao5 = 'Peru'.
   when '21' then ws-descricao5 = 'Touro'.
   when '22' then ws-descricao5 = 'Tigre'.
   when '23' then ws-descricao5 = 'Urso'.
   when '24' then ws-descricao5 = 'Veado'.
   when '25' then ws-descricao5 = 'Vaca'.
   end case.

   return 'convertegrupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.

procedure limpa-variaveis.
b-1:
do on error undo b-1, leave b-1.

   ws-descricao1 = ''.
   ws-descricao2 = ''.
   ws-descricao3 = ''.
   ws-descricao4 = ''.
   ws-descricao5 = ''.
   ws-grupo1     = ''.
   ws-grupo2     = ''.
   ws-grupo3     = ''.
   ws-grupo4     = ''.
   ws-grupo5     = ''.
   ws-Premio1    = 0.
   ws-Premio1-a  = ''.
   ws-Premio2    = 0 .
   ws-Premio2-a  = ''.
   ws-Premio3    = 0 .
   ws-Premio3-a  = ''.
   ws-Premio4    = 0 .
   ws-Premio4-a  = ''.
   ws-Premio5    = 0 .
   ws-Premio5-a  = ''.
   return 'limpa-variaveis_ok'.
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
    
   
   /***P-2***/
   if length(string(ws-Premio2)) = 4 then
   do.
       ws-Premio2-a = string(ws-Premio2).
   end.
   if length(string(ws-Premio2)) = 3 then
   do.
       ws-Premio2-a = '0' + string(ws-Premio2). 
   end.  
   if length(string(ws-Premio2)) = 2 then
   do.
       ws-Premio2-a = '00' + string(ws-Premio2). 
   end.  
   if length(string(ws-Premio2)) = 1 then
   do.
       ws-Premio2-a = '000' + string(ws-Premio2).
   end.
    
   
   /***P-3***/
   if length(string(ws-Premio3)) = 4 then
   do.
       ws-Premio3-a = string(ws-Premio3).
   end.
   if length(string(ws-Premio3)) = 3 then
   do.
       ws-Premio3-a = '0' + string(ws-Premio3). 
   end.  
   if length(string(ws-Premio3)) = 2 then
   do.
       ws-Premio3-a = '00' + string(ws-Premio3). 
   end.  
   if length(string(ws-Premio3)) = 1 then
   do.
       ws-Premio3-a = '000' + string(ws-Premio3).
   end.
    
   /***P-4****/
   if length(string(ws-Premio4)) = 4 then
   do.
       ws-Premio4-a = string(ws-Premio4).
   end.
   if length(string(ws-Premio4)) = 3 then
   do.
       ws-Premio4-a = '0' + string(ws-Premio4). 
   end.  
   if length(string(ws-Premio4)) = 2 then
   do.
       ws-Premio4-a = '00' + string(ws-Premio4). 
   end.  
   if length(string(ws-Premio4)) = 1 then
   do.
       ws-Premio4-a = '000' + string(ws-Premio4).
   end.
    
   /***P-5***/
   if length(string(ws-Premio5)) = 4 then
   do.
       ws-Premio5-a = string(ws-Premio5).
   end.
   if length(string(ws-Premio5)) = 3 then
   do.
       ws-Premio5-a = '0' + string(ws-Premio5). 
   end.  
   if length(string(ws-Premio5)) = 2 then
   do.
       ws-Premio5-a = '00' + string(ws-Premio5). 
   end.  
   if length(string(ws-Premio5)) = 1 then
   do.
       ws-Premio5-a = '000' + string(ws-Premio5).
   end.
       

   return 'editandogrupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.

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

Procedure relatorio-geral.

b-1:
do on error undo b-1, leave b-1.
   
   
   for each jdb003
       where jdb003.data >= ws-data-ini
         and jdb003.data <= ws-data-fin
      with down frame cab02 centered width 160 no-box:
      ws-grupo1 = ''.
      ws-grupo2 = ''.
      ws-grupo3 = ''.
      ws-grupo4 = ''.
      ws-grupo5 = ''.
      run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
      run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/

      disp
         jdb003.data      column-label 'Data Mvto'
         jdb003.hora      form 'x(20)' column-label 'Hora'
         jdb003.Banca     column-label 'Banca' 
         jdb003.Premio1   column-label '1¤ Premio' 
         ws-descricao1    column-label 'Bicho'
         jdb003.Premio2    column-label '2¤ Premio' 
         ws-descricao2    column-label 'Bicho'
         jdb003.Premio3    column-label '3¤ Premio' 
         ws-descricao3    column-label 'Bicho'
         jdb003.Premio4    column-label '4¤ Premio' 
         ws-descricao4    column-label 'Bicho'
         jdb003.Premio5    column-label '5¤ Premio' 
         ws-descricao5    column-label 'Bicho'
         skip
         .      
        run limpa-variaveis.
   end.
   return 'relatorio-geral_ok'.
end.
{bib00199.i}.
End Procedure.

procedure estatistica-grupo.
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
        
        disp 
           tmp001.descricao    form 'x(15)' column-label 'BICHO'
           tmp001.grupo                     column-label 'GRUPO'
           tmp001.estatistica  column-label 'SAIU N-VEZES'
           skip.
     
     end.
   return 'estatistica-grupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.


Procedure numeros-primos.
b-1:
do on error  undo b-1, leave b-1.
   for each jdb005
       ,
       each jdb003
      where jdb003.premio1 = jdb005.numero
        and jdb003.data   >= ws-data-ini
        and jdb003.data   <= ws-data-fin
       break by jdb003.data.
       
       disp jdb005.numero
            jdb003.data
            .
   end.    
   return 'numeros-primos_ok'.
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

procedure comparar-pt-coruja.
b-1:
do on error undo b-1, leave b-1.

   

   return 'comparar-pt-coruja_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.


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



procedure grupo-mais-saiu.
def var ws-linha     as int.
b-1:
do on error undo b-1, leave b-1.
   for each jdb003
       where jdb003.data   >= ws-data-ini
         and jdb003.data   <= ws-data-fin.
   message "##1111" view-as alert-box.
   run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
   run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
   run contagem-estatisticas-grupo in this-procedure.
   end.
   run forma-temporaria in this-procedure.
   for each tmp001
       break by tmp001.estatistica desc.
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

procedure Procura-milhar.

b-1:
do on error undo b-1, leave b-1.
   for each jdb003
       where jdb003.premio1 = ws-milhar.
   
      disp
          jdb003.premio1
          jdb003.data.

   end.
   return 'Procura-milhar_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.






