### A STACK-et megvalósító felhasználói logika portjai

Name | width | in/out | Side | Description
-----|-------|--------|------|------------
```push```|1|in|Adapter|Indicates PUSH operation
```pop```||in|Adapter|Indicates POP operation
```top```||in|Adapter|Indicates TOP operation
```adapt_re```||in|Adapter| Vezérlőjel, amely egy olvasás műveletet inicializál
```adapt_we```||in|Adapter| Vezérlőjel, amely egy írási műveletet inicializál
```adapt_re_ack```||out|Adapter| Állapotjel, amely jelzi, hogy az olvasás művelet befejeződött.
```adapt_we_ack```||out|Adapter| Állapotjel, amely jelzi, hogy az írás művelet befejeződött.
```clk```||in|| Órajel
```as_reset_n```||in|| 
```recover_fsm_n```||in||
```sof_error```||out||
```suf_error```||out||
```user_fsm_ivnvalid_state_error```||out||
```edac_data_out```|data_width|out|EDAC|connected to entity edac_protected_ram.data_in
```edac_data_in```|data_width|in|EDAC|connected to entity edac_protected_ram.data_out
```edac_re```||out|EDAC|
```edac_we```||out|EDAC|
```edac_re_ack```||in|EDAC|
```edac_we_ack```||in|EDAC|
```edac_addr```|address_width|out|EADC|

### Megjegyzések
* A ```_n``` végződés azt jelenti, hogy a port alacsony szinten aktív
* 

