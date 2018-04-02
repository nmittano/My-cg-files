SELECT 
      OOD.ORGANIZATION_CODE                                          "Organization Code",
      IT.NAME                                                       "Item Master Org",
      MPV.CALENDAR_CODE                                             "Calender",
      FCL.MEANING                                                   "Demand Class",
      MPV.TXN_APPROVAL_TIMEOUT_PERIOD                               "Move Time Out Per..",
      DECODE(MPV.MO_APPROVAL_TIMEOUT_ACTION,'1','Approve automatically','2','Reject automatically')   "Move Order Timeout Action",
      DECODE(MPV.STOCK_LOCATOR_CONTROL_CODE,'1','None','2','Prespecified only','3','Dynamic entry allowed','4','Determined at Subinventory level')    "Locator Control",
      (SELECT STATUS_CODE FROM MTL_MATERIAL_STATUSES WHERE STATUS_ID(+) = MPV.DEFAULT_STATUS_ID) "Def On-Hand Material Status",
      DECODE(MPV.ENFORCE_LOCATOR_ALIS_UNQ_FLAG,'N','No','Y','Yes')    "Locator Alias Uniquenss",
      DECODE(MPV.QA_SKIPPING_INSP_FLAG,'N','No','Y','Yes')            "Qlty Skipping Inspection",
      DECODE(MPV.NEGATIVE_INV_RECEIPT_CODE,'1','Yes','2','No')        "Allow Negative Balances",
      DECODE(MPV.AUTO_DEL_ALLOC_FLAG,'Y','Yes','N','No')              "Auto Delete at Move Order",
      DECODE(MPV.TRADING_PARTNER_ORG_FLAG,'Y','Yes','N','No')         "Manfacturing Partner Org",
      DECODE(MPV.EAM_ENABLED_FLAG,'Y','Yes','N','No')                 "EAM Enabled",
      DECODE(MPV.PROCESS_ENABLED_FLAG,'Y','Yes','N','No')             "Process Manufacturing Enabled",
      DECODE(MPV.WMS_ENABLED_FLAG,'Y','Yes','N','No')                 "WMS Enabled",
      DECODE(MPV.WCS_ENABLED,'Y','Yes','N','No')                      "WCS Enabled",	
      DECODE(MPV.LCM_ENABLED_FLAG,'Y','Yes','N','No')                 "LCM Enabled",
      (OOD.ORGANIZATION_CODE||','||OOD.ORGANIZATION_NAME)            "EAM Organization",

    ---DECODE(MPV.OPSM_ENABLED_FLAG,'Y','Yes','N','No')				  "opsm enabled",
      MPV.ORG_MAX_WEIGHT                                              "Load Weight",
      MPV.ORG_MAX_WEIGHT_UOM_CODE                                     "Weight UOM",
      MPV.ORG_MAX_VOLUME                                              "Volume",
      MPV.ORG_MAX_VOLUME_UOM_CODE                                     "Volume UOM",
      (SELECT ORGANIZATION_NAME FROM ORG_ORGANIZATION_DEFINITIONS WHERE ORGANIZATION_ID(+)= MPV.COST_ORGANIZATION_ID)     "Costing Organization",
      MPV.PRIMARY_COST_DUMMY                                          "Costing Method",
      RATE_TYPE.COST_TYPE                                               "Rates Cost Type",
      DECODE(MPV.GENERAL_LEDGER_UPDATE_CODE,'1','No','2','Yes')       "Transfer TO GL",
      DECODE(MPV.ENCUMBRANCE_REVERSAL_FLAG,'1','Yes','2','No')        "Reverse Encumbrance",
      DECODE(MPV.PM_COST_COLLECTION_ENABLED,'1','Yes','2','No')       "Project Cost Collect Enabled",
      DECODE(MPV.DEFER_LOGICAL_TRANSACTIONS,'1','Yes','2','No')       "Defer Logical Transactions",
      TO_CHAR(MPV.COST_CUTOFF_DATE, 'DD-MON-YYYY')                    "Cost Cutoff Date",
      MPV.DEFAULT_MATERIAL_SUB                                        "Default Material Sub-Element",
      BOM.RESOURCE_CODE                                                 "Material Overhead Sub-Element",
      CCG.COST_GROUP                                                    "Default Cost Group",
      GCCK.CONCATENATED_SEGMENTS                                     "Material",
      GCCK2.CONCATENATED_SEGMENTS                                    "Outside Processing",
      GCCK3.CONCATENATED_SEGMENTS                                    "Material Overhead",
      GCCK4.CONCATENATED_SEGMENTS                                    "Overhead",
      GCCK5.CONCATENATED_SEGMENTS                                    "Resource",
      GCCK6.CONCATENATED_SEGMENTS                                    "Expense",
      MPV.STARTING_REVISION                                          "Starting Revision",
      DECODE(MPV.LOT_NUMBER_UNIQUENESS,'1','Across items','2','None') "Lot Control Uniqueness",
      MFG1.MEANING                                                      "Lot Generation",
      DECODE(MPV.LOT_NUMBER_ZERO_PADDING,'1','Yes','2','No')          "Lot:Zero Pad Suffix",
      MPV.AUTO_LOT_ALPHA_PREFIX                                       "Lot:Prefix",
      MPV.LOT_NUMBER_LENGTH                                           "Lot:Total Length",
      --DECODE(MPV.ALLOCATE_LOT_FLAG,'Y','Yes','N','No')				  "Lot:Allocate Lot"
      DECODE(MPV.PARENT_CHILD_GENERATION_FLAG,'C','Parent+Child','L','Parent')         "Child Lot:Child Generation",
      DECODE(MPV.CHILD_LOT_ZERO_PADDING_FLAG,'N','No','Y','Yes')      "Child Lot:Zero Pad",
      MPV.CHILD_LOT_ALPHA_PREFIX                                      "Child Lot:Prefix",
      MPV.CHILD_LOT_NUMBER_LENGTH                                     "Child Lot:Total Length",
      DECODE(MPV.CHILD_LOT_VALIDATION_FLAG,'Y','Yes','N','No')        "Child Lot:Format Validation",
      DECODE(MPV.COPY_LOT_ATTRIBUTE_FLAG,'Y','Yes','N','No')          "Child Lot:Copy Lot Attri",
      DECODE(MPV.CREATE_LOT_UOM_CONVERSION,'3','User confirmation','2','No','1','Yes')    "Auto Create Lot UOM Conversion",
      DECODE(MPV.ALLOW_DIFFERENT_STATUS,'1','Yes','2','No','3','With exception')          "Allow Diff Material Status",
      DECODE(MPV.SERIAL_NUMBER_TYPE,'1','Within inventory models and items','2','Within organization','4','Within inventory items','3','Across organiaztions') "Serial Uniqueness",
      DECODE(MPV.SERIAL_NUMBER_GENERATION,'1','At organization level','2','At item level','3','User defined')   "Serial Generation",
      MPV.AUTO_SERIAL_ALPHA_PREFIX                                    "Serial Prefix",
      MPV.START_AUTO_SERIAL_NUMBER                                    "Starting Serial Number",
      DECODE(MPV.ALLOCATE_SERIAL_FLAG,'Y','Yes','N','No')             "Allocate Serial Numbers",
      MPV.TOTAL_LPN_LENGTH                                            "LPN:Total Length",
      MPV.LPN_STARTING_NUMBER                                         "Stating LPN Number",
      MPV.LPN_PREFIX                                                  "LPN:Prefix",
      MPV.LPN_SUFFIX                                                  "LPN:Suffix",
      DECODE(MPV.UCC_128_SUFFIX_FLAG,'Y','Yes','N','No')              "LPN:UCC-128 Suffix",
      MPV.DEFAULT_ATP_RULE                                            "ATP Rule",
      MPV.DEFAULT_PICKING_RULE                                        "Picking Rule",
      MPV.DEFAULT_SUBINV_ORDER_VALUE                                  "Subinventory Order",
      MPV.DEFAULT_LOCATOR_ORDER_VALUE                                 "Locator Order",
      DECODE(MPV.MO_PICK_CONFIRM_REQUIRED,'1','Yes','2','No')         "Pick Confirmation Required",
      DECODE(MPV.WIP_OVERPICK_ENABLED,'N','No','Y','Yes')             "Overpicking for Manufacturing",
      DECODE(MPV.OVPK_TRANSFER_ORDERS_ENABLED,'Y','Yes','N','No')     "Overpicking: Transfer Orders",
      DECODE(MPV.RULES_OVERRIDE_LOT_RESERVATION,'Y','Yes','N','No')   "Override for Lot-Level",
      DECODE(MPV.SOURCE_TYPE,'2','Supplier','1','Inventory')          "Type",
      MPV.SOURCE_ORGANIZATION_NAME                                    "Organisation",
      MPV.SOURCE_SUBINVENTORY                                         "Subinventory",
      MPV.MO_SOURCE_REQUIRED										  "MO Source Req Before Approval",
      DECODE(MPV.DISTRIBUTED_ORGANIZATION_FLAG,'Y','Yes','N','No')    "Distributed Organization",
      DECODE(MPV.CARRIER_MANIFESTING_FLAG,'Y','Yes','N','No')         "Carrier Manifesting Org",
      DECODE(MPV.MATL_INTERORG_TRANSFER_CODE,'1','None','4','Predefined percent','2','Requested value','3','Requested Percent') "Inter-org Transfer Charge",
      MPV.INTERORG_TRNSFR_CHARGE_PERCENT                              "Percentage",
      GCCK7.CONCATENATED_SEGMENTS            "Transfer Credit",
      GCCK8.CONCATENATED_SEGMENTS            "Purchase Price Variance",
      GCCK9.CONCATENATED_SEGMENTS            "Receivable",
      GCCK10.CONCATENATED_SEGMENTS           "Payable",
      GCCK11.CONCATENATED_SEGMENTS           "Intransit Inventory",
      GCCK12.CONCATENATED_SEGMENTS            "Purchase Price Variance", 
      GCCK13.CONCATENATED_SEGMENTS            "Invoice Price Variance",
      GCCK14.CONCATENATED_SEGMENTS            "Inventory AP Accrual",
      GCCK15.CONCATENATED_SEGMENTS  "Encumbrance",
      GCCK16.CONCATENATED_SEGMENTS            "Sales",
      GCCK17.CONCATENATED_SEGMENTS            "Cost of Goods Sold",
      GCCK18.CONCATENATED_SEGMENTS            "Project Clearance Account",
      GCCK19.CONCATENATED_SEGMENTS            "Deferred COGS Account",
      GCCK20.CONCATENATED_SEGMENTS            "Cost Variance Account",
      GCCK21.CONCATENATED_SEGMENTS            "LCM Variance Account",
      GCCK22.CONCATENATED_SEGMENTS            "On-Hand Adj Account",
      MPV.ATTRIBUTE1                                                  ,
      MPV.ATTRIBUTE2                                                  ,
      MPV.ATTRIBUTE3                                                  ,
      MPV.ATTRIBUTE4                                                  ,
      MPV.ATTRIBUTE5                                                  ,
      MPV.ATTRIBUTE6                                                  ,
      MPV.ATTRIBUTE7                                                  ,
      MPV.ATTRIBUTE8                                                  ,
      MPV.ATTRIBUTE9                                                  ,
      MPV.ATTRIBUTE10                                                 ,
      MPV.ATTRIBUTE11                                                 ,
      MPV.ATTRIBUTE12                                                 ,
      MPV.ATTRIBUTE13                                                 ,
      MPV.ATTRIBUTE14                                                 ,
      MPV.ATTRIBUTE15                                                 ,
      MPV.ATTRIBUTE_CATEGORY
FROM 
ORG_ORGANIZATION_DEFINITIONS OOD,
MTL_PARAMETERS_VIEW    MPV,
HR_ALL_ORGANIZATION_UNITS_TL IT,
HR_ALL_ORGANIZATION_UNITS I,
FND_COMMON_LOOKUPS       FCL,
BOM_RESOURCES BOM,
CST_COST_GROUPS     CCG,
MFG_LOOKUPS       MFG1,
GL_CODE_COMBINATIONS_KFV GCCK,
    GL_CODE_COMBINATIONS_KFV GCCK2,
    GL_CODE_COMBINATIONS_KFV GCCK3,
    GL_CODE_COMBINATIONS_KFV GCCK4,
    GL_CODE_COMBINATIONS_KFV GCCK5,
    GL_CODE_COMBINATIONS_KFV GCCK6,
    GL_CODE_COMBINATIONS_KFV GCCK7,
    GL_CODE_COMBINATIONS_KFV GCCK8,
    GL_CODE_COMBINATIONS_KFV GCCK9,
    GL_CODE_COMBINATIONS_KFV GCCK10,
    GL_CODE_COMBINATIONS_KFV GCCK11,
    GL_CODE_COMBINATIONS_KFV GCCK12,
    GL_CODE_COMBINATIONS_KFV GCCK13,
    GL_CODE_COMBINATIONS_KFV GCCK14,
    GL_CODE_COMBINATIONS_KFV GCCK15
    GL_CODE_COMBINATIONS_KFV GCCK16,
    GL_CODE_COMBINATIONS_KFV GCCK17,
    GL_CODE_COMBINATIONS_KFV GCCK18,
    GL_CODE_COMBINATIONS_KFV GCCK19,
    GL_CODE_COMBINATIONS_KFV GCCK20,
    GL_CODE_COMBINATIONS_KFV GCCK21,
    GL_CODE_COMBINATIONS_KFV GCCK22,
(SELECT UNIQUE CCT.COST_TYPE_ID,  CCT.COST_TYPE
FROM CST_COST_TYPES CCT,MTL_PARAMETERS_VIEW MTLPV1
WHERE ( (MTLPV1.PRIMARY_COST_METHOD         = 1 AND COST_TYPE_ID                             != 2)
OR (MTLPV1.PRIMARY_COST_METHOD            = 2 AND COST_TYPE_ID                             >= 1000)
OR (MTLPV1.PRIMARY_COST_METHOD           >= 5 AND COST_TYPE_ID                             >= 1000))
AND CCT.COST_TYPE_ID(+) = MTLPV1.AVG_RATES_COST_TYPE_ID
AND NVL(CCT.DISABLE_DATE, SYSDATE+1) > SYSDATE
ORDER BY CCT.COST_TYPE) RATE_TYPE
WHERE
OOD.ORGANIZATION_ID           = MPV.ORGANIZATION_ID
AND MPV.ORGANIZATION_ID       =5703
and I.ORGANIZATION_ID                                = MPV.MASTER_ORGANIZATION_ID
AND I.ORGANIZATION_ID                                  = IT.ORGANIZATION_ID
AND IT.LANGUAGE                                        = USERENV('LANG')
AND FCL.APPLICATION_ID (+)                               = 700
AND FCL.LOOKUP_CODE(+)         = MPV.DEF_DEMAND_DUMMY
AND FCL.LOOKUP_TYPE(+)         ='DEMAND_CLASS'
AND RATE_TYPE.COST_TYPE_ID(+)			= MPV.AVG_RATES_COST_TYPE_ID
AND MPV.DEFAULT_MATL_OVHD_COST_ID 	=   BOM.RESOURCE_ID(+)
AND MPV.DEFAULT_COST_GROUP_ID     	=   CCG.COST_GROUP_ID(+)
AND MFG1.LOOKUP_TYPE(+)             	=   'MTL_SERIAL_GENERATION'
AND MFG1.LOOKUP_CODE(+)             	=   MPV.LOT_NUMBER_GENERATION
AND GCCK.CODE_COMBINATION_ID  = MPV.MATERIAL_ACCOUNT
AND GCCK2.CODE_COMBINATION_ID = MPV.OUTSIDE_PROCESSING_ACCOUNT
AND GCCK3.CODE_COMBINATION_ID = MPV.MATERIAL_OVERHEAD_ACCOUNT
AND GCCK4.CODE_COMBINATION_ID = MPV.OVERHEAD_ACCOUNT
AND GCCK5.CODE_COMBINATION_ID = MPV.RESOURCE_ACCOUNT
AND GCCK6.CODE_COMBINATION_ID = MPV.EXPENSE_ACCOUNT
AND GCCK7.CODE_COMBINATION_ID = MPV.INTERORG_TRANSFER_CR_ACCOUNT
     AND GCCK8.CODE_COMBINATION_ID = MPV.INTERORG_PRICE_VAR_ACCOUNT
     AND GCCK9.CODE_COMBINATION_ID = MPV.INTERORG_RECEIVABLES_ACCOUNT
     AND GCCK10.CODE_COMBINATION_ID = MPV.INTERORG_PAYABLES_ACCOUNT
     AND GCCK11.CODE_COMBINATION_ID = MPV.INTRANSIT_INV_ACCOUNT
     AND GCCK12.CODE_COMBINATION_ID = MPV.INTERORG_PRICE_VAR_ACCOUNT
     AND GCCK13.CODE_COMBINATION_ID = MPV.INVOICE_PRICE_VAR_ACCOUNT
     AND GCCK14.CODE_COMBINATION_ID = MPV.AP_ACCRUAL_ACCOUNT
AND GCCK15.CODE_COMBINATION_ID(+)= MPV.ENCUMBRANCE_ACCOUNT
     AND GCCK16.CODE_COMBINATION_ID = MPV.SALES_ACCOUNT
     AND GCCK17.CODE_COMBINATION_ID = MPV.COST_OF_SALES_ACCOUNT
     AND GCCK18.CODE_COMBINATION_ID = MPV.PROJECT_COST_ACCOUNT
     AND GCCK19.CODE_COMBINATION_ID = MPV.DEFERRED_COGS_ACCOUNT
     AND GCCK20.CODE_COMBINATION_ID(+)= MPV.AVERAGE_COST_VAR_ACCOUNT      
     AND GCCK21.CODE_COMBINATION_ID(+)= MPV.LCM_VAR_ACCOUNT                  
     AND GCCK22.CODE_COMBINATION_ID(+)= MPV.CAT_WT_ACCOUNT
;
SELECT * FROM MTL_PARAMETERS_VIEW;