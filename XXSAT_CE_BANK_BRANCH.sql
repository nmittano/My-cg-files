SELECT 
    FTV.TERRITORY_SHORT_NAME                  "Bank Country",
    ABB.BANK_NAME                             "Bank Name",
    ABB.BANK_BRANCH_NAME                      "Branch Name",
    ABB.BANK_BRANCH_NAME_ALT                  "Alt Branch Name",
    ABB.BRANCH_NUMBER                         "Branch Number",
    ABB.EFT_SWIFT_CODE                        "BIC",
    ABB.BANK_BRANCH_TYPE                      "Branch Type",
    ABB.EDI_ID_NUMBER                         "EDI Location",
    ABB.EFT_USER_NUMBER                       "EFT Number",
    ABB.DESCRIPTION                           "Description",
    UBR.RFC_CODE                              "Rfc Identifier",
    ABB.END_DATE                              "Inactive Date",
    HZP.PARTY_NAME                            "Party Owner",
    (SELECT TERRITORY_SHORT_NAME 
    FROM FND_TERRITORIES_TL 
    WHERE LANGUAGE = USERENV('LANG') 
    AND TERRITORY_CODE = ABB.COUNTRY) 		COUNTRY,	
	(ABB.ADDRESS_LINE1||NVL2(ABB.ADDRESS_LINE2,(','||ABB.ADDRESS_LINE2),ABB.ADDRESS_LINE2)
	||NVL2(ABB.ADDRESS_LINE3,(','||ABB.ADDRESS_LINE3),ABB.ADDRESS_LINE3)
	||NVL2(ABB.ADDRESS_LINE4,(','||ABB.ADDRESS_LINE4),ABB.ADDRESS_LINE4))	ADDRESS,	
    ABB.CITY                                  "City",
    ABB.PROVINCE                              "Province",
    ABB.STATE                                 "State",
    BB.COUNTY                                 "County",
    ABB.ZIP                                   "Postal Code",
    ABB.ADDRESS_LINE1                         "Alt Address"
FROM
    CE_BANK_BRANCHES_V ABB,
    FND_TERRITORIES_TL FTV,
    HZ_PARTIES   HZP,
    CE_UPG_BANK_REC  UBR,
    CEFV_BANK_BRANCHES BB
WHERE
      FTV.TERRITORY_CODE	=   ABB.BANK_HOME_COUNTRY
AND FTV.LANGUAGE			=	USERENV('LANG')
AND HZP.PARTY_ID(+)       	=   ABB.BANK_PARTY_ID
AND ABB.PK_ID             	=   UBR.PARTY_ID(+)
AND BB.BANK_BRANCH_ID(+)  	=   ABB.BRANCH_PARTY_ID
--AND ABB.BANK_BRANCH_NAME ='321171184'
ORDER BY 1,2
;