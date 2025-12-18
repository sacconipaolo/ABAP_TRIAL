CLASS zload_vbakvbap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zload_vbakvbap IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zhead_paolo.
* fill internal travel table (itab)
    GET TIME STAMP FIELD  DATA(tsf).
    itab = VALUE #( ( salesorderuuid = '02D5290E594C1EDA93815057FD946624' salesorder = '1000000001' salesordertype = 'OR' description = 'iPhone' soldtoparty = 'Demo_user1' salesorganization = '0001'
                      distributionchannel = '01' documentreason = '1' totalnetamount = '700.00' transactioncurrency = 'USD' createdbyuser = 'USER1' creationat = tsf
                      lastchangedbyuser = 'USER1' lastchangedat = tsf locallastchangedat =  tsf )
                      ( salesorderuuid = '02D5290E594C1EDA93815057FD946625' salesorder = '1000000002' salesordertype = 'OR' description = 'Lenevo Laptop' soldtoparty = 'Demo_user2' salesorganization = '0001'
                      distributionchannel = '01' documentreason = '1' totalnetamount = '1000.00' transactioncurrency = 'USD' createdbyuser = 'USER1' creationat = tsf
                      lastchangedbyuser = 'USER1' lastchangedat = tsf locallastchangedat = tsf ) ).
* delete existing entries in the database table
    DELETE FROM zhead_paolo.
    IF sy-subrc = 0. ENDIF.
* insert the new table entries
    INSERT zhead_paolo FROM TABLE @itab.
    IF sy-subrc = 0.
    ENDIF.
    DATA itabitem TYPE TABLE OF zitem_paolo.
* fill internal travel table (itab)
    itabitem = VALUE #( ( salesitemuuid = '12D5290E594C1EDA93815057FD946624' salesorderuuid = '02D5290E594C1EDA93815057FD946624' salesorderitem = '00010' salesorderitemcategory = 'TAQB'
                          salesorderitemtext = 'iphone' material = '1110000980' plant = '010' orderquantity = '1' orderquantityunit = 'EA' netamount = '700' transactioncurrency = 'USD' createdbyuser = 'USER1'
                          creationat = tsf lastchangedbyuser = 'USER1' lastchangedat = tsf locallastchangedat = tsf )
                        ( salesitemuuid = '12D5290E594C1EDA93815057FD946625' salesorderuuid = '02D5290E594C1EDA93815057FD946625' salesorderitem = '00010' salesorderitemcategory = 'TAQB'
                        salesorderitemtext = 'Lenevo Laptop' material = '1110000980' plant = '010' orderquantity = '1' orderquantityunit = 'EA' netamount = '1000' transactioncurrency = 'USD'
                        createdbyuser = 'USER1' creationat = tsf lastchangedbyuser = 'USER1' lastchangedat = tsf locallastchangedat = tsf ) ).
* delete existing entries in the database table
    DELETE FROM zitem_paolo.
* insert the new table entries
    INSERT zitem_paolo FROM TABLE @itabitem.
    IF sy-subrc = 0.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
