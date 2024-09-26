/*---------------------------------COOPERATE-----------------------01/02/2018-+
| Modulo        :                                                             |
| Sub-modulo    :                                                             |
| Programa      : jdb203.p                                                    |
| Funcao        : Cadastrar milhar.                                           |
| Solicitacao   :                                                             |
+----------------------------------------------------------------------------*/
{shared.i}.

def var ok                             as log format 'Sim/Nao'.
def var ws-data                        like jdb003.data.
def var ws-banca                       like jdb003.banca.
def var ws-hora                        like jdb003.hora.
def var ws-horario-o                 as char format 'x(5)'
                                     extent 4 initial
                                     ['11:00-PTM'
                                     ,'14:00-PT'
                                     ,'18:00-PTN/FEDERAL'
                                     ,'21:00-CORUJINHA'
                                     ].
def var ws-sigla-o                   as char format 'x(10)'
                                     extent 2 initial
                                     ['PT-RIO'
                                     ,'LOOK-GOIAS'
                                     ].
                                                                          

def frame t1a
   ws-horario-o[1]   form 'x(20)'
   help "Horario do Jogo"
   skip
   ws-horario-o[2]   form 'x(20)'
   help "Horario do jogo"
   skip
   ws-horario-o[3]   form 'x(20)'
   help "Horario do jogo"
   skip
   ws-horario-o[4]   form 'x(20)'
   help "Horario do jogo"
   skip
   with no-labels col 21 row 9 overlay 1 down title "HORA DO JOGO".

def frame t1b
   ws-sigla-o[1]   form 'x(16)'
   help "Banca do Jogo"
   skip
   ws-sigla-o[2]   form 'x(16)'
   help "Banca do jogo"
   with no-labels col 45 row 9 overlay 1 down title "BANCA DO JOGO".





def frame t1
    ws-data
    label 'Data Jogo....'
       skip
    ws-banca
    label 'Banca........'
       skip
    ws-hora
    label 'Horario......'
       skip
    jdb003.premio1
    label 'Milhar 1.....'
       skip
    jdb003.premio2
    label 'Milhar 2.....'
       skip
    jdb003.premio3
    label 'Milhar 3.....'
       skip
    jdb003.premio4
    label 'Milhar 4.....'
       skip
    jdb003.premio5
    label 'Milhar 5.....'
       skip
    with 1 down centered row 05 side-labels overlay width 78
         title ' Cadstro De Milhar Jogo Do Bicho! '.

bloco-0:
repeat:
   clear frame t1.
   view frame t1.
   pause 0.
   {opcao1.i
        &ext = 5
        &op1 = *   &op2 = *   &op3 = *   &op4 = *   &op5 = * 
        }.
   if op = 'r' then
      do:
         run jdb403.p.
         next.
      end.
   bloco-1:
   repeat with frame t1:
      clear frame t1.
      ws-hora      = ''.
      ws-banca     = ''.
      ws-data      = today.
      update ws-data.
      disp ws-sigla-o with frame t1b.
      do with frame t1b:
         choose field ws-sigla-o keys ws-banca.
         ws-banca = frame-value.
      end.
      disp ws-banca.
      pause 0. 
      disp ws-horario-o with frame t1a.
      do with frame t1a:
         choose field ws-horario-o keys ws-hora.
         ws-hora = frame-value.
      end.
      disp ws-hora.
      find first jdb003
           share-lock
           where jdb003.data    = ws-data
             and jdb003.banca   = ws-banca
             and jdb003.hora    = ws-hora
           no-error.
      if avail jdb003 then
         do:
            disp 
              jdb003.premio1
              jdb003.premio2
              jdb003.premio3              
              jdb003.premio4
              jdb003.premio5
              .
            if op = 'i' then
               do:
                  bell.
                  message 'Jogo ja cadastrado!'.
                  next.
               end.
            if op = 'c' then 
               do.
                  next.
               end.
            if op = 'e' then
               do:
                  ok = no.
                  message 'Confirma exclusao?' update ok.
                  if ok then delete jdb003.
                  next.
               end.
         end.
      else
         do:
            if op ne 'i' then
               do:
                  bell.
                  message 'Jogo nao cadastrado!'.
                  next.
               end.
            create jdb003.
            assign  
               jdb003.data = ws-data
               jdb003.banca = ws-banca
               jdb003.hora  = ws-hora.
        end.

     update jdb003.premio1
            jdb003.premio2
            jdb003.premio3
            jdb003.premio4
            jdb003.premio5.
        
   end.
end.
hide frame t1.
hide frame opcao.











