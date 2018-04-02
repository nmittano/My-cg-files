select
ood.organization_code ORG_CODE,
a.master_organization_id MASTER_ORG_ID,
o1.organization_code MASTER_ORG_CD,
o1.organization_name MASTER_ORG_NM,
a.cost_organization_id COST_ORG_ID,
o2.organization_code COST_ORG_CD,
o2.organization_name COST_ORG_NM,
a.source_organization_id SOURCE_ORG_ID,
o3.organization_code SOURCE_ORG_CD,
o3.organization_name SOURCE_ORG_NM,
mfg1.meaning PRIMARY_COST_METHOD,
mfg2.meaning NEGATIVE_BALANCE,
mfg11.meaning GL_UPDATE_CODE,
a.calendar_code CALENDAR_CODE,
a.default_demand_class DEFAULT_DEMAND_CLASS,
mfg12.meaning ENCUMBRANCE_REVERSAL_FLAG,
mfg3.meaning LOCATOR_CONTROL,
mfg4.meaning INTERORG_TRANSFER_CODE,
DECODE(a.maintain_fifo_qty_stack_type, NULL,'',mfg6.meaning)
MAINTAIN_FIFO_COST,
mfg7.meaning SERIAL_NUMBER_TYPE,
mfg8.meaning LOT_NUMBER_UNIQUENESS,
mfg9.meaning LOT_NUMBER_GENERATION,
DECODE(a.LOT_NUMBER_ZERO_PADDING, NULL, '' ,
mfg10.meaning)
LOT_NUMBER_ZERO_PADDING,
b.rule_name ATP_RULE_NAME,
c.picking_rule_name PICKING_RULE_NAME,
a.default_locator_order_value,
a.default_subinv_order_value,
a.interorg_trnsfr_charge_percent intorg_charge_percent,
a.auto_serial_alpha_prefix,
a.start_auto_serial_number,
a.auto_lot_alpha_prefix,
a.lot_number_length,
mfg13.meaning SERIAL_GENERATION,
mfg14.meaning SOURCE_TYPE,
a.source_subinventory SOURCE_SUBINV
from
mtl_parameters a,
mtl_atp_rules b,
mtl_picking_rules c,
org_organization_definitions ood,
org_organization_definitions o1,
org_organization_definitions o2,
org_organization_definitions o3,
mfg_lookups mfg1,
mfg_lookups mfg2,
mfg_lookups mfg3,
mfg_lookups mfg4,
mfg_lookups mfg6,
mfg_lookups mfg7,
mfg_lookups mfg8,
mfg_lookups mfg9,
mfg_lookups mfg10,
mfg_lookups mfg11,
mfg_lookups mfg12,
mfg_lookups mfg13,
mfg_lookups mfg14
where a.organization_id = 207
and a.master_organization_id = o1.organization_id (+)
and a.cost_organization_id = o2.organization_id (+)
and a.source_organization_id = o3.organization_id (+)
and a.organization_id = ood.organization_id (+)
and a.default_atp_rule_id = b.rule_id(+)
and a.default_picking_rule_id = c.picking_rule_id(+)
and mfg1.lookup_type (+) = 'MTL_PRIMARY_COST'
and a.primary_cost_method = mfg1.lookup_code(+)
and mfg2.lookup_type (+) = 'SYS_YES_NO'
and a.negative_inv_receipt_code = mfg2.lookup_code(+)
and mfg3.lookup_type (+) = 'MTL_LOCATION_CONTROL'
and a.stock_locator_control_code = mfg3.lookup_code(+)
and mfg4.lookup_type (+) = 'MTL_INTER_INV_TRANSFER'
and a.matl_interorg_transfer_code = mfg4.lookup_code(+)
and mfg6.lookup_type (+) = 'SYS_YES_NO'
and a.maintain_fifo_qty_stack_type = mfg6.lookup_code(+)
and mfg7.lookup_type (+) = 'MTL_SERIAL_NUMBER_TYPE'
and a.serial_number_type = mfg7.lookup_code(+)
and mfg8.lookup_type (+) = 'MTL_LOT_UNIQUENESS'
and a.lot_number_uniqueness = mfg8.lookup_code(+)
and mfg9.lookup_type (+) = 'MTL_LOT_GENERATION'
and a.lot_number_generation = mfg9.lookup_code(+)
and mfg10.lookup_type (+) = 'SYS_YES_NO'
and a.lot_number_zero_padding = mfg10.lookup_code(+)
and mfg11.lookup_type (+) = 'SYS_YES_NO'
and a.general_ledger_update_code = mfg11.lookup_code(+)
and mfg12.lookup_type (+) = 'SYS_YES_NO'
and a.encumbrance_reversal_flag = mfg12.lookup_code(+)
and mfg13.lookup_type (+) = 'MTL_SERIAL_GENERATION'
and a.serial_number_generation = mfg13.lookup_code(+)
and mfg14.lookup_type (+) = 'MTL_SOURCE_TYPES'
and a.source_type = mfg14.lookup_code (+);