SELECT A.ROWID ROW_ID ,
  A.ORGANIZATION_ID ,
  A.LAST_UPDATE_DATE,
  A.LAST_UPDATED_BY ,
  A.CREATION_DATE ,
  A.CREATED_BY ,
  A.LAST_UPDATE_LOGIN,
  A.MASTER_ORGANIZATION_ID ,
  A.PRIMARY_COST_METHOD ,
  A.COST_ORGANIZATION_ID,
  A.DEFAULT_MATERIAL_COST_ID ,
  A.CALENDAR_EXCEPTION_SET_ID,
  A.CALENDAR_CODE ,
  A.GENERAL_LEDGER_UPDATE_CODE ,
  A.DEFAULT_ATP_RULE_ID,
  A.DEFAULT_PICKING_RULE_ID ,
  A.DEFAULT_LOCATOR_ORDER_VALUE ,
  A.DEFAULT_SUBINV_ORDER_VALUE ,
  A.NEGATIVE_INV_RECEIPT_CODE ,
  A.STOCK_LOCATOR_CONTROL_CODE ,
  A.MATERIAL_ACCOUNT ,
  A.MATERIAL_OVERHEAD_ACCOUNT ,
  A.MATL_OVHD_ABSORPTION_ACCT ,
  A.RESOURCE_ACCOUNT ,
  A.PURCHASE_PRICE_VAR_ACCOUNT ,
  A.AP_ACCRUAL_ACCOUNT ,
  A.OVERHEAD_ACCOUNT ,
  A.OUTSIDE_PROCESSING_ACCOUNT ,
  A.INTRANSIT_INV_ACCOUNT ,
  A.INTERORG_RECEIVABLES_ACCOUNT ,
  A.INTERORG_PRICE_VAR_ACCOUNT ,
  A.INTERORG_PAYABLES_ACCOUNT ,
  A.COST_OF_SALES_ACCOUNT ,
  A.ENCUMBRANCE_ACCOUNT ,
  A.INTERORG_TRANSFER_CR_ACCOUNT ,
  A.MATL_INTERORG_TRANSFER_CODE ,
  A.INTERORG_TRNSFR_CHARGE_PERCENT ,
  A.MAINTAIN_FIFO_QTY_STACK_TYPE ,
  A.SOURCE_ORGANIZATION_ID ,
  A.SOURCE_SUBINVENTORY ,
  A.SOURCE_TYPE ,
  A.SERIAL_NUMBER_TYPE ,
  A.AUTO_SERIAL_ALPHA_PREFIX ,
  A.START_AUTO_SERIAL_NUMBER ,
  A.AUTO_LOT_ALPHA_PREFIX ,
  A.LOT_NUMBER_UNIQUENESS ,
  A.LOT_NUMBER_GENERATION ,
  A.LOT_NUMBER_ZERO_PADDING ,
  A.LOT_NUMBER_LENGTH ,
  A.STARTING_REVISION ,
  A.ATTRIBUTE_CATEGORY ,
  A.ATTRIBUTE1 ,
  A.ATTRIBUTE2 ,
  A.ATTRIBUTE3 ,
  A.ATTRIBUTE4 ,
  A.ATTRIBUTE5 ,
  A.ATTRIBUTE6 ,
  A.ATTRIBUTE7 ,
  A.ATTRIBUTE8 ,
  A.ATTRIBUTE9 ,
  A.ATTRIBUTE10 ,
  A.ATTRIBUTE11 ,
  A.ATTRIBUTE12 ,
  A.ATTRIBUTE13 ,
  A.ATTRIBUTE14 ,
  A.ATTRIBUTE15 ,
  A.DEFAULT_DEMAND_CLASS ,
  A.INVOICE_PRICE_VAR_ACCOUNT ,
  A.ENCUMBRANCE_REVERSAL_FLAG ,
  A.AVERAGE_COST_VAR_ACCOUNT ,
  A.ORGANIZATION_CODE ,
  A.SALES_ACCOUNT ,
  A.EXPENSE_ACCOUNT ,
  A.SERIAL_NUMBER_GENERATION ,
  A.REQUEST_ID ,
  A.PROGRAM_APPLICATION_ID ,
  A.PROGRAM_ID ,
  A.PROGRAM_UPDATE_DATE ,
  A.PROJECT_REFERENCE_ENABLED ,
  A.PM_COST_COLLECTION_ENABLED ,
  A.PROJECT_CONTROL_LEVEL ,
  A.AVG_RATES_COST_TYPE_ID ,
  A.TXN_APPROVAL_TIMEOUT_PERIOD ,
  B.MEANING DEF_DEMAND_DUMMY ,
  D.MEANING PRIMARY_COST_DUMMY ,
  E.RESOURCE_CODE DEFAULT_MATERIAL_SUB ,
  F.RULE_NAME DEFAULT_ATP_RULE ,
  WRV.NAME DEFAULT_PICKING_RULE,
  HH.ORGANIZATION_CODE SOURCE_ORGANIZATION_CODE ,
  HT.NAME SOURCE_ORGANIZATION_NAME ,
  IT.NAME MASTER_ORG ,
  A.BORRPAY_MATL_VAR_ACCOUNT ,
  A.BORRPAY_MOH_VAR_ACCOUNT ,
  A.BORRPAY_RES_VAR_ACCOUNT ,
  A.BORRPAY_OSP_VAR_ACCOUNT ,
  A.BORRPAY_OVH_VAR_ACCOUNT ,
  A.MO_SOURCE_REQUIRED ,
  A.MO_APPROVAL_TIMEOUT_ACTION ,
  A.MO_PICK_CONFIRM_REQUIRED ,
  A.ORG_MAX_WEIGHT ,
  A.ORG_MAX_WEIGHT_UOM_CODE ,
  A.ORG_MAX_VOLUME ,
  A.ORG_MAX_VOLUME_UOM_CODE ,
  A.PROJECT_COST_ACCOUNT ,
  A.PROCESS_ENABLED_FLAG ,
  A.PROCESS_ORGN_CODE ,
  A.WSM_ENABLED_FLAG ,
  A.DEFAULT_COST_GROUP_ID ,
  A.LPN_PREFIX ,
  A.LPN_SUFFIX ,
  A.LPN_STARTING_NUMBER ,
  A.WMS_ENABLED_FLAG ,
  A.PREGEN_PUTAWAY_TASKS_FLAG ,
  A.REGENERATION_INTERVAL ,
  A.TIMEZONE_ID ,
  A.DEFAULT_WMS_PICKING_RULE_ID,
  A.DEFAULT_PUT_AWAY_RULE_ID ,
  A.DEFAULT_CARTON_RULE_ID ,
  A.DEFAULT_CYC_COUNT_HEADER_ID ,
  A.CROSSDOCK_FLAG ,
  A.CARTONIZATION_FLAG ,
  A.GLOBAL_ATTRIBUTE_CATEGORY ,
  A.GLOBAL_ATTRIBUTE1 ,
  A.GLOBAL_ATTRIBUTE2 ,
  A.GLOBAL_ATTRIBUTE3 ,
  A.GLOBAL_ATTRIBUTE4 ,
  A.GLOBAL_ATTRIBUTE5 ,
  A.GLOBAL_ATTRIBUTE6 ,
  A.GLOBAL_ATTRIBUTE7 ,
  A.GLOBAL_ATTRIBUTE8 ,
  A.GLOBAL_ATTRIBUTE9 ,
  A.GLOBAL_ATTRIBUTE10 ,
  A.GLOBAL_ATTRIBUTE11 ,
  A.GLOBAL_ATTRIBUTE12 ,
  A.GLOBAL_ATTRIBUTE13 ,
  A.GLOBAL_ATTRIBUTE14 ,
  A.GLOBAL_ATTRIBUTE15 ,
  A.GLOBAL_ATTRIBUTE16 ,
  A.GLOBAL_ATTRIBUTE17 ,
  A.GLOBAL_ATTRIBUTE18 ,
  A.GLOBAL_ATTRIBUTE19 ,
  A.GLOBAL_ATTRIBUTE20 ,
  A.COST_CUTOFF_DATE ,
  A.ALLOCATE_SERIAL_FLAG ,
  A.default_pick_task_type_id ,
  A.default_cc_task_type_id ,
  A.default_putaway_task_type_id ,
  A.default_repl_task_type_id ,
  A.EAM_ENABLED_FLAG ,
  A.default_moissue_task_type_id ,
  A.default_moxfer_task_type_id ,
  A.MAINT_ORGANIZATION_ID ,
  A.PRIORITIZE_WIP_JOBS ,
  A.DEFAULT_CROSSDOCK_SUBINVENTORY ,
  A.SKIP_TASK_WAITING_MINUTES ,
  A.QA_SKIPPING_INSP_FLAG ,
  A.DEFAULT_CROSSDOCK_LOCATOR_ID ,
  A.DEFAULT_MATL_OVHD_COST_ID ,
  A.DISTRIBUTED_ORGANIZATION_FLAG ,
  A.CARRIER_MANIFESTING_FLAG ,
  A.DISTRIBUTION_ACCOUNT_ID ,
  A.DIRECT_SHIPPING_ALLOWED ,
  A.DEFAULT_PICK_OP_PLAN_ID ,
  A.MAX_CLUSTERS_ALLOWED,
  A.CARTONIZE_SALES_ORDERS ,
  A.CARTONIZE_MANUFACTURING ,
  A.WIP_OVERPICK_ENABLED ,
  A.OVPK_TRANSFER_ORDERS_ENABLED ,
  A.TOTAL_LPN_LENGTH ,
  A.UCC_128_SUFFIX_FLAG ,
  A.DEFER_LOGICAL_TRANSACTIONS,
  A.AUTO_DEL_ALLOC_FLAG,
  A.PARENT_CHILD_GENERATION_FLAG,
  A.CHILD_LOT_ZERO_PADDING_FLAG,
  A.CHILD_LOT_ALPHA_PREFIX,
  A.CHILD_LOT_NUMBER_LENGTH,
  A.CHILD_LOT_VALIDATION_FLAG,
  A.COPY_LOT_ATTRIBUTE_FLAG ,
  A.CREATE_LOT_UOM_CONVERSION,
  A.ALLOW_DIFFERENT_STATUS,
  A.RULES_OVERRIDE_LOT_RESERVATION,
  A.GENEALOGY_FORMULA_SECURITY,
  A.RFID_VERIF_PCNT_THRESHOLD,
  A.WCS_ENABLED ,
  A.YARD_MANAGEMENT_ENABLED_FLAG ,
  A.TRADING_PARTNER_ORG_FLAG ,
  A.DEFERRED_COGS_ACCOUNT ,
  A.DEFAULT_CROSSDOCK_CRITERIA_ID ,
  A.ENFORCE_LOCATOR_ALIS_UNQ_FLAG ,
  A.EPC_GENERATION_ENABLED_FLAG ,
  A.COMPANY_PREFIX ,
  A.COMPANY_PREFIX_INDEX ,
  A.COMMERCIAL_GOVT_ENTITY_NUMBER ,
  A.LABOR_MANAGEMENT_ENABLED_FLAG ,
  WCCVL.CRITERION_NAME ,
  A.DEFAULT_STATUS_ID ,
  A.LCM_ENABLED_FLAG ,
  A.LCM_VAR_ACCOUNT ,
  A.OPSM_ENABLED_FLAG ,
  A.ALLOCATE_LOT_FLAG ,
  A.CAT_WT_ACCOUNT
FROM MTL_PARAMETERS A,
  HR_ORG_UNITS_NO_JOIN HC,
  MTL_PARAMETERS HH,
  FND_COMMON_LOOKUPS B,
  MFG_LOOKUPS D,
  BOM_RESOURCES E,
  MTL_ATP_RULES F,
  HR_ALL_ORGANIZATION_UNITS_TL HT,
  HR_ALL_ORGANIZATION_UNITS I,
  HR_ALL_ORGANIZATION_UNITS_TL IT,
  CST_COST_GROUPS CST,
  WMS_RULES_VL WRV,
  WMS_CROSSDOCK_CRITERIA_VL WCCVL
WHERE I.ORGANIZATION_ID                                = A.MASTER_ORGANIZATION_ID
AND I.ORGANIZATION_ID                                  = IT.ORGANIZATION_ID
AND IT.LANGUAGE                                        = USERENV('LANG')
AND HC.ORGANIZATION_ID (+)                             = A.SOURCE_ORGANIZATION_ID
AND HC.ORGANIZATION_ID                                 = HT.ORGANIZATION_ID (+)
AND DECODE(HT.ORGANIZATION_ID, NULL, '1', HT.LANGUAGE) = DECODE(HT.ORGANIZATION_ID , NULL, '1', USERENV('LANG'))
AND HH.ORGANIZATION_ID (+)                             = HC.ORGANIZATION_ID
AND B.APPLICATION_ID (+)                               = 700
AND B.LOOKUP_CODE (+)                                  = A.DEFAULT_DEMAND_CLASS
AND B.LOOKUP_TYPE (+)                                  = 'DEMAND_CLASS'
AND (D.LOOKUP_CODE                                     = A.PRIMARY_COST_METHOD
AND D.LOOKUP_TYPE                                      = 'MTL_PRIMARY_COST')
AND E.RESOURCE_ID (+)                                  = A.DEFAULT_MATERIAL_COST_ID
AND F.RULE_ID (+)                                      = A.DEFAULT_ATP_RULE_ID
AND WRV.RULE_ID (+)                                    = A.DEFAULT_PICKING_RULE_ID
AND A.DEFAULT_COST_GROUP_ID                            = CST.COST_GROUP_ID(+)
AND A.DEFAULT_CROSSDOCK_CRITERIA_ID                    = WCCVL.CRITERION_ID(+);
