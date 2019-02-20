### Szintézis paraméterek

Name |  Description
-----|-------
data_width | Azt adja meg, hogy milyen hány bitből áll egy szó a stack-ben. Meg kell egyeznie az ACU adatbuszának méretével.
stack_size_log2 | A stack maximális mérete (log2)
addr_push | az a cím az MMIO buszon, amelyre történő írás a stack `push` műveletét indítja
addr_pop | az a cím az MMIO buszon, amelyről történő olvasás a stack `pop` műveletét indítja
addr_top | az a cím az MMIO buszon, amelyről történő olvasás a stack `top` műveletét indítja

### A STACK-et megvalósító felhasználói logika portjai

Name | width | in/out | Side | Description
-----|-------|--------|------|------------
`adapt_push`|1|in|Adapter|Vezérlőjel, amely a PUSH műveletet jelzi
`adapt_pop`||in|Adapter|Vezérlőjel, amely a POP műveletet jelzi
`adapt_top`||in|Adapter|Vezérlőjel, amely a TOP műveletet jelzi
`adapt_re`||in|Adapter| Az adapter jelzi a User Logic számára egy olvasási műveletet kezdetét
`adapt_we`||in|Adapter| Az adapter jelzi a User Logic számára egy írási műveletet kezdetét
`adapt_re_ack`||out|Adapter| A User Logic jelzi az adapter felé, hogy olvasási művelet eredménye az `adapt_data` vonalakon rendelkezésre áll.
`adapt_we_ack`||out|Adapter| A User Logic jelzi az adapter felé, hogy az `adapt_data` vonalakon levő adatot feldolgozta.
`adapt_data`|data_width|in/out|Adapter| Kétirányú adatbusz az Adapter és a usr Logic között
`clk`||in|| Órajel
`as_reset_n`||in|| Rendszer szintű reset vonal
`recover_fsm_n`||in|| Alacsony-aktív vezérlő bemenet, amellyel az állapotgép hiba után alapállapotba állítható.
`user_fsm_ivnvalid_state_error`||out|| Állapotgép érvénytelen állapotát jelző, magas-aktív állapotjel.
`mem_data_out`|data_width|out|Mem| (connected to entity edac_protected_ram.data_in)
`mem_data_in`|data_width|in|Mem| (connected to entity edac_protected_ram.data_out)
`mem_re`||out|Mem| A User Logic jelzi a memória számára egy olvasás műveletet kezdetét 
`mem_we`||out|Mem| A User Logic jelzi a memória számára egy írási műveletet kezdetét
`mem_re_ack`||in|Mem| A memória jelzi a User Logic felé, hogy olvasási művelet eredménye az `mem_data_in` vonalakon rendelkezésre áll.
`mem_we_ack`||in|Mem| A memória jelzi a User Logic felé, hogy az `mem_data_out` vonalakon levő adatot feldolgozta.
`mem_addr`|stack_size_log2|out|Mem| A memóría címe
