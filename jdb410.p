{shared.i}.
{jdb409.w}.

def var ws-aviso as char.


Function vergrupo returns char (input ws-verifica as char).
   case ws-verifica:
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
   return ws-grupo1.
END.


Function nomebicho returns char (input ws-nomebicho as char).

   Case ws-nomebicho:
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
   return  ws-descricao1.
END.
   


def frame t1
    ws-escolhido form '9999'
    label 'Escolha a Milhar...'
    skip
    ws-milhar form '9999'
    label 'Milhar que saiu....'
    skip
    
    ws-valor    form 'zzz9.99'
    label 'Valor Aposta R$....'
    skip
    
    ws-premio  form 'zz99.99'
    label 'Premio a receber R$'
    skip

    'MILHAR INVERTIDA:'
    '                     |APOSTA DA MAQUINA:'
    skip
    'Linha 1:' 
    ws-minvert1 form 'x(04)'
    no-label
    ws-minvert2 form 'x(04)'
    no-label
    ws-minvert3 form 'x(04)'
    no-label
    ws-minvert4 form 'x(04)'
    no-label
    ws-minvert5 form 'x(04)'
    no-label
    ws-minvert6 form 'x(04)'
    no-label
    '|Linha1:'
    ws-combinvt1 form '9999' no-label 
    ws-combinvt2 form '9999' no-label
    ws-combinvt3 form '9999' no-label
    ws-combinvt4 form '9999' no-label
    ws-combinvt5 form '9999' no-label
    ws-combinvt6 form '9999' no-label
    skip

    'Linha 2:' 
    ws-minvert7 form 'x(04)'
    no-label
    ws-minvert8 form 'x(04)'
    no-label
    ws-minvert9 form 'x(04)'
    no-label
    ws-minvert10 form 'x(04)'
    no-label
    ws-minvert11 form 'x(04)'
    no-label
    ws-minvert12 form 'x(04)'
    no-label
    '|Linha2:'
    ws-combinvt7 form '9999' no-label
    ws-combinvt8 form '9999' no-label
    ws-combinvt9 form '9999' no-label
    ws-combinvt10 form '9999' no-label
    ws-combinvt11 form '9999' no-label
    ws-combinvt12 form '9999' no-label
    skip
    
    'Linha 3:' 
    ws-minvert13 form 'x(04)'
    no-label
    ws-minvert14 form 'x(04)'
    no-label
    ws-minvert15 form 'x(04)'
    no-label
    ws-minvert16 form 'x(04)'
    no-label
    ws-minvert17 form 'x(04)'
    no-label
    ws-minvert18 form 'x(04)'
    no-label
    '|Linha3:'
    ws-combinvt13 form '9999' no-label
    ws-combinvt14 form '9999' no-label
    ws-combinvt15 form '9999' no-label
    ws-combinvt16 form '9999' no-label
    ws-combinvt17 form '9999' no-label
    ws-combinvt18 form '9999' no-label
    

    skip
    
    'Linha 4:' 
    ws-minvert19 form 'x(04)'
    no-label
    ws-minvert20 form 'x(04)'
    no-label
    ws-minvert21 form 'x(04)'
    no-label
    ws-minvert22 form 'x(04)'
    no-label
    ws-minvert23 form 'x(04)'
    no-label
    ws-minvert24 form 'x(04)'
    no-label
    '|Linha4:'
    ws-combinvt19 form '9999' no-label
    ws-combinvt20 form '9999' no-label
    ws-combinvt21 form '9999' no-label
    ws-combinvt22 form '9999' no-label
    ws-combinvt23 form '9999' no-label
    ws-combinvt24 form '9999' no-label
    skip

    skip
    ws-aviso no-label view-as editor size 60 by 5
    with 1 down centered row 01 side-labels overlay width 79
    title 'ESCOLHA O MILHAR PARA COMBINAR'.
    
b-X:
repeat
   with frame t1
   on error  undo b-X, leave b-X
   on endkey undo b-X, leave b-X .
   
   ws-aviso = 
    'GGGGG    AAAAA  NN   N  H   H  OOOOO  U   U   !  !'  + chr(10) +
    'G        A   A  N N  N  H   H  O   O  U   U   !  !'  + chr(10) +
    'G  GGG   AAAAA  N  N N  HHHHH  O   O  U   U   !  !'  + chr(10) +
    'G    G   A   A  N   NN  H   H  O   O  U   U   !  !'  + chr(10) +
    'GGGGGG   A   a  N    N  H   H  OOOOO  UUUUU   o  o'  + chr(10).
   
   
   update ws-escolhido
          ws-milhar
          ws-valor.      
   
   ws-premio = ws-valor * 10.42.
   disp ws-premio.
   
   ws-num1 = substring(string(ws-escolhido,'9999'),1,1).
   ws-num2 = substring(string(ws-escolhido,'9999'),2,1).
   ws-num3 = substring(string(ws-escolhido,'9999'),3,1).
   ws-num4 = substring(string(ws-escolhido,'9999'),4,1).

        
   
   
   
   ws-minvert1 = ws-num1 + ws-num2 + ws-num3 + ws-num4.
   if ws-milhar = ws-minvert1 then
   do.
      disp ws-aviso.
      ws-aviso = ''.
   end.
   
   
   ws-minvert2 = ws-num1 + ws-num2 + ws-num4 + ws-num3.
   ws-minvert3 = ws-num1 + ws-num4 + ws-num3 + ws-num2.
   ws-minvert4 = ws-num1 + ws-num4 + ws-num2 + ws-num3.
   ws-minvert5 = ws-num1 + ws-num3 + ws-num2 + ws-num4.
   ws-minvert6 = ws-num1 + ws-num3 + ws-num4 + ws-num2.
   
   ws-minvert7  = ws-num2 + ws-num1 + ws-num4 + ws-num3.
   ws-minvert8  = ws-num2 + ws-num1 + ws-num3 + ws-num4.
   ws-minvert9  = ws-num2 + ws-num4 + ws-num3 + ws-num1.
   ws-minvert10 = ws-num2 + ws-num4 + ws-num1 + ws-num3.
   ws-minvert11 = ws-num2 + ws-num3 + ws-num4 + ws-num1.
   ws-minvert12 = ws-num2 + ws-num3 + ws-num1 + ws-num4.
   
   ws-minvert13 = ws-num3 + ws-num2 + ws-num1 + ws-num4.
   ws-minvert14 = ws-num3 + ws-num2 + ws-num4 + ws-num1.
   ws-minvert15 = ws-num3 + ws-num1 + ws-num2 + ws-num4.
   ws-minvert16 = ws-num3 + ws-num1 + ws-num4 + ws-num2.
   ws-minvert17 = ws-num3 + ws-num4 + ws-num1 + ws-num4.
   ws-minvert18 = ws-num3 + ws-num4 + ws-num4 + ws-num1.
   
   ws-minvert19 = ws-num4 + ws-num2 + ws-num1 + ws-num3.
   ws-minvert20 = ws-num4 + ws-num2 + ws-num3 + ws-num1.
   ws-minvert21 = ws-num4 + ws-num1 + ws-num2 + ws-num3.
   ws-minvert22 = ws-num4 + ws-num1 + ws-num3 + ws-num2.
   ws-minvert23 = ws-num4 + ws-num3 + ws-num1 + ws-num2.
   ws-minvert24 = ws-num4 + ws-num3 + ws-num2 + ws-num1.
   do x = 0 to 9:
   if ws-num1 <> string(x) and 
      ws-num2 <> string(x) and
      ws-num3 <> string(x) and
      ws-num4 <> string(x) then
   do.
      aposta1 = string(x).
      do x = 0 to 9:
      if ws-num1 <> string(x) and
         ws-num2 <> string(x) and
         ws-num3 <> string(x) and
         ws-num4 <> string(x) and
         ws-num1 <> aposta1   and
         ws-num2 <> aposta1   and
         ws-num3 <> aposta1   and
         ws-num4 <> aposta1   and
         aposta1 <> string(x) then
      do.
         aposta2 = string(x).
         do x = 0 to 9:
         if ws-num1 <> string(x) and
            ws-num2 <> string(x) and
            ws-num3 <> string(x) and
            ws-num4 <> string(x) and
            ws-num1 <> aposta1   and
            ws-num2 <> aposta1   and
            ws-num3 <> aposta1   and
            ws-num4 <> aposta1   and
            ws-num1 <> aposta2   and
            ws-num2 <> aposta2   and
            ws-num3 <> aposta2   and
            ws-num4 <> aposta2   and
            aposta1 <> string(x) and
            aposta2 <> string(x) then
         do.
            aposta3 = string(x).
            do x = 0 to 9:
            if ws-num1 <> string(x) and
               ws-num2 <> string(x) and
               ws-num3 <> string(x) and
               ws-num4 <> string(x) and
               ws-num1 <> aposta1   and
               ws-num2 <> aposta1   and
               ws-num3 <> aposta1   and
               ws-num4 <> aposta1   and
               ws-num1 <> aposta2   and
               ws-num2 <> aposta2   and
               ws-num3 <> aposta2   and
               ws-num4 <> aposta2   and
               ws-num1 <> aposta3   and
               ws-num2 <> aposta3   and
               ws-num3 <> aposta3   and
               ws-num4 <> aposta3   and
               aposta1 <> string(x) and
               aposta2 <> string(x) and 
               aposta3 <> string(x) then
            do.
               aposta4 = string(x).
            end.
         end.      
      end.      
   end.
end.
end.
end.
      ws-combinvt1 = aposta1 + aposta2 + aposta3 + aposta4.
      ws-combinvt2 = aposta1 + aposta2 + aposta4 + aposta3.
      ws-combinvt3 = aposta1 + aposta3 + aposta2 + aposta4.
      ws-combinvt4 = aposta1 + aposta3 + aposta4 + aposta2.
      ws-combinvt5 = aposta1 + aposta4 + aposta3 + aposta2.
      ws-combinvt6 = aposta1 + aposta4 + aposta2 + aposta3.
      
      ws-combinvt7  = aposta2 + aposta1 + aposta3 + aposta4.
      ws-combinvt8  = aposta2 + aposta1 + aposta4 + aposta3.
      ws-combinvt9  = aposta2 + aposta3 + aposta1 + aposta4.
      ws-combinvt10 = aposta2 + aposta3 + aposta4 + aposta1.
      ws-combinvt11 = aposta2 + aposta4 + aposta3 + aposta1.
      ws-combinvt12 = aposta2 + aposta4 + aposta1 + aposta3.
      
      ws-combinvt13 = aposta3 + aposta1 + aposta2 + aposta4.
      ws-combinvt14 = aposta3 + aposta1 + aposta4 + aposta2.
      ws-combinvt15 = aposta3 + aposta2 + aposta1 + aposta4.
      ws-combinvt16 = aposta3 + aposta2 + aposta4 + aposta1.
      ws-combinvt17 = aposta3 + aposta4 + aposta2 + aposta1.
      ws-combinvt18 = aposta3 + aposta4 + aposta1 + aposta2.
      
      ws-combinvt19 = aposta4 + aposta1 + aposta3 + aposta2.
      ws-combinvt20 = aposta4 + aposta1 + aposta2 + aposta3.
      ws-combinvt21 = aposta4 + aposta3 + aposta1 + aposta4.
      ws-combinvt22 = aposta4 + aposta3 + aposta2 + aposta1.
      ws-combinvt23 = aposta4 + aposta2 + aposta3 + aposta1.
      ws-combinvt24 = aposta4 + aposta2 + aposta1 + aposta2.
      disp ws-minvert1
           ws-minvert2
           ws-minvert3
           ws-minvert4
           ws-minvert5
           ws-minvert6
           ws-minvert7
           ws-minvert8
           ws-minvert9
           ws-minvert10
           ws-minvert11
           ws-minvert12
           ws-minvert13
           ws-minvert14
           ws-minvert15
           ws-minvert16
           ws-minvert17
           ws-minvert18
           ws-minvert19
           ws-minvert20
           ws-minvert21
           ws-minvert22
           ws-minvert23
           ws-minvert24
           ws-combinvt1
           ws-combinvt2
           ws-combinvt3
           ws-combinvt4
           ws-combinvt5
           ws-combinvt6
           ws-combinvt7 
           ws-combinvt8 
           ws-combinvt9 
           ws-combinvt10
           ws-combinvt11
           ws-combinvt12
           ws-combinvt13
           ws-combinvt14
           ws-combinvt15
           ws-combinvt16
           ws-combinvt17
           ws-combinvt18
           ws-combinvt19
           ws-combinvt20
           ws-combinvt21
           ws-combinvt22
           ws-combinvt23
           ws-combinvt24
           .
   end.
   next.
end.        
