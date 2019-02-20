### Szintézis paraméterek

Név |  Leírás
-----|-------
data_width | Azt adja meg, hogy hány bitből áll egy szó a stack-ben. Meg kell egyeznie az ACU adatbuszának méretével.
stack_size_log2 | A stack maximális méretének a 2-es alapú logaritmusa
addr_push | Az a cím az MMIO buszon, amelyre történő írás a stack `push` műveletét indítja
addr_pop | Az a cím az MMIO buszon, amelyről történő olvasás a stack `pop` műveletét indítja
addr_top | Az a cím az MMIO buszon, amelyről történő olvasás a stack `top` műveletét indítja

### A STACK-et megvalósító felhasználói logika portjai

Name | width | in/out | Side | Description
-----|-------|--------|------|------------
`adapt_push`|1|in|Adapter|Vezérlőjel, amely a PUSH műveletet jelzi
`adapt_pop`|1|in|Adapter|Vezérlőjel, amely a POP műveletet jelzi
`adapt_top`|1|in|Adapter|Vezérlőjel, amely a TOP műveletet jelzi
`adapt_re`|1|in|Adapter| Az adapter jelzi a User Logic számára egy olvasási műveletet kezdetét
`adapt_we`|1|in|Adapter| Az adapter jelzi a User Logic számára egy írási műveletet kezdetét
`adapt_re_ack`|1|out|Adapter| A User Logic jelzi az adapter felé, hogy olvasási művelet eredménye az `adapt_data` vonalakon rendelkezésre áll.
`adapt_we_ack`|1|out|Adapter| A User Logic jelzi az adapter felé, hogy az `adapt_data` vonalakon levő adatot feldolgozta.
`adapt_data`|data_width|in/out|Adapter| Kétirányú adatbusz az Adapter és a usr Logic között
`clk`|1|in|| Órajel
`as_reset_n`|1|in|| Rendszer szintű reset vonal
`recover_fsm_n`|1|in|| Alacsony-aktív vezérlő bemenet, amellyel az állapotgép hiba után alapállapotba állítható.
`user_fsm_ivnvalid_state_error`|1|out|| Állapotgép érvénytelen állapotát jelző, magas-aktív állapotjel.
`mem_data_out`|data_width|out|Mem| A memória data bemeneti portja (connected to entity edac_protected_ram.data_in)
`mem_data_in`|data_width|in|Mem| A memória data kimeneti portja (connected to entity edac_protected_ram.data_out)
`mem_re`|1|out|Mem| A User Logic jelzi a memória számára egy olvasás műveletet kezdetét 
`mem_we`|1|out|Mem| A User Logic jelzi a memória számára egy írási műveletet kezdetét
`mem_re_ack`|1|in|Mem| A memória jelzi a User Logic felé, hogy olvasási művelet eredménye az `mem_data_in` vonalakon rendelkezésre áll.
`mem_we_ack`|1|in|Mem| A memória jelzi a User Logic felé, hogy az `mem_data_out` vonalakon levő adatot feldolgozta.
`mem_addr`|stack_size_log2|out|Mem| A memóría modulon belüli szó címe

_Megjegyzések_
* A `_n` végződés azt jelenti, hogy az adott jel alacsony aktív
