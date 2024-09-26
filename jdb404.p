/*---------------------------------COOPERATE-----------------------22/03/2018-+
| Modulo        :                                                             |
| Sub-modulo    :                                                             |
| Programa      : jdb204.p                                                    |
| Funcao        : Fazer cruz de jogos do bicho                                |
| Solicitacao   :                                                             |
+----------------------------------------------------------------------------*/
{shared.i}.
{device.w}.
{jdb604.w}



def frame t1
   ws-data
   label 'Data da Cruz....'
   with 1 down centered row 05 side-labels overlay width 78
   title 'METODO CRUZ'.
     




b-X:
repeat
   with frame t1
   on error  undo b-X, leave b-X
   on endkey undo b-X, leave b-X .
   update ws-data.
   ws-dia = day(ws-data).
   ws-numero = substring(string(ws-dia,'99'),2,1).
   ws-cal1 = int(ws-numero).

   run Calcula-cruz in this-procedure.
   leave.
end.


procedure Calcula-cruz.
b-1:
do on error undo b-1, leave b-1.
/*   
   --------->     |===================================|
   | 1 | 2  |     |dia              | dia + 3  = RES1 |
   | ------ |     |RES4 + 3 = RES5  | RES1 + 3 = RES2 |
   | 6 | 3  |===> |RES3 + 3 = RES4  | RES2 + 3 = RES3 |
   | ------ |     |===================================|
   | 5 | 4  |
   <---------
*/   
   run limpa-variaveis in this-procedure.
      ws-cal2 = ws-cal1 + 3.
   if ws-cal2 = 10 then
      ws-cal2 = 0.
   if ws-cal2 = 11 then
      ws-cal2 = 1.
   if ws-cal2 = 12 then
      ws-cal2 = 2.
      ws-cal3 = ws-cal2 + 3.
   if ws-cal3 = 10 then
      ws-cal3 = 0.
   if ws-cal3 = 11 then
      ws-cal3 = 1.
   if ws-cal3 = 12 then
      ws-cal3 = 2.

      ws-cal4 = ws-cal3 + 3.
   if ws-cal4 = 10 then
      ws-cal4 = 0.
   if ws-cal4 = 11 then
      ws-cal4 = 1.
   if ws-cal4 = 12 then
      ws-cal4 = 2.
   
      ws-cal5 = ws-cal4 + 3.
   if ws-cal5 = 10 then
      ws-cal5 = 0.
   if ws-cal5 = 11 then
      ws-cal5 = 1.
   if ws-cal5 = 12 then
      ws-cal5 = 2.
   
   ws-milhar1     = string(ws-cal1)
                  + string(ws-cal2)
                  + string(ws-cal3)
                  + string(ws-cal4).
   ws-milhar2     = string(ws-cal2)
                  + string(ws-cal3)
                  + string(ws-cal4)
                  + string(ws-cal5).
   ws-milhar3     = string(ws-cal3)
                  + string(ws-cal4)
                  + string(ws-cal5)
                  + string(ws-cal6).
   ws-milhar4     = string(ws-cal4)
                  + string(ws-cal5)
                  + string(ws-cal6)
                  + string(ws-cal1).
   ws-milhar5     = string(ws-cal5)
                  + string(ws-cal6)
                  + string(ws-cal1)
                  + string(ws-cal2).
   ws-contraria1  = string(ws-cal4)
                  + string(ws-cal3)
                  + string(ws-cal2)
                  + string(ws-cal1).
   ws-contraria2  = string(ws-cal5)
                  + string(ws-cal4)
                  + string(ws-cal3)
                  + string(ws-cal2).
   ws-contraria3  = string(ws-cal6)
                  + string(ws-cal5)
                  + string(ws-cal4)
                  + string(ws-cal3).
   ws-contraria4  = string(ws-cal1)
                  + string(ws-cal6)
                  + string(ws-cal5)
                  + string(ws-cal4).
   ws-contraria5  = string(ws-cal2)
                  + string(ws-cal1)
                  + string(ws-cal6)
                  + string(ws-cal5).
   ws-dezena1     = string(ws-cal1)
                  + string(ws-cal2).
   ws-dezena2     = string(ws-cal2)
                  + string(ws-cal3).
   ws-dezena3     = string(ws-cal3)
                  + string(ws-cal4).
   ws-dezena4     = string(ws-cal4)
                  + string(ws-cal5).
   ws-dezena5     = string(ws-cal5)
                  + string(ws-cal6).
   ws-combinada01 = string(ws-cal1)
                  + string(ws-cal3)
                  + string(ws-cal4)
                  + string(ws-cal5).
   ws-combinada02 = string(ws-cal2)
                  + string(ws-cal6)
                  + string(ws-cal5)
                  + string(ws-cal4).
   ws-combinada03 = string(ws-cal3)
                  + string(ws-cal5)
                  + string(ws-cal6)
                  + string(ws-cal1).
   ws-combinada04 = string(ws-cal6)
                  + string(ws-cal4)
                  + string(ws-cal3)
                  + string(ws-cal2).
    
   ws-combinada05 = string(ws-cal1)
                  + string(ws-cal4)
                  + string(ws-cal5)
                  + string(ws-cal6).
    
   ws-dezenaf1    = string(ws-cal3)
                  + string(ws-cal4).

   ws-dezenaf2    = string(ws-cal4)
                  + string(ws-cal5).
   
   ws-dezenaf3    = string(ws-cal5)
                  + string(ws-cal6).
   
   ws-dezenaf4    = string(ws-cal6)
                  + string(ws-cal1).
    
   ws-dezenaf5    = string(ws-cal1)
                  + string(ws-cal2).

   run achar-grupo in this-procedure.
   
   form header
      'JOGOS PARA:' +  string(ws-data) format 'x(30)' skip
      fill('-',160) format 'x(160)' skip
      'MILHAR' 
      space(02)
      'CRUZ INVERTIDA'
      space(02)
      'MILHAR COMBINADA'
      space(02)
      'Dezena Principal'
      space(02)
      skip
      fill('-',06) format 'x(05)' 
      space(02)
      fill('-',14) format 'x(14)'
      space(02)
      fill('-',16) format 'x(16)'
      space(02)
      fill('-',20) format 'x(20)'
      skip
      with frame colunas no-box page-top width 220.
    
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
   view frame colunas.
   run relatorio1 in this-procedure.
   {devicef.i}.
   return 'Calcula-cruz_ok'.
{catch.i}.                  
end.
{bib00199.i}.
End Procedure.


procedure relatorio1.
def var ws-premio1 as int.
def var ws-data-premio1 as date.
b-1:
do on error undo b-1, leave b-1.
   put  
         ws-milhar1
         ws-contraria1
         space(07)
         ws-combinada01
         space(10)
         ws-dezenaf1
         ws-grupof1  form 'x(15)'
         ws-dezena1
         ws-grupo1 form 'x(15)' 
         skip
         ws-milhar2 
         ws-contraria2
         space(07)
         ws-combinada02
         space(10)
         ws-dezenaf2
         ws-grupof2  form 'x(15)'
         ws-dezena2
         ws-grupo2 form 'x(15)'
         skip
         ws-milhar3 
         ws-contraria3
         space(07)
         ws-combinada03
         space(10)
         ws-dezenaf3
         ws-grupof3  form 'x(15)'
         ws-dezena3
         ws-grupo3 form 'x(15)' 
         skip
         ws-milhar4 
         ws-contraria4
         space(07)
         ws-combinada04
         space(10)
         ws-dezenaf4
         ws-grupof4  form 'x(15)'
         ws-dezena4
         ws-grupo4 form 'x(15)'
         skip
         ws-milhar5 
         ws-contraria5
         space(07)
         ws-combinada05
         space(10)
         ws-dezenaf5
         ws-grupof5  form 'x(15)'
         ws-dezena5 
         ws-grupo5 form 'x(15)'
         skip
         .
   return 'relatorio_ok'.
end.
{bib00199.i}.
End Procedure.


procedure limpa-variaveis.
b-1:
do on error undo b-1, leave b-1.

    ws-cal2        = 0.
    ws-cal3        = 0.
    ws-cal4        = 0.
    ws-cal5        = 0.
    ws-cal6        = 0.
    ws-milhar1     = ''.
    ws-milhar2     = ''.
    ws-milhar3     = ''.
    ws-milhar4     = ''.
    ws-milhar5     = ''.
    ws-milhar6     = ''.
    ws-dezena1     = ''.
    ws-dezena2     = ''.
    ws-dezena3     = ''.
    ws-dezena4     = ''.
    ws-dezena5     = ''.
    ws-dezena6     = ''.
    ws-dezenaf1    = ''.
    ws-dezenaf2    = ''.
    ws-dezenaf3    = ''.
    ws-dezenaf4    = ''.
    ws-dezenaf5    = ''.
    ws-dezenaf6    = ''.
    ws-contraria1  = ''.
    ws-contraria2  = ''.
    ws-contraria3  = ''.
    ws-contraria4  = ''.
    ws-contraria5  = ''.
    ws-contraria6  = ''.
    ws-combinada01 = ''.
    ws-combinada02 = ''.
    ws-combinada03 = ''.
    ws-combinada04 = ''.
    ws-combinada05 = ''.
    ws-combinada06 = ''.
    
    return 'limpa-variaveis_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.

procedure achar-grupo.
b-1:
do on error undo b-1, leave b-1.
   
   case ws-dezenaf1:
   when '01' then ws-grupof1 = '01-Avestruz'.
   when '02' then ws-grupof1 = '01-Avestruz'.
   when '03' then ws-grupof1 = '01-Avestruz'.
   when '04' then ws-grupof1 = '01-Avestruz'.
   when '05' then ws-grupof1 = '02-Aguia'.
   when '06' then ws-grupof1 = '02-Aguia'.
   when '07' then ws-grupof1 = '02-Aguia'.
   when '08' then ws-grupof1 = '02-Aguia'.
   when '09' then ws-grupof1 = '03-Burro'.
   when '10' then ws-grupof1 = '03-Burro'.
   when '11' then ws-grupof1 = '03-Burro'.
   when '12' then ws-grupof1 = '03-Burro'.
   when '13' then ws-grupof1 = '04-Borboleta'.
   when '14' then ws-grupof1 = '04-Borboleta'.
   when '15' then ws-grupof1 = '04-Borboleta'.
   when '16' then ws-grupof1 = '04-Borboleta'.
   when '17' then ws-grupof1 = '05-Cachorro'.
   when '18' then ws-grupof1 = '05-Cachorro'.
   when '19' then ws-grupof1 = '05-Cachorro'.
   when '20' then ws-grupof1 = '05-Cachorro'.
   when '21' then ws-grupof1 = '06-Cabra'.
   when '22' then ws-grupof1 = '06-Cabra'.
   when '23' then ws-grupof1 = '06-Cabra'.
   when '24' then ws-grupof1 = '06-Cabra'.
   when '25' then ws-grupof1 = '07-Carneiro'.
   when '26' then ws-grupof1 = '07-Carneiro'.
   when '27' then ws-grupof1 = '07-Carneiro'.
   when '28' then ws-grupof1 = '07-Carneiro'.
   when '29' then ws-grupof1 = '08-Camelo'.
   when '30' then ws-grupof1 = '08-Camelo'.
   when '31' then ws-grupof1 = '08-Camelo'.
   when '32' then ws-grupof1 = '08-Camelo'.
   when '33' then ws-grupof1 = '09-Cobra'.
   when '34' then ws-grupof1 = '09-Cobra'.
   when '35' then ws-grupof1 = '09-Cobra'.
   when '36' then ws-grupof1 = '09-Cobra'.
   when '37' then ws-grupof1 = '10-Coelho'.
   when '38' then ws-grupof1 = '10-Coelho'.
   when '39' then ws-grupof1 = '10-Coelho'.
   when '40' then ws-grupof1 = '10-Coelho'.
   when '41' then ws-grupof1 = '11-Cavalo'.
   when '42' then ws-grupof1 = '11-Cavalo'.
   when '43' then ws-grupof1 = '11-Cavalo'.
   when '44' then ws-grupof1 = '11-Cavalo'.
   when '45' then ws-grupof1 = '12-Elefante'.
   when '46' then ws-grupof1 = '12-Elefante'.
   when '47' then ws-grupof1 = '12-Elefante'.
   when '48' then ws-grupof1 = '12-Elefante'.
   when '49' then ws-grupof1 = '13-Galo'.
   when '50' then ws-grupof1 = '13-Galo'.
   when '51' then ws-grupof1 = '13-Galo'.
   when '52' then ws-grupof1 = '13-Galo'.
   when '53' then ws-grupof1 = '14-Gato'.
   when '54' then ws-grupof1 = '14-Gato'.
   when '55' then ws-grupof1 = '14-Gato'.
   when '56' then ws-grupof1 = '14-Gato'.
   when '57' then ws-grupof1 = '15-Jacaré'.
   when '58' then ws-grupof1 = '15-Jacaré'.
   when '59' then ws-grupof1 = '15-Jacaré'.
   when '60' then ws-grupof1 = '15-Jacaré'.
   when '61' then ws-grupof1 = '16-Leão'.
   when '62' then ws-grupof1 = '16-Leão'.
   when '63' then ws-grupof1 = '16-Leão'.
   when '64' then ws-grupof1 = '16-Leão'.
   when '65' then ws-grupof1 = '17-Macaco'.
   when '66' then ws-grupof1 = '17-Macaco'.
   when '67' then ws-grupof1 = '17-Macaco'.
   when '68' then ws-grupof1 = '17-Macaco'.
   when '69' then ws-grupof1 = '18-Porco'.
   when '70' then ws-grupof1 = '18-Porco'.
   when '71' then ws-grupof1 = '18-Porco'.
   when '72' then ws-grupof1 = '18-Porco'.
   when '73' then ws-grupof1 = '19-Pavao'.
   when '74' then ws-grupof1 = '19-Pavao'.
   when '75' then ws-grupof1 = '19-Pavao'.
   when '76' then ws-grupof1 = '19-Pavao'.
   when '77' then ws-grupof1 = '20-Peru'.
   when '78' then ws-grupof1 = '20-Peru'.
   when '79' then ws-grupof1 = '20-Peru'.
   when '80' then ws-grupof1 = '20-Peru'.
   when '81' then ws-grupof1 = '21-Touro'.
   when '82' then ws-grupof1 = '21-Touro'.
   when '83' then ws-grupof1 = '21-Touro'.
   when '84' then ws-grupof1 = '21-Touro'.
   when '85' then ws-grupof1 = '22-Tigre'.
   when '86' then ws-grupof1 = '22-Tigre'.
   when '87' then ws-grupof1 = '22-Tigre'.
   when '88' then ws-grupof1 = '22-Tigre'.
   when '89' then ws-grupof1 = '23-Urso'.
   when '90' then ws-grupof1 = '23-Urso'.
   when '91' then ws-grupof1 = '23-Urso'.
   when '92' then ws-grupof1 = '23-Urso'.
   when '93' then ws-grupof1 = '24-Veado'.
   when '94' then ws-grupof1 = '24-Veado'.
   when '95' then ws-grupof1 = '24-Veado'.
   when '96' then ws-grupof1 = '24-Veado'.
   when '97' then ws-grupof1 = '25-Vaca'.
   when '98' then ws-grupof1 = '25-Vaca'.
   when '99' then ws-grupof1 = '25-Vaca'.
   when '00' then ws-grupof1 = '25-Vaca'.
   end case.               
   
   case ws-dezena1:
   when '01' then ws-grupo1 = '01-Avestruz'.
   when '02' then ws-grupo1 = '01-Avestruz'.
   when '03' then ws-grupo1 = '01-Avestruz'.
   when '04' then ws-grupo1 = '01-Avestruz'.
   when '05' then ws-grupo1 = '02-Aguia'.
   when '06' then ws-grupo1 = '02-Aguia'.
   when '07' then ws-grupo1 = '02-Aguia'.
   when '08' then ws-grupo1 = '02-Aguia'.
   when '09' then ws-grupo1 = '03-Burro'.
   when '10' then ws-grupo1 = '03-Burro'.
   when '11' then ws-grupo1 = '03-Burro'.
   when '12' then ws-grupo1 = '03-Burro'.
   when '13' then ws-grupo1 = '04-Borboleta'.
   when '14' then ws-grupo1 = '04-Borboleta'.
   when '15' then ws-grupo1 = '04-Borboleta'.
   when '16' then ws-grupo1 = '04-Borboleta'.
   when '17' then ws-grupo1 = '05-Cachorro'.
   when '18' then ws-grupo1 = '05-Cachorro'.
   when '19' then ws-grupo1 = '05-Cachorro'.
   when '20' then ws-grupo1 = '05-Cachorro'.
   when '21' then ws-grupo1 = '06-Cabra'.
   when '22' then ws-grupo1 = '06-Cabra'.
   when '23' then ws-grupo1 = '06-Cabra'.
   when '24' then ws-grupo1 = '06-Cabra'.
   when '25' then ws-grupo1 = '07-Carneiro'.
   when '26' then ws-grupo1 = '07-Carneiro'.
   when '27' then ws-grupo1 = '07-Carneiro'.
   when '28' then ws-grupo1 = '07-Carneiro'.
   when '29' then ws-grupo1 = '08-Camelo'.
   when '30' then ws-grupo1 = '08-Camelo'.
   when '31' then ws-grupo1 = '08-Camelo'.
   when '32' then ws-grupo1 = '08-Camelo'.
   when '33' then ws-grupo1 = '09-Cobra'.
   when '34' then ws-grupo1 = '09-Cobra'.
   when '35' then ws-grupo1 = '09-Cobra'.
   when '36' then ws-grupo1 = '09-Cobra'.
   when '37' then ws-grupo1 = '10-Coelho'.
   when '38' then ws-grupo1 = '10-Coelho'.
   when '39' then ws-grupo1 = '10-Coelho'.
   when '40' then ws-grupo1 = '10-Coelho'.
   when '41' then ws-grupo1 = '11-Cavalo'.
   when '42' then ws-grupo1 = '11-Cavalo'.
   when '43' then ws-grupo1 = '11-Cavalo'.
   when '44' then ws-grupo1 = '11-Cavalo'.
   when '45' then ws-grupo1 = '12-Elefante'.
   when '46' then ws-grupo1 = '12-Elefante'.
   when '47' then ws-grupo1 = '12-Elefante'.
   when '48' then ws-grupo1 = '12-Elefante'.
   when '49' then ws-grupo1 = '13-Galo'.
   when '50' then ws-grupo1 = '13-Galo'.
   when '51' then ws-grupo1 = '13-Galo'.
   when '52' then ws-grupo1 = '13-Galo'.
   when '53' then ws-grupo1 = '14-Gato'.
   when '54' then ws-grupo1 = '14-Gato'.
   when '55' then ws-grupo1 = '14-Gato'.
   when '56' then ws-grupo1 = '14-Gato'.
   when '57' then ws-grupo1 = '15-Jacaré'.
   when '58' then ws-grupo1 = '15-Jacaré'.
   when '59' then ws-grupo1 = '15-Jacaré'.
   when '60' then ws-grupo1 = '15-Jacaré'.
   when '61' then ws-grupo1 = '16-Leão'.
   when '62' then ws-grupo1 = '16-Leão'.
   when '63' then ws-grupo1 = '16-Leão'.
   when '64' then ws-grupo1 = '16-Leão'.
   when '65' then ws-grupo1 = '17-Macaco'.
   when '66' then ws-grupo1 = '17-Macaco'.
   when '67' then ws-grupo1 = '17-Macaco'.
   when '68' then ws-grupo1 = '17-Macaco'.
   when '69' then ws-grupo1 = '18-Porco'.
   when '70' then ws-grupo1 = '18-Porco'.
   when '71' then ws-grupo1 = '18-Porco'.
   when '72' then ws-grupo1 = '18-Porco'.
   when '73' then ws-grupo1 = '19-Pavao'.
   when '74' then ws-grupo1 = '19-Pavao'.
   when '75' then ws-grupo1 = '19-Pavao'.
   when '76' then ws-grupo1 = '19-Pavao'.
   when '77' then ws-grupo1 = '20-Peru'.
   when '78' then ws-grupo1 = '20-Peru'.
   when '79' then ws-grupo1 = '20-Peru'.
   when '80' then ws-grupo1 = '20-Peru'.
   when '81' then ws-grupo1 = '21-Touro'.
   when '82' then ws-grupo1 = '21-Touro'.
   when '83' then ws-grupo1 = '21-Touro'.
   when '84' then ws-grupo1 = '21-Touro'.
   when '85' then ws-grupo1 = '22-Tigre'.
   when '86' then ws-grupo1 = '22-Tigre'.
   when '87' then ws-grupo1 = '22-Tigre'.
   when '88' then ws-grupo1 = '22-Tigre'.
   when '89' then ws-grupo1 = '23-Urso'.
   when '90' then ws-grupo1 = '23-Urso'.
   when '91' then ws-grupo1 = '23-Urso'.
   when '92' then ws-grupo1 = '23-Urso'.
   when '93' then ws-grupo1 = '24-Veado'.
   when '94' then ws-grupo1 = '24-Veado'.
   when '95' then ws-grupo1 = '24-Veado'.
   when '96' then ws-grupo1 = '24-Veado'.
   when '97' then ws-grupo1 = '25-Vaca'.
   when '98' then ws-grupo1 = '25-Vaca'.
   when '99' then ws-grupo1 = '25-Vaca'.
   when '00' then ws-grupo1 = '25-Vaca'.
   end case.
   
   case ws-dezenaf2:
   when '01' then ws-grupof2 = '01-Avestruz'.
   when '02' then ws-grupof2 = '01-Avestruz'.
   when '03' then ws-grupof2 = '01-Avestruz'.
   when '04' then ws-grupof2 = '01-Avestruz'.
   when '05' then ws-grupof2 = '02-Aguia'.
   when '06' then ws-grupof2 = '02-Aguia'.
   when '07' then ws-grupof2 = '02-Aguia'.
   when '08' then ws-grupof2 = '02-Aguia'.
   when '09' then ws-grupof2 = '03-Burro'.
   when '10' then ws-grupof2 = '03-Burro'.
   when '11' then ws-grupof2 = '03-Burro'.
   when '12' then ws-grupof2 = '03-Burro'.
   when '13' then ws-grupof2 = '04-Borboleta'.
   when '14' then ws-grupof2 = '04-Borboleta'.
   when '15' then ws-grupof2 = '04-Borboleta'.
   when '16' then ws-grupof2 = '04-Borboleta'.
   when '17' then ws-grupof2 = '05-Cachorro'.
   when '18' then ws-grupof2 = '05-Cachorro'.
   when '19' then ws-grupof2 = '05-Cachorro'.
   when '20' then ws-grupof2 = '05-Cachorro'.
   when '21' then ws-grupof2 = '06-Cabra'.
   when '22' then ws-grupof2 = '06-Cabra'.
   when '23' then ws-grupof2 = '06-Cabra'.
   when '24' then ws-grupof2 = '06-Cabra'.
   when '25' then ws-grupof2 = '07-Carneiro'.
   when '26' then ws-grupof2 = '07-Carneiro'.
   when '27' then ws-grupof2 = '07-Carneiro'.
   when '28' then ws-grupof2 = '07-Carneiro'.
   when '29' then ws-grupof2 = '08-Camelo'.
   when '30' then ws-grupof2 = '08-Camelo'.
   when '31' then ws-grupof2 = '08-Camelo'.
   when '32' then ws-grupof2 = '08-Camelo'.
   when '33' then ws-grupof2 = '09-Cobra'.
   when '34' then ws-grupof2 = '09-Cobra'.
   when '35' then ws-grupof2 = '09-Cobra'.
   when '36' then ws-grupof2 = '09-Cobra'.
   when '37' then ws-grupof2 = '10-Coelho'.
   when '38' then ws-grupof2 = '10-Coelho'.
   when '39' then ws-grupof2 = '10-Coelho'.
   when '40' then ws-grupof2 = '10-Coelho'.
   when '41' then ws-grupof2 = '11-Cavalo'.
   when '42' then ws-grupof2 = '11-Cavalo'.
   when '43' then ws-grupof2 = '11-Cavalo'.
   when '44' then ws-grupof2 = '11-Cavalo'.
   when '45' then ws-grupof2 = '12-Elefante'.
   when '46' then ws-grupof2 = '12-Elefante'.
   when '47' then ws-grupof2 = '12-Elefante'.
   when '48' then ws-grupof2 = '12-Elefante'.
   when '49' then ws-grupof2 = '13-Galo'.
   when '50' then ws-grupof2 = '13-Galo'.
   when '51' then ws-grupof2 = '13-Galo'.
   when '52' then ws-grupof2 = '13-Galo'.
   when '53' then ws-grupof2 = '14-Gato'.
   when '54' then ws-grupof2 = '14-Gato'.
   when '55' then ws-grupof2 = '14-Gato'.
   when '56' then ws-grupof2 = '14-Gato'.
   when '57' then ws-grupof2 = '15-Jacaré'.
   when '58' then ws-grupof2 = '15-Jacaré'.
   when '59' then ws-grupof2 = '15-Jacaré'.
   when '60' then ws-grupof2 = '15-Jacaré'.
   when '61' then ws-grupof2 = '16-Leão'.
   when '62' then ws-grupof2 = '16-Leão'.
   when '63' then ws-grupof2 = '16-Leão'.
   when '64' then ws-grupof2 = '16-Leão'.
   when '65' then ws-grupof2 = '17-Macaco'.
   when '66' then ws-grupof2 = '17-Macaco'.
   when '67' then ws-grupof2 = '17-Macaco'.
   when '68' then ws-grupof2 = '17-Macaco'.
   when '69' then ws-grupof2 = '18-Porco'.
   when '70' then ws-grupof2 = '18-Porco'.
   when '71' then ws-grupof2 = '18-Porco'.
   when '72' then ws-grupof2 = '18-Porco'.
   when '73' then ws-grupof2 = '19-Pavao'.
   when '74' then ws-grupof2 = '19-Pavao'.
   when '75' then ws-grupof2 = '19-Pavao'.
   when '76' then ws-grupof2 = '19-Pavao'.
   when '77' then ws-grupof2 = '20-Peru'.
   when '78' then ws-grupof2 = '20-Peru'.
   when '79' then ws-grupof2 = '20-Peru'.
   when '80' then ws-grupof2 = '20-Peru'.
   when '81' then ws-grupof2 = '21-Touro'.
   when '82' then ws-grupof2 = '21-Touro'.
   when '83' then ws-grupof2 = '21-Touro'.
   when '84' then ws-grupof2 = '21-Touro'.
   when '85' then ws-grupof2 = '22-Tigre'.
   when '86' then ws-grupof2 = '22-Tigre'.
   when '87' then ws-grupof2 = '22-Tigre'.
   when '88' then ws-grupof2 = '22-Tigre'.
   when '89' then ws-grupof2 = '23-Urso'.
   when '90' then ws-grupof2 = '23-Urso'.
   when '91' then ws-grupof2 = '23-Urso'.
   when '92' then ws-grupof2 = '23-Urso'.
   when '93' then ws-grupof2 = '24-Veado'.
   when '94' then ws-grupof2 = '24-Veado'.
   when '95' then ws-grupof2 = '24-Veado'.
   when '96' then ws-grupof2 = '24-Veado'.
   when '97' then ws-grupof2 = '25-Vaca'.
   when '98' then ws-grupof2 = '25-Vaca'.
   when '99' then ws-grupof2 = '25-Vaca'.
   when '00' then ws-grupof2 = '25-Vaca'.
   end case.              

   case ws-dezena2:
   when '01' then ws-grupo2 = '01-Avestruz'.
   when '02' then ws-grupo2 = '01-Avestruz'.
   when '03' then ws-grupo2 = '01-Avestruz'.
   when '04' then ws-grupo2 = '01-Avestruz'.
   when '05' then ws-grupo2 = '02-Aguia'.
   when '06' then ws-grupo2 = '02-Aguia'.
   when '07' then ws-grupo2 = '02-Aguia'.
   when '08' then ws-grupo2 = '02-Aguia'.
   when '09' then ws-grupo2 = '03-Burro'.
   when '10' then ws-grupo2 = '03-Burro'.
   when '11' then ws-grupo2 = '03-Burro'.
   when '12' then ws-grupo2 = '03-Burro'.
   when '13' then ws-grupo2 = '04-Borboleta'.
   when '14' then ws-grupo2 = '04-Borboleta'.
   when '15' then ws-grupo2 = '04-Borboleta'.
   when '16' then ws-grupo2 = '04-Borboleta'.
   when '17' then ws-grupo2 = '05-Cachorro'.
   when '18' then ws-grupo2 = '05-Cachorro'.
   when '19' then ws-grupo2 = '05-Cachorro'.
   when '20' then ws-grupo2 = '05-Cachorro'.
   when '21' then ws-grupo2 = '06-Cabra'.
   when '22' then ws-grupo2 = '06-Cabra'.
   when '23' then ws-grupo2 = '06-Cabra'.
   when '24' then ws-grupo2 = '06-Cabra'.
   when '25' then ws-grupo2 = '07-Carneiro'.
   when '26' then ws-grupo2 = '07-Carneiro'.
   when '27' then ws-grupo2 = '07-Carneiro'.
   when '28' then ws-grupo2 = '07-Carneiro'.
   when '29' then ws-grupo2 = '08-Camelo'.
   when '30' then ws-grupo2 = '08-Camelo'.
   when '31' then ws-grupo2 = '08-Camelo'.
   when '32' then ws-grupo2 = '08-Camelo'.
   when '33' then ws-grupo2 = '09-Cobra'.
   when '34' then ws-grupo2 = '09-Cobra'.
   when '35' then ws-grupo2 = '09-Cobra'.
   when '36' then ws-grupo2 = '09-Cobra'.
   when '37' then ws-grupo2 = '10-Coelho'.
   when '38' then ws-grupo2 = '10-Coelho'.
   when '39' then ws-grupo2 = '10-Coelho'.
   when '40' then ws-grupo2 = '10-Coelho'.
   when '41' then ws-grupo2 = '11-Cavalo'.
   when '42' then ws-grupo2 = '11-Cavalo'.
   when '43' then ws-grupo2 = '11-Cavalo'.
   when '44' then ws-grupo2 = '11-Cavalo'.
   when '45' then ws-grupo2 = '12-Elefante'.
   when '46' then ws-grupo2 = '12-Elefante'.
   when '47' then ws-grupo2 = '12-Elefante'.
   when '48' then ws-grupo2 = '12-Elefante'.
   when '49' then ws-grupo2 = '13-Galo'.
   when '50' then ws-grupo2 = '13-Galo'.
   when '51' then ws-grupo2 = '13-Galo'.
   when '52' then ws-grupo2 = '13-Galo'.
   when '53' then ws-grupo2 = '14-Gato'.
   when '54' then ws-grupo2 = '14-Gato'.
   when '55' then ws-grupo2 = '14-Gato'.
   when '56' then ws-grupo2 = '14-Gato'.
   when '57' then ws-grupo2 = '15-Jacaré'.
   when '58' then ws-grupo2 = '15-Jacaré'.
   when '59' then ws-grupo2 = '15-Jacaré'.
   when '60' then ws-grupo2 = '15-Jacaré'.
   when '61' then ws-grupo2 = '16-Leão'.
   when '62' then ws-grupo2 = '16-Leão'.
   when '63' then ws-grupo2 = '16-Leão'.
   when '64' then ws-grupo2 = '16-Leão'.
   when '65' then ws-grupo2 = '17-Macaco'.
   when '66' then ws-grupo2 = '17-Macaco'.
   when '67' then ws-grupo2 = '17-Macaco'.
   when '68' then ws-grupo2 = '17-Macaco'.
   when '69' then ws-grupo2 = '18-Porco'.
   when '70' then ws-grupo2 = '18-Porco'.
   when '71' then ws-grupo2 = '18-Porco'.
   when '72' then ws-grupo2 = '18-Porco'.
   when '73' then ws-grupo2 = '19-Pavao'.
   when '74' then ws-grupo2 = '19-Pavao'.
   when '75' then ws-grupo2 = '19-Pavao'.
   when '76' then ws-grupo2 = '19-Pavao'.
   when '77' then ws-grupo2 = '20-Peru'.
   when '78' then ws-grupo2 = '20-Peru'.
   when '79' then ws-grupo2 = '20-Peru'.
   when '80' then ws-grupo2 = '20-Peru'.
   when '81' then ws-grupo2 = '21-Touro'.
   when '82' then ws-grupo2 = '21-Touro'.
   when '83' then ws-grupo2 = '21-Touro'.
   when '84' then ws-grupo2 = '21-Touro'.
   when '85' then ws-grupo2 = '22-Tigre'.
   when '86' then ws-grupo2 = '22-Tigre'.
   when '87' then ws-grupo2 = '22-Tigre'.
   when '88' then ws-grupo2 = '22-Tigre'.
   when '89' then ws-grupo2 = '23-Urso'.
   when '90' then ws-grupo2 = '23-Urso'.
   when '91' then ws-grupo2 = '23-Urso'.
   when '92' then ws-grupo2 = '23-Urso'.
   when '93' then ws-grupo2 = '24-Veado'.
   when '94' then ws-grupo2 = '24-Veado'.
   when '95' then ws-grupo2 = '24-Veado'.
   when '96' then ws-grupo2 = '24-Veado'.
   when '97' then ws-grupo2 = '25-Vaca'.
   when '98' then ws-grupo2 = '25-Vaca'.
   when '99' then ws-grupo2 = '25-Vaca'.
   when '00' then ws-grupo2 = '25-Vaca'.
   end case.

   case ws-dezenaf3:
   when '01' then ws-grupof3 = '01-Avestruz'.
   when '02' then ws-grupof3 = '01-Avestruz'.
   when '03' then ws-grupof3 = '01-Avestruz'.
   when '04' then ws-grupof3 = '01-Avestruz'.
   when '05' then ws-grupof3 = '02-Aguia'.
   when '06' then ws-grupof3 = '02-Aguia'.
   when '07' then ws-grupof3 = '02-Aguia'.
   when '08' then ws-grupof3 = '02-Aguia'.
   when '09' then ws-grupof3 = '03-Burro'.
   when '10' then ws-grupof3 = '03-Burro'.
   when '11' then ws-grupof3 = '03-Burro'.
   when '12' then ws-grupof3 = '03-Burro'.
   when '13' then ws-grupof3 = '04-Borboleta'.
   when '14' then ws-grupof3 = '04-Borboleta'.
   when '15' then ws-grupof3 = '04-Borboleta'.
   when '16' then ws-grupof3 = '04-Borboleta'.
   when '17' then ws-grupof3 = '05-Cachorro'.
   when '18' then ws-grupof3 = '05-Cachorro'.
   when '19' then ws-grupof3 = '05-Cachorro'.
   when '20' then ws-grupof3 = '05-Cachorro'.
   when '21' then ws-grupof3 = '06-Cabra'.
   when '22' then ws-grupof3 = '06-Cabra'.
   when '23' then ws-grupof3 = '06-Cabra'.
   when '24' then ws-grupof3 = '06-Cabra'.
   when '25' then ws-grupof3 = '07-Carneiro'.
   when '26' then ws-grupof3 = '07-Carneiro'.
   when '27' then ws-grupof3 = '07-Carneiro'.
   when '28' then ws-grupof3 = '07-Carneiro'.
   when '29' then ws-grupof3 = '08-Camelo'.
   when '30' then ws-grupof3 = '08-Camelo'.
   when '31' then ws-grupof3 = '08-Camelo'.
   when '32' then ws-grupof3 = '08-Camelo'.
   when '33' then ws-grupof3 = '09-Cobra'.
   when '34' then ws-grupof3 = '09-Cobra'.
   when '35' then ws-grupof3 = '09-Cobra'.
   when '36' then ws-grupof3 = '09-Cobra'.
   when '37' then ws-grupof3 = '10-Coelho'.
   when '38' then ws-grupof3 = '10-Coelho'.
   when '39' then ws-grupof3 = '10-Coelho'.
   when '40' then ws-grupof3 = '10-Coelho'.
   when '41' then ws-grupof3 = '11-Cavalo'.
   when '42' then ws-grupof3 = '11-Cavalo'.
   when '43' then ws-grupof3 = '11-Cavalo'.
   when '44' then ws-grupof3 = '11-Cavalo'.
   when '45' then ws-grupof3 = '12-Elefante'.
   when '46' then ws-grupof3 = '12-Elefante'.
   when '47' then ws-grupof3 = '12-Elefante'.
   when '48' then ws-grupof3 = '12-Elefante'.
   when '49' then ws-grupof3 = '13-Galo'.
   when '50' then ws-grupof3 = '13-Galo'.
   when '51' then ws-grupof3 = '13-Galo'.
   when '52' then ws-grupof3 = '13-Galo'.
   when '53' then ws-grupof3 = '14-Gato'.
   when '54' then ws-grupof3 = '14-Gato'.
   when '55' then ws-grupof3 = '14-Gato'.
   when '56' then ws-grupof3 = '14-Gato'.
   when '57' then ws-grupof3 = '15-Jacaré'.
   when '58' then ws-grupof3 = '15-Jacaré'.
   when '59' then ws-grupof3 = '15-Jacaré'.
   when '60' then ws-grupof3 = '15-Jacaré'.
   when '61' then ws-grupof3 = '16-Leão'.
   when '62' then ws-grupof3 = '16-Leão'.
   when '63' then ws-grupof3 = '16-Leão'.
   when '64' then ws-grupof3 = '16-Leão'.
   when '65' then ws-grupof3 = '17-Macaco'.
   when '66' then ws-grupof3 = '17-Macaco'.
   when '67' then ws-grupof3 = '17-Macaco'.
   when '68' then ws-grupof3 = '17-Macaco'.
   when '69' then ws-grupof3 = '18-Porco'.
   when '70' then ws-grupof3 = '18-Porco'.
   when '71' then ws-grupof3 = '18-Porco'.
   when '72' then ws-grupof3 = '18-Porco'.
   when '73' then ws-grupof3 = '19-Pavao'.
   when '74' then ws-grupof3 = '19-Pavao'.
   when '75' then ws-grupof3 = '19-Pavao'.
   when '76' then ws-grupof3 = '19-Pavao'.
   when '77' then ws-grupof3 = '20-Peru'.
   when '78' then ws-grupof3 = '20-Peru'.
   when '79' then ws-grupof3 = '20-Peru'.
   when '80' then ws-grupof3 = '20-Peru'.
   when '81' then ws-grupof3 = '21-Touro'.
   when '82' then ws-grupof3 = '21-Touro'.
   when '83' then ws-grupof3 = '21-Touro'.
   when '84' then ws-grupof3 = '21-Touro'.
   when '85' then ws-grupof3 = '22-Tigre'.
   when '86' then ws-grupof3 = '22-Tigre'.
   when '87' then ws-grupof3 = '22-Tigre'.
   when '88' then ws-grupof3 = '22-Tigre'.
   when '89' then ws-grupof3 = '23-Urso'.
   when '90' then ws-grupof3 = '23-Urso'.
   when '91' then ws-grupof3 = '23-Urso'.
   when '92' then ws-grupof3 = '23-Urso'.
   when '93' then ws-grupof3 = '24-Veado'.
   when '94' then ws-grupof3 = '24-Veado'.
   when '95' then ws-grupof3 = '24-Veado'.
   when '96' then ws-grupof3 = '24-Veado'.
   when '97' then ws-grupof3 = '25-Vaca'.
   when '98' then ws-grupof3 = '25-Vaca'.
   when '99' then ws-grupof3 = '25-Vaca'.
   when '00' then ws-grupof3 = '25-Vaca'.
   end case.              
   
   case ws-dezena3:
   when '01' then ws-grupo3 = '01-Avestruz'.
   when '02' then ws-grupo3 = '01-Avestruz'.
   when '03' then ws-grupo3 = '01-Avestruz'.
   when '04' then ws-grupo3 = '01-Avestruz'.
   when '05' then ws-grupo3 = '02-Aguia'.
   when '06' then ws-grupo3 = '02-Aguia'.
   when '07' then ws-grupo3 = '02-Aguia'.
   when '08' then ws-grupo3 = '02-Aguia'.
   when '09' then ws-grupo3 = '03-Burro'.
   when '10' then ws-grupo3 = '03-Burro'.
   when '11' then ws-grupo3 = '03-Burro'.
   when '12' then ws-grupo3 = '03-Burro'.
   when '13' then ws-grupo3 = '04-Borboleta'.
   when '14' then ws-grupo3 = '04-Borboleta'.
   when '15' then ws-grupo3 = '04-Borboleta'.
   when '16' then ws-grupo3 = '04-Borboleta'.
   when '17' then ws-grupo3 = '05-Cachorro'.
   when '18' then ws-grupo3 = '05-Cachorro'.
   when '19' then ws-grupo3 = '05-Cachorro'.
   when '20' then ws-grupo3 = '05-Cachorro'.
   when '21' then ws-grupo3 = '06-Cabra'.
   when '22' then ws-grupo3 = '06-Cabra'.
   when '23' then ws-grupo3 = '06-Cabra'.
   when '24' then ws-grupo3 = '06-Cabra'.
   when '25' then ws-grupo3 = '07-Carneiro'.
   when '26' then ws-grupo3 = '07-Carneiro'.
   when '27' then ws-grupo3 = '07-Carneiro'.
   when '28' then ws-grupo3 = '07-Carneiro'.
   when '29' then ws-grupo3 = '08-Camelo'.
   when '30' then ws-grupo3 = '08-Camelo'.
   when '31' then ws-grupo3 = '08-Camelo'.
   when '32' then ws-grupo3 = '08-Camelo'.
   when '33' then ws-grupo3 = '09-Cobra'.
   when '34' then ws-grupo3 = '09-Cobra'.
   when '35' then ws-grupo3 = '09-Cobra'.
   when '36' then ws-grupo3 = '09-Cobra'.
   when '37' then ws-grupo3 = '10-Coelho'.
   when '38' then ws-grupo3 = '10-Coelho'.
   when '39' then ws-grupo3 = '10-Coelho'.
   when '40' then ws-grupo3 = '10-Coelho'.
   when '41' then ws-grupo3 = '11-Cavalo'.
   when '42' then ws-grupo3 = '11-Cavalo'.
   when '43' then ws-grupo3 = '11-Cavalo'.
   when '44' then ws-grupo3 = '11-Cavalo'.
   when '45' then ws-grupo3 = '12-Elefante'.
   when '46' then ws-grupo3 = '12-Elefante'.
   when '47' then ws-grupo3 = '12-Elefante'.
   when '48' then ws-grupo3 = '12-Elefante'.
   when '49' then ws-grupo3 = '13-Galo'.
   when '50' then ws-grupo3 = '13-Galo'.
   when '51' then ws-grupo3 = '13-Galo'.
   when '52' then ws-grupo3 = '13-Galo'.
   when '53' then ws-grupo3 = '14-Gato'.
   when '54' then ws-grupo3 = '14-Gato'.
   when '55' then ws-grupo3 = '14-Gato'.
   when '56' then ws-grupo3 = '14-Gato'.
   when '57' then ws-grupo3 = '15-Jacaré'.
   when '58' then ws-grupo3 = '15-Jacaré'.
   when '59' then ws-grupo3 = '15-Jacaré'.
   when '60' then ws-grupo3 = '15-Jacaré'.
   when '61' then ws-grupo3 = '16-Leão'.
   when '62' then ws-grupo3 = '16-Leão'.
   when '63' then ws-grupo3 = '16-Leão'.
   when '64' then ws-grupo3 = '16-Leão'.
   when '65' then ws-grupo3 = '17-Macaco'.
   when '66' then ws-grupo3 = '17-Macaco'.
   when '67' then ws-grupo3 = '17-Macaco'.
   when '68' then ws-grupo3 = '17-Macaco'.
   when '69' then ws-grupo3 = '18-Porco'.
   when '70' then ws-grupo3 = '18-Porco'.
   when '71' then ws-grupo3 = '18-Porco'.
   when '72' then ws-grupo3 = '18-Porco'.
   when '73' then ws-grupo3 = '19-Pavao'.
   when '74' then ws-grupo3 = '19-Pavao'.
   when '75' then ws-grupo3 = '19-Pavao'.
   when '76' then ws-grupo3 = '19-Pavao'.
   when '77' then ws-grupo3 = '20-Peru'.
   when '78' then ws-grupo3 = '20-Peru'.
   when '79' then ws-grupo3 = '20-Peru'.
   when '80' then ws-grupo3 = '20-Peru'.
   when '81' then ws-grupo3 = '21-Touro'.
   when '82' then ws-grupo3 = '21-Touro'.
   when '83' then ws-grupo3 = '21-Touro'.
   when '84' then ws-grupo3 = '21-Touro'.
   when '85' then ws-grupo3 = '22-Tigre'.
   when '86' then ws-grupo3 = '22-Tigre'.
   when '87' then ws-grupo3 = '22-Tigre'.
   when '88' then ws-grupo3 = '22-Tigre'.
   when '89' then ws-grupo3 = '23-Urso'.
   when '90' then ws-grupo3 = '23-Urso'.
   when '91' then ws-grupo3 = '23-Urso'.
   when '92' then ws-grupo3 = '23-Urso'.
   when '93' then ws-grupo3 = '24-Veado'.
   when '94' then ws-grupo3 = '24-Veado'.
   when '95' then ws-grupo3 = '24-Veado'.
   when '96' then ws-grupo3 = '24-Veado'.
   when '97' then ws-grupo3 = '25-Vaca'.
   when '98' then ws-grupo3 = '25-Vaca'.
   when '99' then ws-grupo3 = '25-Vaca'.
   when '00' then ws-grupo3 = '25-Vaca'.
   end case.
   
   case ws-dezenaf4:
   when '01' then ws-grupof4 = '01-Avestruz'.
   when '02' then ws-grupof4 = '01-Avestruz'.
   when '03' then ws-grupof4 = '01-Avestruz'.
   when '04' then ws-grupof4 = '01-Avestruz'.
   when '05' then ws-grupof4 = '02-Aguia'.
   when '06' then ws-grupof4 = '02-Aguia'.
   when '07' then ws-grupof4 = '02-Aguia'.
   when '08' then ws-grupof4 = '02-Aguia'.
   when '09' then ws-grupof4 = '03-Burro'.
   when '10' then ws-grupof4 = '03-Burro'.
   when '11' then ws-grupof4 = '03-Burro'.
   when '12' then ws-grupof4 = '03-Burro'.
   when '13' then ws-grupof4 = '04-Borboleta'.
   when '14' then ws-grupof4 = '04-Borboleta'.
   when '15' then ws-grupof4 = '04-Borboleta'.
   when '16' then ws-grupof4 = '04-Borboleta'.
   when '17' then ws-grupof4 = '05-Cachorro'.
   when '18' then ws-grupof4 = '05-Cachorro'.
   when '19' then ws-grupof4 = '05-Cachorro'.
   when '20' then ws-grupof4 = '05-Cachorro'.
   when '21' then ws-grupof4 = '06-Cabra'.
   when '22' then ws-grupof4 = '06-Cabra'.
   when '23' then ws-grupof4 = '06-Cabra'.
   when '24' then ws-grupof4 = '06-Cabra'.
   when '25' then ws-grupof4 = '07-Carneiro'.
   when '26' then ws-grupof4 = '07-Carneiro'.
   when '27' then ws-grupof4 = '07-Carneiro'.
   when '28' then ws-grupof4 = '07-Carneiro'.
   when '29' then ws-grupof4 = '08-Camelo'.
   when '30' then ws-grupof4 = '08-Camelo'.
   when '31' then ws-grupof4 = '08-Camelo'.
   when '32' then ws-grupof4 = '08-Camelo'.
   when '33' then ws-grupof4 = '09-Cobra'.
   when '34' then ws-grupof4 = '09-Cobra'.
   when '35' then ws-grupof4 = '09-Cobra'.
   when '36' then ws-grupof4 = '09-Cobra'.
   when '37' then ws-grupof4 = '10-Coelho'.
   when '38' then ws-grupof4 = '10-Coelho'.
   when '39' then ws-grupof4 = '10-Coelho'.
   when '40' then ws-grupof4 = '10-Coelho'.
   when '41' then ws-grupof4 = '11-Cavalo'.
   when '42' then ws-grupof4 = '11-Cavalo'.
   when '43' then ws-grupof4 = '11-Cavalo'.
   when '44' then ws-grupof4 = '11-Cavalo'.
   when '45' then ws-grupof4 = '12-Elefante'.
   when '46' then ws-grupof4 = '12-Elefante'.
   when '47' then ws-grupof4 = '12-Elefante'.
   when '48' then ws-grupof4 = '12-Elefante'.
   when '49' then ws-grupof4 = '13-Galo'.
   when '50' then ws-grupof4 = '13-Galo'.
   when '51' then ws-grupof4 = '13-Galo'.
   when '52' then ws-grupof4 = '13-Galo'.
   when '53' then ws-grupof4 = '14-Gato'.
   when '54' then ws-grupof4 = '14-Gato'.
   when '55' then ws-grupof4 = '14-Gato'.
   when '56' then ws-grupof4 = '14-Gato'.
   when '57' then ws-grupof4 = '15-Jacaré'.
   when '58' then ws-grupof4 = '15-Jacaré'.
   when '59' then ws-grupof4 = '15-Jacaré'.
   when '60' then ws-grupof4 = '15-Jacaré'.
   when '61' then ws-grupof4 = '16-Leão'.
   when '62' then ws-grupof4 = '16-Leão'.
   when '63' then ws-grupof4 = '16-Leão'.
   when '64' then ws-grupof4 = '16-Leão'.
   when '65' then ws-grupof4 = '17-Macaco'.
   when '66' then ws-grupof4 = '17-Macaco'.
   when '67' then ws-grupof4 = '17-Macaco'.
   when '68' then ws-grupof4 = '17-Macaco'.
   when '69' then ws-grupof4 = '18-Porco'.
   when '70' then ws-grupof4 = '18-Porco'.
   when '71' then ws-grupof4 = '18-Porco'.
   when '72' then ws-grupof4 = '18-Porco'.
   when '73' then ws-grupof4 = '19-Pavao'.
   when '74' then ws-grupof4 = '19-Pavao'.
   when '75' then ws-grupof4 = '19-Pavao'.
   when '76' then ws-grupof4 = '19-Pavao'.
   when '77' then ws-grupof4 = '20-Peru'.
   when '78' then ws-grupof4 = '20-Peru'.
   when '79' then ws-grupof4 = '20-Peru'.
   when '80' then ws-grupof4 = '20-Peru'.
   when '81' then ws-grupof4 = '21-Touro'.
   when '82' then ws-grupof4 = '21-Touro'.
   when '83' then ws-grupof4 = '21-Touro'.
   when '84' then ws-grupof4 = '21-Touro'.
   when '85' then ws-grupof4 = '22-Tigre'.
   when '86' then ws-grupof4 = '22-Tigre'.
   when '87' then ws-grupof4 = '22-Tigre'.
   when '88' then ws-grupof4 = '22-Tigre'.
   when '89' then ws-grupof4 = '23-Urso'.
   when '90' then ws-grupof4 = '23-Urso'.
   when '91' then ws-grupof4 = '23-Urso'.
   when '92' then ws-grupof4 = '23-Urso'.
   when '93' then ws-grupof4 = '24-Veado'.
   when '94' then ws-grupof4 = '24-Veado'.
   when '95' then ws-grupof4 = '24-Veado'.
   when '96' then ws-grupof4 = '24-Veado'.
   when '97' then ws-grupof4 = '25-Vaca'.
   when '98' then ws-grupof4 = '25-Vaca'.
   when '99' then ws-grupof4 = '25-Vaca'.
   when '00' then ws-grupof4 = '25-Vaca'.
   end case.

   case ws-dezena4:
   when '01' then ws-grupo4 = '01-Avestruz'.
   when '02' then ws-grupo4 = '01-Avestruz'.
   when '03' then ws-grupo4 = '01-Avestruz'.
   when '04' then ws-grupo4 = '01-Avestruz'.
   when '05' then ws-grupo4 = '02-Aguia'.
   when '06' then ws-grupo4 = '02-Aguia'.
   when '07' then ws-grupo4 = '02-Aguia'.
   when '08' then ws-grupo4 = '02-Aguia'.
   when '09' then ws-grupo4 = '03-Burro'.
   when '10' then ws-grupo4 = '03-Burro'.
   when '11' then ws-grupo4 = '03-Burro'.
   when '12' then ws-grupo4 = '03-Burro'.
   when '13' then ws-grupo4 = '04-Borboleta'.
   when '14' then ws-grupo4 = '04-Borboleta'.
   when '15' then ws-grupo4 = '04-Borboleta'.
   when '16' then ws-grupo4 = '04-Borboleta'.
   when '17' then ws-grupo4 = '05-Cachorro'.
   when '18' then ws-grupo4 = '05-Cachorro'.
   when '19' then ws-grupo4 = '05-Cachorro'.
   when '20' then ws-grupo4 = '05-Cachorro'.
   when '21' then ws-grupo4 = '06-Cabra'.
   when '22' then ws-grupo4 = '06-Cabra'.
   when '23' then ws-grupo4 = '06-Cabra'.
   when '24' then ws-grupo4 = '06-Cabra'.
   when '25' then ws-grupo4 = '07-Carneiro'.
   when '26' then ws-grupo4 = '07-Carneiro'.
   when '27' then ws-grupo4 = '07-Carneiro'.
   when '28' then ws-grupo4 = '07-Carneiro'.
   when '29' then ws-grupo4 = '08-Camelo'.
   when '30' then ws-grupo4 = '08-Camelo'.
   when '31' then ws-grupo4 = '08-Camelo'.
   when '32' then ws-grupo4 = '08-Camelo'.
   when '33' then ws-grupo4 = '09-Cobra'.
   when '34' then ws-grupo4 = '09-Cobra'.
   when '35' then ws-grupo4 = '09-Cobra'.
   when '36' then ws-grupo4 = '09-Cobra'.
   when '37' then ws-grupo4 = '10-Coelho'.
   when '38' then ws-grupo4 = '10-Coelho'.
   when '39' then ws-grupo4 = '10-Coelho'.
   when '40' then ws-grupo4 = '10-Coelho'.
   when '41' then ws-grupo4 = '11-Cavalo'.
   when '42' then ws-grupo4 = '11-Cavalo'.
   when '43' then ws-grupo4 = '11-Cavalo'.
   when '44' then ws-grupo4 = '11-Cavalo'.
   when '45' then ws-grupo4 = '12-Elefante'.
   when '46' then ws-grupo4 = '12-Elefante'.
   when '47' then ws-grupo4 = '12-Elefante'.
   when '48' then ws-grupo4 = '12-Elefante'.
   when '49' then ws-grupo4 = '13-Galo'.
   when '50' then ws-grupo4 = '13-Galo'.
   when '51' then ws-grupo4 = '13-Galo'.
   when '52' then ws-grupo4 = '13-Galo'.
   when '53' then ws-grupo4 = '14-Gato'.
   when '54' then ws-grupo4 = '14-Gato'.
   when '55' then ws-grupo4 = '14-Gato'.
   when '56' then ws-grupo4 = '14-Gato'.
   when '57' then ws-grupo4 = '15-Jacaré'.
   when '58' then ws-grupo4 = '15-Jacaré'.
   when '59' then ws-grupo4 = '15-Jacaré'.
   when '60' then ws-grupo4 = '15-Jacaré'.
   when '61' then ws-grupo4 = '16-Leão'.
   when '62' then ws-grupo4 = '16-Leão'.
   when '63' then ws-grupo4 = '16-Leão'.
   when '64' then ws-grupo4 = '16-Leão'.
   when '65' then ws-grupo4 = '17-Macaco'.
   when '66' then ws-grupo4 = '17-Macaco'.
   when '67' then ws-grupo4 = '17-Macaco'.
   when '68' then ws-grupo4 = '17-Macaco'.
   when '69' then ws-grupo4 = '18-Porco'.
   when '70' then ws-grupo4 = '18-Porco'.
   when '71' then ws-grupo4 = '18-Porco'.
   when '72' then ws-grupo4 = '18-Porco'.
   when '73' then ws-grupo4 = '19-Pavao'.
   when '74' then ws-grupo4 = '19-Pavao'.
   when '75' then ws-grupo4 = '19-Pavao'.
   when '76' then ws-grupo4 = '19-Pavao'.
   when '77' then ws-grupo4 = '20-Peru'.
   when '78' then ws-grupo4 = '20-Peru'.
   when '79' then ws-grupo4 = '20-Peru'.
   when '80' then ws-grupo4 = '20-Peru'.
   when '81' then ws-grupo4 = '21-Touro'.
   when '82' then ws-grupo4 = '21-Touro'.
   when '83' then ws-grupo4 = '21-Touro'.
   when '84' then ws-grupo4 = '21-Touro'.
   when '85' then ws-grupo4 = '22-Tigre'.
   when '86' then ws-grupo4 = '22-Tigre'.
   when '87' then ws-grupo4 = '22-Tigre'.
   when '88' then ws-grupo4 = '22-Tigre'.
   when '89' then ws-grupo4 = '23-Urso'.
   when '90' then ws-grupo4 = '23-Urso'.
   when '91' then ws-grupo4 = '23-Urso'.
   when '92' then ws-grupo4 = '23-Urso'.
   when '93' then ws-grupo4 = '24-Veado'.
   when '94' then ws-grupo4 = '24-Veado'.
   when '95' then ws-grupo4 = '24-Veado'.
   when '96' then ws-grupo4 = '24-Veado'.
   when '97' then ws-grupo4 = '25-Vaca'.
   when '98' then ws-grupo4 = '25-Vaca'.
   when '99' then ws-grupo4 = '25-Vaca'.
   when '00' then ws-grupo4 = '25-Vaca'.
   end case.

   case ws-dezenaf5:      
   when '01' then ws-grupof5 = '01-Avestruz'.
   when '02' then ws-grupof5 = '01-Avestruz'.
   when '03' then ws-grupof5 = '01-Avestruz'.
   when '04' then ws-grupof5 = '01-Avestruz'.
   when '05' then ws-grupof5 = '02-Aguia'.
   when '06' then ws-grupof5 = '02-Aguia'.
   when '07' then ws-grupof5 = '02-Aguia'.
   when '08' then ws-grupof5 = '02-Aguia'.
   when '09' then ws-grupof5 = '03-Burro'.
   when '10' then ws-grupof5 = '03-Burro'.
   when '11' then ws-grupof5 = '03-Burro'.
   when '12' then ws-grupof5 = '03-Burro'.
   when '13' then ws-grupof5 = '04-Borboleta'.
   when '14' then ws-grupof5 = '04-Borboleta'.
   when '15' then ws-grupof5 = '04-Borboleta'.
   when '16' then ws-grupof5 = '04-Borboleta'.
   when '17' then ws-grupof5 = '05-Cachorro'.
   when '18' then ws-grupof5 = '05-Cachorro'.
   when '19' then ws-grupof5 = '05-Cachorro'.
   when '20' then ws-grupof5 = '05-Cachorro'.
   when '21' then ws-grupof5 = '06-Cabra'.
   when '22' then ws-grupof5 = '06-Cabra'.
   when '23' then ws-grupof5 = '06-Cabra'.
   when '24' then ws-grupof5 = '06-Cabra'.
   when '25' then ws-grupof5 = '07-Carneiro'.
   when '26' then ws-grupof5 = '07-Carneiro'.
   when '27' then ws-grupof5 = '07-Carneiro'.
   when '28' then ws-grupof5 = '07-Carneiro'.
   when '29' then ws-grupof5 = '08-Camelo'.
   when '30' then ws-grupof5 = '08-Camelo'.
   when '31' then ws-grupof5 = '08-Camelo'.
   when '32' then ws-grupof5 = '08-Camelo'.
   when '33' then ws-grupof5 = '09-Cobra'.
   when '34' then ws-grupof5 = '09-Cobra'.
   when '35' then ws-grupof5 = '09-Cobra'.
   when '36' then ws-grupof5 = '09-Cobra'.
   when '37' then ws-grupof5 = '10-Coelho'.
   when '38' then ws-grupof5 = '10-Coelho'.
   when '39' then ws-grupof5 = '10-Coelho'.
   when '40' then ws-grupof5 = '10-Coelho'.
   when '41' then ws-grupof5 = '11-Cavalo'.
   when '42' then ws-grupof5 = '11-Cavalo'.
   when '43' then ws-grupof5 = '11-Cavalo'.
   when '44' then ws-grupof5 = '11-Cavalo'.
   when '45' then ws-grupof5 = '12-Elefante'.
   when '46' then ws-grupof5 = '12-Elefante'.
   when '47' then ws-grupof5 = '12-Elefante'.
   when '48' then ws-grupof5 = '12-Elefante'.
   when '49' then ws-grupof5 = '13-Galo'.
   when '50' then ws-grupof5 = '13-Galo'.
   when '51' then ws-grupof5 = '13-Galo'.
   when '52' then ws-grupof5 = '13-Galo'.
   when '53' then ws-grupof5 = '14-Gato'.
   when '54' then ws-grupof5 = '14-Gato'.
   when '55' then ws-grupof5 = '14-Gato'.
   when '56' then ws-grupof5 = '14-Gato'.
   when '57' then ws-grupof5 = '15-Jacaré'.
   when '58' then ws-grupof5 = '15-Jacaré'.
   when '59' then ws-grupof5 = '15-Jacaré'.
   when '60' then ws-grupof5 = '15-Jacaré'.
   when '61' then ws-grupof5 = '16-Leão'.
   when '62' then ws-grupof5 = '16-Leão'.
   when '63' then ws-grupof5 = '16-Leão'.
   when '64' then ws-grupof5 = '16-Leão'.
   when '65' then ws-grupof5 = '17-Macaco'.
   when '66' then ws-grupof5 = '17-Macaco'.
   when '67' then ws-grupof5 = '17-Macaco'.
   when '68' then ws-grupof5 = '17-Macaco'.
   when '69' then ws-grupof5 = '18-Porco'.
   when '70' then ws-grupof5 = '18-Porco'.
   when '71' then ws-grupof5 = '18-Porco'.
   when '72' then ws-grupof5 = '18-Porco'.
   when '73' then ws-grupof5 = '19-Pavao'.
   when '74' then ws-grupof5 = '19-Pavao'.
   when '75' then ws-grupof5 = '19-Pavao'.
   when '76' then ws-grupof5 = '19-Pavao'.
   when '77' then ws-grupof5 = '20-Peru'.
   when '78' then ws-grupof5 = '20-Peru'.
   when '79' then ws-grupof5 = '20-Peru'.
   when '80' then ws-grupof5 = '20-Peru'.
   when '81' then ws-grupof5 = '21-Touro'.
   when '82' then ws-grupof5 = '21-Touro'.
   when '83' then ws-grupof5 = '21-Touro'.
   when '84' then ws-grupof5 = '21-Touro'.
   when '85' then ws-grupof5 = '22-Tigre'.
   when '86' then ws-grupof5 = '22-Tigre'.
   when '87' then ws-grupof5 = '22-Tigre'.
   when '88' then ws-grupof5 = '22-Tigre'.
   when '89' then ws-grupof5 = '23-Urso'.
   when '90' then ws-grupof5 = '23-Urso'.
   when '91' then ws-grupof5 = '23-Urso'.
   when '92' then ws-grupof5 = '23-Urso'.
   when '93' then ws-grupof5 = '24-Veado'.
   when '94' then ws-grupof5 = '24-Veado'.
   when '95' then ws-grupof5 = '24-Veado'.
   when '96' then ws-grupof5 = '24-Veado'.
   when '97' then ws-grupof5 = '25-Vaca'.
   when '98' then ws-grupof5 = '25-Vaca'.
   when '99' then ws-grupof5 = '25-Vaca'.
   when '00' then ws-grupof5 = '25-Vaca'.
   end case.

   case ws-dezena5:
   when '01' then ws-grupo5 = '01-Avestruz'.
   when '02' then ws-grupo5 = '01-Avestruz'.
   when '03' then ws-grupo5 = '01-Avestruz'.
   when '04' then ws-grupo5 = '01-Avestruz'.
   when '05' then ws-grupo5 = '02-Aguia'.
   when '06' then ws-grupo5 = '02-Aguia'.
   when '07' then ws-grupo5 = '02-Aguia'.
   when '08' then ws-grupo5 = '02-Aguia'.
   when '09' then ws-grupo5 = '03-Burro'.
   when '10' then ws-grupo5 = '03-Burro'.
   when '11' then ws-grupo5 = '03-Burro'.
   when '12' then ws-grupo5 = '03-Burro'.
   when '13' then ws-grupo5 = '04-Borboleta'.
   when '14' then ws-grupo5 = '04-Borboleta'.
   when '15' then ws-grupo5 = '04-Borboleta'.
   when '16' then ws-grupo5 = '04-Borboleta'.
   when '17' then ws-grupo5 = '05-Cachorro'.
   when '18' then ws-grupo5 = '05-Cachorro'.
   when '19' then ws-grupo5 = '05-Cachorro'.
   when '20' then ws-grupo5 = '05-Cachorro'.
   when '21' then ws-grupo5 = '06-Cabra'.
   when '22' then ws-grupo5 = '06-Cabra'.
   when '23' then ws-grupo5 = '06-Cabra'.
   when '24' then ws-grupo5 = '06-Cabra'.
   when '25' then ws-grupo5 = '07-Carneiro'.
   when '26' then ws-grupo5 = '07-Carneiro'.
   when '27' then ws-grupo5 = '07-Carneiro'.
   when '28' then ws-grupo5 = '07-Carneiro'.
   when '29' then ws-grupo5 = '08-Camelo'.
   when '30' then ws-grupo5 = '08-Camelo'.
   when '31' then ws-grupo5 = '08-Camelo'.
   when '32' then ws-grupo5 = '08-Camelo'.
   when '33' then ws-grupo5 = '09-Cobra'.
   when '34' then ws-grupo5 = '09-Cobra'.
   when '35' then ws-grupo5 = '09-Cobra'.
   when '36' then ws-grupo5 = '09-Cobra'.
   when '37' then ws-grupo5 = '10-Coelho'.
   when '38' then ws-grupo5 = '10-Coelho'.
   when '39' then ws-grupo5 = '10-Coelho'.
   when '40' then ws-grupo5 = '10-Coelho'.
   when '41' then ws-grupo5 = '11-Cavalo'.
   when '42' then ws-grupo5 = '11-Cavalo'.
   when '43' then ws-grupo5 = '11-Cavalo'.
   when '44' then ws-grupo5 = '11-Cavalo'.
   when '45' then ws-grupo5 = '12-Elefante'.
   when '46' then ws-grupo5 = '12-Elefante'.
   when '47' then ws-grupo5 = '12-Elefante'.
   when '48' then ws-grupo5 = '12-Elefante'.
   when '49' then ws-grupo5 = '13-Galo'.
   when '50' then ws-grupo5 = '13-Galo'.
   when '51' then ws-grupo5 = '13-Galo'.
   when '52' then ws-grupo5 = '13-Galo'.
   when '53' then ws-grupo5 = '14-Gato'.
   when '54' then ws-grupo5 = '14-Gato'.
   when '55' then ws-grupo5 = '14-Gato'.
   when '56' then ws-grupo5 = '14-Gato'.
   when '57' then ws-grupo5 = '15-Jacaré'.
   when '58' then ws-grupo5 = '15-Jacaré'.
   when '59' then ws-grupo5 = '15-Jacaré'.
   when '60' then ws-grupo5 = '15-Jacaré'.
   when '61' then ws-grupo5 = '16-Leão'.
   when '62' then ws-grupo5 = '16-Leão'.
   when '63' then ws-grupo5 = '16-Leão'.
   when '64' then ws-grupo5 = '16-Leão'.
   when '65' then ws-grupo5 = '17-Macaco'.
   when '66' then ws-grupo5 = '17-Macaco'.
   when '67' then ws-grupo5 = '17-Macaco'.
   when '68' then ws-grupo5 = '17-Macaco'.
   when '69' then ws-grupo5 = '18-Porco'.
   when '70' then ws-grupo5 = '18-Porco'.
   when '71' then ws-grupo5 = '18-Porco'.
   when '72' then ws-grupo5 = '18-Porco'.
   when '73' then ws-grupo5 = '19-Pavao'.
   when '74' then ws-grupo5 = '19-Pavao'.
   when '75' then ws-grupo5 = '19-Pavao'.
   when '76' then ws-grupo5 = '19-Pavao'.
   when '77' then ws-grupo5 = '20-Peru'.
   when '78' then ws-grupo5 = '20-Peru'.
   when '79' then ws-grupo5 = '20-Peru'.
   when '80' then ws-grupo5 = '20-Peru'.
   when '81' then ws-grupo5 = '21-Touro'.
   when '82' then ws-grupo5 = '21-Touro'.
   when '83' then ws-grupo5 = '21-Touro'.
   when '84' then ws-grupo5 = '21-Touro'.
   when '85' then ws-grupo5 = '22-Tigre'.
   when '86' then ws-grupo5 = '22-Tigre'.
   when '87' then ws-grupo5 = '22-Tigre'.
   when '88' then ws-grupo5 = '22-Tigre'.
   when '89' then ws-grupo5 = '23-Urso'.
   when '90' then ws-grupo5 = '23-Urso'.
   when '91' then ws-grupo5 = '23-Urso'.
   when '92' then ws-grupo5 = '23-Urso'.
   when '93' then ws-grupo5 = '24-Veado'.
   when '94' then ws-grupo5 = '24-Veado'.
   when '95' then ws-grupo5 = '24-Veado'.
   when '96' then ws-grupo5 = '24-Veado'.
   when '97' then ws-grupo5 = '25-Vaca'.
   when '98' then ws-grupo5 = '25-Vaca'.
   when '99' then ws-grupo5 = '25-Vaca'.
   when '00' then ws-grupo5 = '25-Vaca'.
   end case.

   return 'achar-grupo_ok'.
{catch.i}.
end.
{bib00199.i}.
End Procedure.
