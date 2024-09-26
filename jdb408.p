{shared.i}.
{jdb603.w}.
{device.w}.

def var ws-data-ini                as date form '99/99/9999' no-undo.
def var ws-data-fin                as date form '99/99/9999' no-undo.
def var ws-normal                  as char.
def var ws-normal-o                as char format 'x(20)'
                                      extent 6 initial
                                      ['1 PREMIO'
                                      ,'2 PREMIO'
                                      ,'3 PREMIO'
                                      ,'4 PREMIO'
                                      ,'5 PREMIO'
                                      ,'TODOS'
                                      ].
                                     



def frame t1b
   ws-normal-o[1]   form 'x(16)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[2]   form 'x(16)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[3]   form 'x(16)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[4]
   help "Tipo Relatorio"
   skip
   ws-normal-o[5]   form 'x(16)'
   help "Tipo Relatorio"
   skip
   ws-normal-o[6]   form 'x(16)'
   help "Tipo Relatorio"
   skip
   with no-labels col 25 row 5 overlay 1 down  title "BANCA DO JOGO".




def frame t2
   ws-data-ini
   label 'Data inicial...'
   ws-data-fin
   label 'Data Final.....'
   with no-labels col 25 row 9 overlay 1 down title "DATA DO RELATORIO".



b-principal:
do on error undo b-principal, leave b-principal.
   update ws-data-ini 
          ws-data-fin with frame t2.
          hide frame t2.
   
   disp ws-normal-o with frame t1b.
   do with frame t1b:
      choose field ws-normal-o keys ws-normal.
      ws-normal = frame-value.
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
   if ws-normal = '1 PREMIO' then
   do.
      run relatorio-premio1.
   end.
   if ws-normal = '2 PREMIO' then
   do.
      run relatorio-premio2.
   end.
   if ws-normal = '3 PREMIO' then
   do.
      run relatorio-premio3.
   end.
   if ws-normal = '4 PREMIO' then
   do.
      run relatorio-premio4.
   end.
    
   if ws-normal = '5 PREMIO' then
   do.
      run relatorio-premio5.
   end.
    
   if ws-normal = 'TODOS' then
   do.
      run relatorio-todos.
   end.
   {devicef.i}.
{catch.i}.
end.

procedure relatorio-premio1.
b-1:
do on error undo b-1, leave b-1.
   
   for each jdb003
       where jdb003.data    >= ws-data-ini
         and jdb003.data    <= ws-data-fin
      with width 160 no-box:
      ws-grupo1 = ''.
      ws-grupo2 = ''.
      ws-grupo3 = ''.
      ws-grupo4 = ''.
      ws-grupo5 = ''.
      run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
      run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
      disp
         jdb003.data       column-label 'Data Mvto'
         jdb003.hora       form 'x(20)' column-label 'Hora'
         jdb003.Banca      column-label 'Banca' 
         jdb003.Premio1    column-label '1¤ Premio' 
         ws-descricao1     column-label 'Bicho'
         skip
         .      
   end.
   run limpa-variaveis.
   return 'relatorio-premio1_ok'.
end.
{bib00199.i}.
End Procedure.



procedure relatorio-premio2.
b-1:
do on error undo b-1, leave b-1.
   
   for each jdb003
       where jdb003.data    >= ws-data-ini
         and jdb003.data    <= ws-data-fin
      with width 160 no-box:
      ws-grupo1 = ''.
      ws-grupo2 = ''.
      ws-grupo3 = ''.
      ws-grupo4 = ''.
      ws-grupo5 = ''.
      run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
      run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
      disp
         jdb003.data       column-label 'Data Mvto'
         jdb003.hora       form 'x(20)' column-label 'Hora'
         jdb003.Banca      column-label 'Banca' 
         jdb003.Premio2    column-label '2¤ Premio' 
         ws-descricao2     column-label 'Bicho'
         skip
         .      
   end.
   run limpa-variaveis.
   return 'relatorio-premio2_ok'.
end.
{bib00199.i}.
End Procedure.



procedure relatorio-premio3.
b-1:
do on error undo b-1, leave b-1.
   
   for each jdb003
       where jdb003.data    >= ws-data-ini
         and jdb003.data    <= ws-data-fin
      with width 160 no-box:
      ws-grupo1 = ''.
      ws-grupo2 = ''.
      ws-grupo3 = ''.
      ws-grupo4 = ''.
      ws-grupo5 = ''.
      run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
      run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
      disp
         jdb003.data       column-label 'Data Mvto'
         jdb003.hora       form 'x(20)' column-label 'Hora'
         jdb003.Banca      column-label 'Banca' 
         jdb003.Premio3    column-label '3¤ Premio' 
         ws-descricao3     column-label 'Bicho'
         skip
         .      
   end.
   run limpa-variaveis.
   return 'relatorio-premio3_ok'.
end.
{bib00199.i}.
End Procedure.



procedure relatorio-premio4.
b-1:
do on error undo b-1, leave b-1.
   
   for each jdb003
       where jdb003.data    >= ws-data-ini
         and jdb003.data    <= ws-data-fin
      with width 160 no-box:
      ws-grupo1 = ''.
      ws-grupo2 = ''.
      ws-grupo3 = ''.
      ws-grupo4 = ''.
      ws-grupo5 = ''.
      run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
      run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
      disp
         jdb003.data       column-label 'Data Mvto'
         jdb003.hora       form 'x(20)' column-label 'Hora'
         jdb003.Banca      column-label 'Banca' 
         jdb003.Premio4    column-label '4¤ Premio' 
         ws-descricao4     column-label 'Bicho'
         skip
         .      
   end.
   run limpa-variaveis.
   return 'relatorio-premio4_ok'.
end.
{bib00199.i}.
End Procedure.



procedure relatorio-premio5.
b-1:
do on error undo b-1, leave b-1.
   
   for each jdb003
       where jdb003.data    >= ws-data-ini
         and jdb003.data    <= ws-data-fin
      with width 160 no-box:
      ws-grupo1 = ''.
      ws-grupo2 = ''.
      ws-grupo3 = ''.
      ws-grupo4 = ''.
      ws-grupo5 = ''.
      run CoverteJogos in this-procedure.  /*Verifica em qual grupo pertence*/
      run convertegrupo in this-procedure. /*Coverte o grupo no nome do bicho*/
      disp
         jdb003.data       column-label 'Data Mvto'
         jdb003.hora       form 'x(20)' column-label 'Hora'
         jdb003.Banca      column-label 'Banca' 
         jdb003.Premio5    column-label '5¤ Premio' 
         ws-descricao5     column-label 'Bicho'
         skip
         .      
   end.
   run limpa-variaveis.
   return 'relatorio-premio5_ok'.
end.
{bib00199.i}.
End Procedure.

procedure relatorio-todos.
b-1:
do on error undo b-1, leave b-1.
   
   for each jdb003
      where jdb003.data    >= ws-data-ini
        and jdb003.data    <= ws-data-fin
      with width 160 no-box:
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
   end.
   run limpa-variaveis.
   return 'relatorio-todos_ok'.
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


