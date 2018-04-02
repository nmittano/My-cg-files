SELECT 
    MPV.ORGANIZATION_CODE                                         "Organization Code",
    MPV.MASTER_ORG                                                "Item Master Org",
    MPV.CALENDAR_CODE                                             "Calender",
    FCL.MEANING                                                   "Demand Class",
    MPV.TXN_APPROVAL_TIMEOUT_PERIOD                               "Move Time Out Per..",
    MPV.MO_APPROVAL_TIMEOUT_ACTION                                "Move Time Out Act..",
    MPV.STOCK_LOCATOR_CONTROL_CODE                                "Locator Control",
    DECODE(MPV.ENFORCE_LOCATOR_ALIS_UNQ_FLAG,'Y','Yes','N','No')  "Enforce Locator",
    DECODE(MPV.QA_SKIPPING_INSP_FLAG,'Y','Yes','N','No')          "Quality Skipping", 
    DECODE(MPV.NEGATIVE_INV_RECEIPT_CODE,'Y','Yes','N','No')      "Allow Negative..",
    DECODE(MPV.AUTO_DEL_ALLOC_FLAG,'Y','Yes','N','No')            "Auto Delete All..",
    DECODE(MPV.TRADING_PARTNER_ORG_FLAG,'Y','Yes','N','No')       "Manfacturing Part..",
    DECODE(MPV.EAM_ENABLED_FLAG,'Y','Yes','N','No')               "EAM Enabled",
    DECODE(MPV.PROCESS_ENABLED_FLAG,'Y','Yes','N','No')           "Process Manf..",
    DECODE(MPV.WMS_ENABLED_FLAG,'Y','Yes','N','No')               "WMS Enabled",
    DECODE(MPV.WCS_ENABLED,'Y','Yes','N','No')                    "WCS Enableed",
    DECODE(MPV.LCM_ENABLED_FLAG,'Y','Yes','N','No')               "LCM Enabled",
   (OOD.ORGANIZATION_CODE||','||OOD.ORGANIZATION_NAME)            "EAM Organization",
    MPV.ORG_MAX_WEIGHT                                            "Load Weight",
    MPV.ORG_MAX_WEIGHT_UOM_CODE                                   "Weight UOM",
    MPV.ORG_MAX_VOLUME                                            "Volume",
    MPV.ORG_MAX_VOLUME_UOM_CODE                                   "Volume UOM",
   ---2
    OOD.ORGANIZATION_NAME                                         "Costing Organization",
    L8.MEANING                                                    "Costing Method",
    CCT.COST_TYPE                                                 "Rates Cost Type",
    DECODE(MPV.GENERAL_LEDGER_UPDATE_CODE,'1','Yes','3','No')     "Transfer to GL",
    L3.MEANING                                                    "Reverse Encumbrance",
    L5.MEANING                                                    "Project Cost Collect..",
    L6.MEANING                                                    "Defer Logical Trans..",
    MPV.DEFER_LOGICAL_TRANSACTIONS                                 "Defer Logical Trans..",
    TO_CHAR(MPV.COST_CUTOFF_DATE,'DD-MON-YYYY')                    "Cost Cutoff Date",
    FLV.MEANING                                                    "Default Material Sub..",
    GCCK.CONCATENATED_SEGMENTS                                      "Material",
    GCCK2.CONCATENATED_SEGMENTS                                     "Outside Processing",
    GCCK3.CONCATENATED_SEGMENTS                                     "Material Overhead",
    GCCK4.CONCATENATED_SEGMENTS                                     "Overhead",
    GCCK5.CONCATENATED_SEGMENTS                                     "Resource",
    GCCK6.CONCATENATED_SEGMENTS                                     "Expense",
    ---3
    MPV.STARTING_REVISION                                           "Starting Revision",
    MPV.LOT_NUMBER_UNIQUENESS                                       "Lot Num Uniqueness",
    L2.MEANING                                                      "Generation",
    L4.MEANING                                                      "Zero Pad Suffix",
    MPV.LOT_NUMBER_ZERO_PADDING                                     "Zero Pad Suffix",
    MPV.AUTO_LOT_ALPHA_PREFIX,
    MPV.LOT_NUMBER_LENGTH,
    MPV.PARENT_CHILD_GENERATION_FLAG,
    MPV.CHILD_LOT_ZERO_PADDING_FLAG,
    MPV.CHILD_LOT_ALPHA_PREFIX,
    MPV.CHILD_LOT_NUMBER_LENGTH, 
    MPV.CHILD_LOT_VALIDATION_FLAG,
    MPV.COPY_LOT_ATTRIBUTE_FLAG, 
    MPV.CREATE_LOT_UOM_CONVERSION,
    MPV.ALLOW_DIFFERENT_STATUS,
    MPV.SERIAL_NUMBER_TYPE,
    MPV.SERIAL_NUMBER_GENERATION,
    MPV.AUTO_SERIAL_ALPHA_PREFIX, 
    MPV.START_AUTO_SERIAL_NUMBER,
    MPV.ALLOCATE_SERIAL_FLAG,
    MPV.TOTAL_LPN_LENGTH,
    MPV.LPN_STARTING_NUMBER,
    MPV.LPN_PREFIX                                      "Prefix",
    MPV.LPN_SUFFIX                                      "Suffix",
    MPV.UCC_128_SUFFIX_FLAG,
    ---4
    MAR.RULE_NAME                                       "Rule",
    WRV.NAME                                            "Picking Rule",
    MPV.DEFAULT_SUBINV_ORDER_VALUE                      "Subinventory Order",
    MPV.DEFAULT_LOCATOR_ORDER_VALUE                     "Locator Order",
    L7.MEANING                                          "Pick Confirmation Req..",
    DECODE(MPV.WIP_OVERPICK_ENABLED,'Y','Yes','N','No')                            "Overpicking For Man..",
    DECODE(MPV.OVPK_TRANSFER_ORDERS_ENABLED,'Y','Yes','N','No')                    "Overpicking For Trans..",
    DECODE(MPV.RULES_OVERRIDE_LOT_RESERVATION,'Y','Yes','N','No')                  "Enable Rules..",
    L1.MEANING                                          "Type",
    MPV.SOURCE_ORGANIZATION_NAME                        "Organization",
    MPV.SOURCE_SUBINVENTORY                             "Subinventory",
    DECODE(MPV.DISTRIBUTED_ORGANIZATION_FLAG,'Y','Yes','N','No')                   "Distributed Org",
    DECODE(MPV.CARRIER_MANIFESTING_FLAG,'Y','Yes','N','No')                        "Carrier Manifesting Org",
    ---5
    DECODE(MPV.MATL_INTERORG_TRANSFER_CODE,'1','None','2','Requested Value','3','Requested Percent','4','Predefined Pewrcent')   "InterOrg Transfer Charge", 
    MPV.INTERORG_TRNSFR_CHARGE_PERCENT                  "%",
    GCCK7.CONCATENATED_SEGMENTS            "Transfer Credit",
    GCCK8.CONCATENATED_SEGMENTS            "Purchase Price Variance",
    GCCK9.CONCATENATED_SEGMENTS            "Receivable",
    GCCK10.CONCATENATED_SEGMENTS           "Payable",
    GCCK11.CONCATENATED_SEGMENTS           "Intransit Inventory",
    -----6
    GCCK12.CONCATENATED_SEGMENTS            "Purchase Price Variance", 
    GCCK13.CONCATENATED_SEGMENTS            "Invoice Price Variance",
    GCCK14.CONCATENATED_SEGMENTS            "Inventory AP Accrual",
    GCCK16.CONCATENATED_SEGMENTS            "Sales",
    GCCK17.CONCATENATED_SEGMENTS            "Cost of Goods Sold",
    GCCK18.CONCATENATED_SEGMENTS            "Project Clearance Account",
    GCCK19.CONCATENATED_SEGMENTS            "Deferred COGS Account",
    
    
    
     ----7
  (MPV.ATTRIBUTE_CATEGORY||' '||MPV.ATTRIBUTE1||' '||MPV.ATTRIBUTE2||' '||MPV.ATTRIBUTE3||' '||MPV.ATTRIBUTE4||' '||MPV.ATTRIBUTE5||' '||MPV.ATTRIBUTE6||' '||MPV.ATTRIBUTE7||' '||MPV.ATTRIBUTE8||' '||MPV.ATTRIBUTE9
  ||' '||MPV.ATTRIBUTE10||' '||MPV.ATTRIBUTE11||' '||MPV.ATTRIBUTE12||' '||MPV.ATTRIBUTE13||' '||MPV.ATTRIBUTE14||' '||MPV.ATTRIBUTE15)  "Flex Field"
    
       
    FROM
    MTL_PARAMETERS_VIEW    MPV,
    ORG_ORGANIZATION_DEFINITIONS OOD,
    MTL_ATP_RULES    MAR,
    WMS_RULES_VL     WRV,
    MFG_LOOKUPS     L1,
    MFG_LOOKUPS     L2,
    MFG_LOOKUPS     L3,
    MFG_LOOKUPS     L4,
    MFG_LOOKUPS     L5,
    MFG_LOOKUPS     L6,
    MFG_LOOKUPS     L7,
    MFG_LOOKUPS     L8,
    ---MFG_LOOKUPS     L9,
    ---MFG_LOOKUPS     L10,
    ---MFG_LOOKUPS     L11,
    ---MFG_LOOKUPS     L12,
    ---MFG_LOOKUPS     L13,
    ---MFG_LOOKUPS     L14,
    FND_COMMON_LOOKUPS       FCL,
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
    GL_CODE_COMBINATIONS_KFV GCCK16,
    GL_CODE_COMBINATIONS_KFV GCCK17,
    GL_CODE_COMBINATIONS_KFV GCCK18,
    GL_CODE_COMBINATIONS_KFV GCCK19,
    MTL_SYSTEM_ITEMS_B   MSIB,
    MTL_PARAMETERS   MP,
    CST_COST_TYPES  CCT,
    FND_LOOKUP_VALUES FLV,
    BOM_RESOURCES   BR
    WHERE
    ---MPV.ORGANIZATION_ID = NVL(5703, ORGANIZATION_ID)
     OOD.ORGANIZATION_ID = MPV.ORGANIZATION_ID
     and MPV.ORGANIZATION_ID = MP.ORGANIZATION_ID
     and MSIB.ORGANIZATION_ID = MPV.ORGANIZATION_ID
     AND GCCK.CODE_COMBINATION_ID = MPV.MATERIAL_ACCOUNT
     AND GCCK2.CODE_COMBINATION_ID = MPV.OUTSIDE_PROCESSING_ACCOUNT
     AND GCCK3.CODE_COMBINATION_ID = MPV.MATERIAL_OVERHEAD_ACCOUNT
      ---and GCCK.CODE_COMBINATION_ID = MSIB.COST_OF_SALES_ACCOUNT
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
     AND GCCK16.CODE_COMBINATION_ID = MPV.SALES_ACCOUNT
     AND GCCK17.CODE_COMBINATION_ID = MPV.COST_OF_SALES_ACCOUNT
     AND GCCK18.CODE_COMBINATION_ID = MPV.PROJECT_COST_ACCOUNT
     AND GCCK19.CODE_COMBINATION_ID = MPV.DEFERRED_COGS_ACCOUNT
     ---AND GCCK6.CODE_COMBINATION_ID = MPV.EXPENSE_ACCOUNT
     AND FCL.LOOKUP_CODE(+)         = MPV.DEF_DEMAND_DUMMY
     AND FCL.LOOKUP_TYPE(+)         ='DEMAND_CLASS'
     AND L1.LOOKUP_CODE  = MPV.SOURCE_TYPE
     AND L1.LOOKUP_TYPE  = 'MTL_SOURCE_TYPES'
     AND MP.MASTER_ORGANIZATION_ID = OOD.ORGANIZATION_ID(+)
     AND MPV.ORGANIZATION_ID = CCT.ORGANIZATION_ID
     AND L2.LOOKUP_CODE  = MPV.LOT_NUMBER_GENERATION
     AND L2.LOOKUP_TYPE  = 'MTL_SERIAL_GENERATION'
     AND L3.LOOKUP_CODE     = MPV.ENCUMBRANCE_REVERSAL_FLAG
     AND L3.LOOKUP_TYPE     = 'SYS_YES_NO'
     AND L4.LOOKUP_CODE(+)= MPV.LOT_NUMBER_ZERO_PADDING  
     AND L4.LOOKUP_TYPE  = 'SYS_YES_NO'
     AND L5.LOOKUP_CODE(+)= MPV.PM_COST_COLLECTION_ENABLED  
     AND L5.LOOKUP_TYPE  = 'SYS_YES_NO'
     AND FLV.LOOKUP_CODE(+) = BR.RESOURCE_CODE
     AND FLV.LOOKUP_TYPE(+)    = 'BOM_RESOURCE_TYPE' 
     AND FLV.LANGUAGE(+)    =   USERENV('LANG')
     and MPV.DEFAULT_ATP_RULE_ID = MAR.RULE_ID(+)
     AND WRV.RULE_ID (+)                                    = MPV.DEFAULT_PICKING_RULE_ID
     AND L6.LOOKUP_CODE(+)= MPV.DEFER_LOGICAL_TRANSACTIONS  
     AND L6.LOOKUP_TYPE(+)  = 'SYS_YES_NO'
     AND L7.LOOKUP_CODE    = MPV.MO_PICK_CONFIRM_REQUIRED
     AND L7.LOOKUP_TYPE    = 'SYS_YES_NO'
     AND (L8.LOOKUP_CODE                                     = MPV.PRIMARY_COST_METHOD
     AND L8.LOOKUP_TYPE                                      = 'MTL_PRIMARY_COST')
     ;



select * from gl_code_combinations_kfv;