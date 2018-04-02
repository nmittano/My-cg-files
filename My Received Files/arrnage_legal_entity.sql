SELECT 
  RegistrationEO.TAX_CLASSIFICATION_CODE "Tax Classification",
  decode(RegistrationEO.SELF_ASSESS_FLAG, 'Y','Yes','N','No') "Self Assesment",
  DECODE(XLR.IDENTIFYING_FLAG, 'Y','Yes','N','No') "Identifier Address",
  EntityProfileEO.LEGAL_ENTITY_ID,
  EntityProfileEO.PARTY_ID,
  EntityProfileEO.LEGAL_ENTITY_IDENTIFIER "Legal Entity Identifier",
  EntityProfileEO.NAME "Legal Entity Name",
  XLR.REGISTRATION_NUMBER "Registration Number",
  XLJ.REGISTRATION_CODE_LE "Legal Reg. Code",
  XLJ.REGISTRATION_CODE_ETB "Estb. Reg. Code",
  XLR.REGISTERED_NAME "Registered Name",
  XLR.ALTERNATE_REGISTERED_NAME "Alt. Registered Name",
  XLR.EFFECTIVE_FROM "Reg. Effective from",
  XLR.EFFECTIVE_TO "Reg. Effective To",
  XLR.PLACE_OF_REGISTRATION "Place Registration",
  (select HZOrganizations.ORGANIZATION_NAME from HZ_ORGANIZATION_PROFILES HZOrganizations where HZOrganizations.EFFECTIVE_END_DATE IS NULL AND HZOrganizations.PARTY_ID(+) = XLR.ISSUING_AUTHORITY_ID) "Issuing legal auth.",
  XLJ.Name "Reg. Name",
  decode(EstablishmentEO.MAIN_ESTABLISHMENT_FLAG,'N','No','Y','Yes') "Main Estb.",
   EntityProfileEO.GEOGRAPHY_ID,
  EstablishmentEO.NAME "Estb. Name",
--  EstablishmentEO.PLACE_OF_REGISTRATION "Place Of Regt.",
  (select DECODE(SIGN(sysdate - EstablishmentEO.EFFECTIVE_FROM), -1, lkp1.MEANING, DECODE(SIGN(EstablishmentEO.EFFECTIVE_TO - sysdate), -1, lkp1.MEANING, lkp2.MEANING)) FROM XLE_LOOKUPS lkp1, XLE_LOOKUPS lkp2 
  where (lkp1.LOOKUP_TYPE = 'XLE_YES_NO' AND lkp1.LOOKUP_CODE = 'N') 
  AND (lkp2.LOOKUP_TYPE = 'XLE_YES_NO' AND lkp2.LOOKUP_CODE = 'Y')) "Active",
  EstablishmentEO.ACTIVITY_CODE "Registered Activity",
  decode(EntityProfileEO.TRANSACTING_ENTITY_FLAG,'Y','Yes','N','No') "Transacting Entity",
  EntityProfileEO.EFFECTIVE_FROM "Inception Date",
  EntityProfileEO.EFFECTIVE_TO "End Date",
  EntityProfileEO.ACTIVITY_CODE "NAICS 1997",
  hll.address_line_1 "Address Line 1",
  hll.address_line_2 "Address Line 2",
  hll.address_line_3 "Address Line 3",
  hll.town_or_city "City",
  hll.region_1 "County",
  hll.region_2 "State",
  hll.postal_code "Zip Code",
  hll.country "Country",
  hll.location_code "Location Code",
  hll.telephone_number_1 "Telephone",
  hll.telephone_number_2 "Fax",
  hll.loc_information13 "Sales Tax Override",
  hll.loc_information14 "Inside City Limits",
  hll.loc_information17 "Payroll Tax State",
  hll.loc_information18 "Payroll Tax City",
  hll.loc_information19"Payroll Tax Zip",
  hll.loc_information20 "Payroll Tax Zip",
  (SELECT TERRITORY_SHORT_NAME
  FROM fnd_territories_vl
  WHERE TERRITORY_CODE=hll.country
  ) Location,
  EntityProfileEO.TYPE_OF_COMPANY,
  hzo.ORGANIZATION_NAME "Organization Name",
  hzg.GEOGRAPHY_NAME "Territory",
  XLJ.NAME "Jurisdiction",
  XLR.REGISTRATION_NUMBER  "Registration Number",
  XLR.REGISTERED_NAME "Registered Name",
  XLR.ALTERNATE_REGISTERED_NAME "Alternate Registered Name",
  XLR.EFFECTIVE_FROM "Registration Effective From",
  XLR.EFFECTIVE_TO "Registration Effective To",
  XLR.PLACE_OF_REGISTRATION "Place Of Registration",
  XLR.ATTRIBUTE_CATEGORY "Flex Field",
  DECODE(XLR.SOURCE_TABLE, 'XLE_ENTITY_PROFILES', XLJ.REGISTRATION_CODE_LE, 'XLE_ETB_PROFILES', NVL(XLJ.REGISTRATION_CODE_ETB, 'RN')) "Code",
  HzPuiPartySiteEO.identifying_address_flag "Identifying Address",
  EstablishmentEO.NAME "Name",
  DECODE(NVL(hll.ADDRESS_LINE_1,'*'),'*','',hll.ADDRESS_LINE_1||' ')|| DECODE(NVL(hll.ADDRESS_LINE_2,'*'),'*','',hll.ADDRESS_LINE_2||' ')|| DECODE(NVL(hll.ADDRESS_LINE_3,'*'),'*','',hll.ADDRESS_LINE_3||' ')  || DECODE(NVL(hll.TOWN_OR_CITY,'*'),'*','',hll.TOWN_OR_CITY  ||' ')  || DECODE(NVL(hll.REGION_2,'*'),'*','',hll.REGION_2  ||' ')  || hll.POSTAL_CODE "Registered Address",
  HzOrgProfiles.PARTY_NUMBER "Organization Number"
FROM XLE_ENTITY_PROFILES EntityProfileEO,
  HZ_ORGANIZATION_PROFILES hzo,
  HZ_PARTIES hzp,
  HZ_GEOGRAPHIES hzg,
  hr_locations_all hll,
  XLE_REGISTRATIONS XLR,
  XLE_JURISDICTIONS_VL XLJ,
  ZX_REGISTRATIONS RegistrationEO,
  XLE_ETB_PROFILES EstablishmentEO,
--  FND_TERRITORIES_VL ftp,
  XLE_LOOKUPS XLKP,
  hz_party_sites HzPuiPartySiteEO,
  HZ_ORG_PROFILES_CPUI_V HzOrgProfiles
--  FND_TERRITORIES_VL FTL,
--  FND_TERRITORIES_VL FT
WHERE EntityProfileEO.PARTY_ID      = hzo.PARTY_ID
AND hzo.PARTY_ID                    = hzp.PARTY_ID
AND hzg.GEOGRAPHY_ID                = EntityProfileEO.GEOGRAPHY_ID
AND XLR.location_id               = hll.location_id
AND XLJ.geography_id              = hzg.geography_id
AND XLJ.jurisdiction_id           = XLR.Jurisdiction_id
AND XLJ.identifying_flag          = 'Y'
--AND HZG.country_code              = ftp.territory_code
AND XLR.source_table              = 'XLE_ENTITY_PROFILES'
--AND FT.territory_code             = hll.COUNTRY
AND XLKP.LOOKUP_TYPE           = 'XLE_LEGAL_TYPE'
AND XLKP.lookup_code              = 'LEGAL_ENTITY'
--AND FTL.territory_code            = hll.LOC_INFORMATION17
AND XLR.source_id                 = EntityProfileEO.LEGAL_ENTITY_ID
and EntityProfileEO.legal_entity_id = EstablishmentEO.legal_entity_id
and RegistrationEO.LEGAL_LOCATION_ID(+) = hll.LOCATION_ID 
and hzp.party_id                   = HzPuiPartySiteEO.party_id
AND EntityProfileEO.PARTY_ID       =HzOrgProfiles.PARTY_ID
;