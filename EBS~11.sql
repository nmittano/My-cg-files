select * from MTL_SYSTEM_ITEMS_B;
SELECT * FROM GL_CODE_COMBINATIONS;
select * from BOM_DEPARTMENT_RESOURCES;
select * from BOM_EAM_DEPT_APPROVERS;
SELECT * FROM FND_LOOKUP_VALUES FLV_1;
SELECT * FROM MFG_LOOKUPS;
SELECT * FROM AR_LOOKUPS;
SELECT * FROM PA_LOOKUPS;
SELECT * FROM FND_LOOKUP_VALUES;
select * from fnd_lookup_types;
SELECT * FROM HR_LOOKUPS;
SELECT * FROM CE_LOOKUPS;
SELECT * FROM FND_LOOKUPS;
SELECT * FROM BOM_RESOURCES_V;
SELECT * FROM FND_COMMON_LOOKUPS;
SELECT * FROM IGS_LOOKUPS_IND;
SELECT * FROM org_organization_definitions;
select resource_code, resource_id, description 
from bom_resources 
where cost_element_id = 1 
----and organization_id = nvl(:inv_param.cost_organization_id, :parameter.org_id) 
and nvl(disable_date, sysdate+1) > sysdate order by resource_code;
select * from MTL_SERIAL_NUMBERS ;
select * from MTL_PARAMETERS;
SELECT * FROM mtl_material_statuses_vl;
/*GL_CODE_COMBINATIONS MTL_SYSTEM_ITEMS_B
code_combination_id = cost_of_sales_account
*/