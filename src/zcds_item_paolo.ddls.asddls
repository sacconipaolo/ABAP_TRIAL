@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds view of item'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zcds_item_paolo as select from ZITEM_PAOLO
association to parent Zcds_head_paolo as _SalesHdr on $projection.Salesorderuuid = _SalesHdr.Salesorderuuid
{
    key salesitemuuid as Salesitemuuid,
    salesorderuuid as Salesorderuuid,
    salesorderitem as Salesorderitem,
    salesorderitemcategory as Salesorderitemcategory,
    salesorderitemtext as Salesorderitemtext,
    material as Material,
    plant as Plant,
    @Semantics.quantity.unitOfMeasure: 'Orderquantityunit'  
    orderquantity as Orderquantity,
    orderquantityunit as Orderquantityunit,
    @Semantics.amount.currencyCode: 'Transactioncurrency'    
    netamount as Netamount,
    transactioncurrency as Transactioncurrency,
    @Semantics.user.createdBy: true
    createdbyuser as Createdbyuser,
    @Semantics.systemDateTime.createdAt: true
    creationat as Creationat,
    @Semantics.user.lastChangedBy: true
    lastchangedbyuser as Lastchangedbyuser,
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat as Lastchangedat,
    locallastchangedat as Locallastchangedat,
    _SalesHdr
}
