/*Compara a uma data escolhida com jogos que ja sairam*/


{shared.i}.
{device.w}.
def buffer jdb003b for jdb003.

def var ws-texto       as char.
def var ws-data        as date form '99/99/9999'.
 

def frame t1
   ws-data
   with frame t1 1 down centered row 05 side-labels overlay
   title 'Comparativo'.
   



b-X:
repeat
   with frame t1
   on error  undo b-X, leave b-X
   on endkey undo b-X, leave b-X .
  
   update ws-data. 

   if keyfunc(lastkey) = 'end-error' then leave.
   i_empresa   = sh-empresa.
   i_unidade   = 0.
   i_cpl       = 160.
   i_cpp       = 20.
   i_lpp       = 6.
   i_nlinhas   = 62.
   c_titulo[1] = 'RELATORIO'.
   {device.i}.
   
   view frame cab01.

   for each jdb003b
      where jdb003b.data    = ws-data
      .
      for each jdb003
         where jdb003.premio1 = jdb003b.premio1.
         disp jdb003.data
              jdb003.premio1
              jdb003.hora form 'x(25)'
              skip.
      end.        
   end.
   {devicef.i}.
   leave.
end.     
