{shared.i}.
{device.w}.


def var x as int.
def var ws-linha as int.

def temp-table tmp001
    field premio1    like jdb003.premio1
    field linha      as int 
    index tmp001-01
          premio1
          linha.
           

ws-linha = 0.
do x = 1 to 9999.
   find first jdb003
        where jdb003.premio1 = x or
              jdb003.premio2 = x or
              jdb003.premio3 = x or
              jdb003.premio4 = x or
              jdb003.premio5 = x no-error.
   if not avail jdb003 then
   do.
       find first tmp001 share
            where tmp001.premio1 = x 
            no-error.
       if not avail tmp001 then
       do.
           ws-linha = ws-linha + 1.
           create tmp001.
           assign
                tmp001.linha   = ws-linha
                tmp001.premio1 = x.
       end.  
   end.
end.


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
   for each tmp001.
      disp tmp001.linha  
           tmp001.premio1.
   end.
{devicef.i}.