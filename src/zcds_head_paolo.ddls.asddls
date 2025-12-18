@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds root view of head'
@Metadata.ignorePropagatedAnnotations: true 
define root view entity Zcds_head_paolo as select from ZHEAD_PAOLO
composition of zcds_item_paolo as _SalesItem
{
key salesorderuuid as Salesorderuuid,   
salesorder as Salesorder, 
salesordertype as Salesordertype, 
description as Description, 
salesorganization as Salesorganization, 
soldtoparty as Soldtoparty, 
distributionchannel as Distributionchannel, 
documentreason as Documentreason, 
@Semantics.amount.currencyCode: 'Transactioncurrency' 
totalnetamount as Totalnetamount, 
transactioncurrency as Transactioncurrency, 
@Semantics.user.createdBy: true 
createdbyuser as Createdbyuser, 
@Semantics.systemDateTime.createdAt: true 
creationat as Creationat, 
@Semantics.user.lastChangedBy: true 
lastchangedbyuser as Lastchangedbyuser, 
@Semantics.systemDateTime.lastChangedAt: true 
lastchangedat as Lastchangedat, 
@Semantics.systemDateTime.localInstanceLastChangedAt: true 
locallastchangedat as Locallastchangedat, 
_SalesItem // Make association public
}
