 SELECT     
            loc.country "Country",
			BankParty.party_name "Bank Name"                              ,
			BranchParty.PARTY_NAME "Branch Name"                          ,
			decode(BankAccountEO.AP_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Payables",
			decode(BankAccountEO.PAY_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Payroll",
            decode(BankAccountEO.AR_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Receivables",
            decode(BankAccountEO.XTR_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Treasury",
			BankAccountEO.BANK_ACCOUNT_NAME "Account Name"                ,
			BankAccountEO.BANK_ACCOUNT_NAME_ALT "Alternate Account Name"  ,
			BankAccountEO.SHORT_ACCOUNT_NAME "Legal Account Name"         ,
			BankAccountEO.BANK_ACCOUNT_NUM "Account Number"               ,
			BankAccountEO.check_digits "Check Digit"                      ,
			BankAccountEO.CURRENCY_CODE "Currency"                        ,
			decode(BankAccountEO.Payment_Multi_Currency_Flag,'Y','Yes','N','No') "Multiple Currency Allowed",
			BankAccountEO.iban_number "IBAN"                              ,
			BankAccountEO.bank_account_type "Account Type"                ,
			BankAccountEO.account_suffix "Account Suffix"                 ,
			BankAccountEO.EFT_REQUESTER_IDENTIFIER "EFT Number"           ,
			BankAccountEO.SECONDARY_ACCOUNT_REFERENCE "Secondary Account" ,
			BankAccountEO.ACCOUNT_HOLDER_NAME "Account Holder"            ,
			BankAccountEO.ACCOUNT_HOLDER_NAME_ALT "Alternate Account Holder",
			BankAccountEO.description    "Description"                               ,
			BankAccountEO.start_date    "Start Date"                              ,
            BankAccountEO.end_date    "End Date"                                     ,
			HzPuiOrgContactsEOEx.attribute_category "Context Value",
			BankAccountEO.Attribute1 "CE_BANK_ACCOUNTS_ATTR1"      ,
			BankAccountEO.Attribute2 "CE_BANK_ACCOUNTS_ATTR2"      ,
			BankAccountEO.Attribute3 "CE_BANK_ACCOUNTS_ATTR3"      ,
			BankAccountEO.Attribute4 "CE_BANK_ACCOUNTS_ATTR4"   ,
			BankAccountEO.Attribute5 "CE_BANK_ACCOUNTS_ATTR5"        ,
			BankAccountEO.Attribute6 "CE_BANK_ACCOUNTS_ATTR6"       ,
			BankAccountEO.Attribute7 "CE_BANK_ACCOUNTS_ATTR7"        ,
			BankAccountEO.Attribute8 "CE_BANK_ACCOUNTS_ATTR8"        , 
			BankAccountEO.Attribute9 "CE_BANK_ACCOUNTS_ATTR9"          , 
			BankAccountEO.Attribute10 "CE_BANK_ACCOUNTS_ATTR10"      ,
			BankAccountEO.Attribute11 "CE_BANK_ACCOUNTS_ATTR11"       ,
			BankAccountEO.Attribute12 "CE_BANK_ACCOUNTS_ATTR12"      ,
			BankAccountEO.Attribute13 "CE_BANK_ACCOUNTS_ATTR13"         ,
			BankAccountEO.Attribute14 "CE_BANK_ACCOUNTS_ATTR14"       ,
			BankAccountEO.Attribute15 "CE_BANK_ACCOUNTS_ATTR15"         ,
			(SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.CASH_CLEARING_CCID) "Cash Account",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.CASH_CLEARING_CCID) "Cash Clearing",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.BANK_CHARGES_CCID) "Bank Charges",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.BANK_ERRORS_CCID) "Bank Errors" ,
			(SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.FX_CHARGE_CCID) "Foreign Exchange Charges" ,
			BankAccountEO.agency_location_code "Agency Location Code",
			decode(BankAccountEO.NETTING_ACCT_FLAG,'Y','Yes','N','No') "Netting Account" ,
			BankAccountEO.MIN_TARGET_BALANCE "Minimum Target Balance"     ,
			BankAccountEO.CASHPOOL_MIN_PAYMENT_AMT "Minimum Payment Amount" ,
			BankAccountEO.CASHPOOL_ROUND_FACTOR "Rounding Factor"   ,
			BankAccountEO.Cashflow_Display_Order  "Cash Flow Display"
			------Multiple Currency PAyments
			Decode(BankAccountEO.POOLED_FLAG,'Y','Yes','N','No') "Pooled Account",
			BankAccountEO.Min_Check_Amount "Minimum Payment",
			decode(BankAccountEO.Zero_Amount_Allowed,'Y','Yes','N','No') "Allow Zero Payments",
			BankAccountEO.Max_Outlay "Maximum Outlay",
			BankAccountEO.Max_Check_Amount "Maximum Payment",
			decode(BankAccountEO.Receipt_Multi_Currency_Flag,'Y','Yes','N','No') "Multiple Currency Receipts",
			decode(BankAccountEO.Autorecon_Ap_Matching_Order,'T','Transaction','G','Group','B','Batch') "Payables Matching Order 1",
            decode(BankAccountEO.Autorecon_Ap_Matching_Order2,'T','Transaction','G','Group','B','Batch') "Payables Matching Order 2",
			decode(BankAccountEO.Stmt_Line_Float_Handling_Flag,'I','Ignore','E','Error') "Float Handling",
			decode(BankAccountEO.Autorecon_Ar_Matching_Order,'T','Transaction','SB','Settlement Batch','B','Batch','P','PSON','G','Settlement Group') "Receivables Matching Order 1",
            decode(BankAccountEO.Autorecon_Ar_Matching_Order2,'T','Transaction','SB','Settlement Batch','B','Batch','P','PSON','G','Settlement Group') "Receivables Matching Order 2",
            decode(BankAccountEO.Autorecon_Ar_Matching_Order3,'T','Transaction','SB','Settlement Batch','B','Batch','P','PSON','G','Settlement Group') "Receivables Matching Order 3",
            decode(BankAccountEO.Autorecon_Ar_Matching_Order4,'T','Transaction','SB','Settlement Batch','B','Batch','P','PSON','G','Settlement Group') "Receivables Matching Order 4",
            decode(BankAccountEO.Autorecon_Ar_Matching_Order5,'T','Transaction','SB','Settlement Batch','B','Batch','P','PSON','G','Settlement Group') "Receivables Matching Order 5",
			BankAccountEO.Recon_Foreign_Bank_Xrate_Type "Exchange Rate Type",
            BankAccountEO.Recon_For_Bank_Xrate_Date_Type "Exchange Rate Date",
			decode(BankAccountEO.Recon_Enable_Oi_Flag,'Y','Yes','N','No') "Use Recon Open Interfaces",
			BankAccountEO.Recon_Oi_Float_Status "Float Status",
            decode(BankAccountEO.Recon_Oi_Matching_Code,'T','Transaction Number','D','Date and Amount') "Open Interface Match Criteria",
            BankAccountEO.Recon_Oi_Cleared_Status "Clear Status",
			BankAccountEO.Manual_Recon_Percent_Tolerance "Tolerance Percentage",
            BankAccountEO.Manual_Recon_Amount_Tolerance "
			",
			BankAccountEO.Recon_Ap_Tolerance_Diff_Acct  "Payment Tolerence Diff"  ,
			BankAccountEO.Ap_Percent_Tolerance   "Payment Tolerence Percent",
			BankAccountEO.Ap_Amount_Tolerance   "Payment Tolerence Amt",
			BankAccountEO.Ar_Percent_Tolerance  "Receipt Tol Percent",
			BankAccountEO.Ar_Amount_Tolerance  "Receipt Tolerence amt"  ,
			
            
            
			
			
			
			
			
			
			
			
			
			------------------------------------------------------------------------------------------------------------
            
            ou.name     "Operating Unit",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.CASH_CLEARING_CCID) "Recevables Cash Act",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.CASH_CLEARING_CCID) "Payables Cash",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.CASH_CLEARING_CCID) "Payables Cash Clearing",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.BANK_CHARGES_CCID) "Payables Bank Charges",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.BANK_ERRORS_CCID) "Payables Bank Errors" ,
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.FX_CHARGE_CCID) "Payables Foreign Exhg Charges" ,
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.GAIN_CODE_COMBINATION_ID) "Payables Realized Gain",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.LOSS_CODE_COMBINATION_ID) "Payables Realized Loss",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.BANK_CHARGES_CCID) "Recevables Bank Charges",
            decode(BankAccountEO.AP_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Acct acess Payables",
            decode(BankAccountEO.AR_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Acct acess Receivables",
            decode(BankAccountEO.PAY_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Acct acess Payroll",
            decode(BankAccountEO.XTR_USE_ALLOWED_FLAG,'Y','Yes','N','No') "Acct acess Treasury",
--            (select code from fnd_doc_sequence_categories where APPLICATION_ID = 200 and table_name = 'AP_CHECKS_ALL') "Payment Doc CAtegory",
--            (SELECT PAYMENT_METHOD_CODE from IBY_PAYMENT_METHODS_BIBY_PAYMENT_METHODS_B where sysdate <= nvl(INACTIVE_DATE, sysdate+1)) "Payment Method Code",
            (select name from ar_receivables_trx_all where type='UNEDISC' and status= 'A' and code_combination_id = BankAccountEO.CASH_CLEARING_CCID) "Unearned Discount",
            (select name from ar_receivables_trx_all where type = 'EDISC' and status = 'A' and code_combination_id = BankAccountEO.CASH_CLEARING_CCID) "Earned Discount",
            (select name from ar_receivables_trx_all where type = 'CLAIM_INVESTIGATION' and status = 'A' and code_combination_id = BankAccountEO.CASH_CLEARING_CCID) "Claim Investigation",
 --       (SELECT PAYMENT_METHOD_CODE from IBY_PAYMENT_METHODS_B where sysdate <= nvl(INACTIVE_DATE, sysdate+1)),                        ,
            BankAccountEO.Recon_Ap_Foreign_Diff_Handling  "payment Foreign Tol Diff."    ,
            BankAccountEO.Recon_Ar_Foreign_Diff_Handling "Recei Foreign Tol Diff."  ,
            BankAccountEO.Recon_Ce_Foreign_Diff_Handling  "Cash Flow Foreign Diff Act" ,
            BankAccountEO.Ce_Amount_Tolerance "Cash Flow Tol Amt"     ,
            BankAccountEO.Recon_Ce_Tolerance_Diff_Acct "Cash Flow Tol Diff Act"  ,
            BankAccountEO.Ce_Percent_Tolerance "Cash Flow Tol Percentage"  , 
            BankAccountEO.Recon_Oi_Amount_Tolerance  "Open Interface Tol Amt"    ,
            BankAccountEO.Recon_Oi_Percent_Tolerance  "Open Interface Tol Percent"   ,
            BankOrgProfile.ORGANIZATION_NAME "ORGAIZATION"           , 
            BankOrgProfile.BANK_OR_BRANCH_NUMBER "Bank Number"            ,
            BranchOrgProfile.BANK_OR_BRANCH_NUMBER "Branch Number"        ,
            FT.territory_short_name "Name"                                ,
            BankAccountEO.MAX_TARGET_BALANCE "Maximum Target Balance"     ,
            BankAccountEO.CASHPOOL_MIN_PAYMENT_AMT "Minimum Payment Amount" ,
            BankAccountEO.CASHPOOL_MIN_RECEIPT_AMT "Minimum Receipt Amount" ,
            BankAccountEO.CASHPOOL_ROUND_RULE "Rounding Rule"      ,
            BankAccountEO.CE_AMOUNT_TOLERANCE "Tolerance Amount"    ,
            BankAccountEO.CE_PERCENT_TOLERANCE "Tolerance Percentage"   ,
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.GAIN_CODE_COMBINATION_ID) "Realized Gain",
            (SELECT CONCATENATED_SEGMENTS FROM GL_CODE_COMBINATIONS_KFV WHERE CODE_COMBINATION_ID(+) = BankAccountEO.LOSS_CODE_COMBINATION_ID) "Realized Loss",
            decode(BankAccountEO.NETTING_ACCT_FLAG,'Y','Yes','N','No') "Netting Account" ,
            BankAccountEO.Fed_Duns_Num "DUNS/DUNS+4",
            BankAccountEO.Fed_Do_Symbol "Disbursing Office Symbol",
            HzPuiOrgContactsEOEx.start_date "Start Date",
            HzPuiOrgContactsEOEx.end_date "End Date",
            HzPuiPersonProfileEOEx.party_number "Registry ID",
            (loc.address1||loc.address2||loc.address3||loc.address4) "Address",
            loc.county "County",
            loc.province "Province",
            loc.state "State",
            loc.postal_code "Postal Code",
            HzPuiPartySiteEO.Identifying_Address_Flag "Identifying",
            FT.territory_short_name "country",
            HzPuiPersonProfileEOEx.EFFECTIVE_START_DATE "Start Date",
            HzPuiOrgContactRolesEOEx.ROLE_TYPE "Role Type",
            HzPuiOrgContactRolesEOEx.PRIMARY_CONTACT_PER_ROLE_TYPE "Primary role type",
            HzPuiOrgContactRolesEOEx.STATUS "Status",
            HzPuiOrgContactRolesEOEx.ORIG_SYSTEM_REFERENCE "System Reference",
            HzPuiOrgContactRolesEOEx.OBJECT_VERSION_NUMBER "Object Version",
            HzPuiPersonProfileEOEx.Salutation "Saluation",
            HzPuiPersonProfileEOEx.Known_As2 "Alias 2",
            HzPuiPersonProfileEOEx.Known_As3 "Alias 3",
            HzPuiPersonProfileEOEx.Known_As4 "Alias 4",
            HzPuiPersonProfileEOEx.Known_As5 "Alias 5",
            HzPuiPersonProfileEOEx.Person_Academic_Title "Second Title",
            HzPuiPersonProfileEOEx.Person_Title "Title",
            HzPuiPersonProfileEOEx.Person_Pre_Name_Adjunct "Prefix",
            HzPuiPersonProfileEOEx.Person_Initials "Name Initials",
            HzPuiPersonProfileEOEx.Person_Previous_Last_Name "Previous Last Name",
            HzPuiPersonProfileEOEx.Person_Name_Phonetic "Full Name",
            HzPuiPersonProfileEOEx.Known_As "Alias",
            HzPuiPersonProfileEOEx.party_number "Registry ID",
            HzPuiOrgContactsEOEx.job_title "Job Title",
            HzPuiOrgContactsEOEx.job_title_code "Job Title Code",
            HzPuiOrgContactsEOEx.department "Department",
            HzPuiOrgContactsEOEx.department_code "Department Code",
            HzPuiOrgContactsEOEx.comments "Comments",
            HzPuiPersonProfileEOEx.person_first_name "First Name",
            HzPuiPersonProfileEOEx.person_first_name_Phonetic "First Name Pronunciation",
            HzPuiPersonProfileEOEx.person_middle_name "Middle Name",
            HzPuiPersonProfileEOEx.middle_name_Phonetic "Middle Pronunciation",
            HzPuiPersonProfileEOEx.person_last_name "Last Name",
            HzPuiPersonProfileEOEx.person_last_name_Phonetic "Last Name Pronunciation",
            
            HzPuiContactPointPhoneEO.Contact_Point_Purpose "Purpose",
            HzPuiContactPointPhoneEO.Phone_Line_Type "Type",
            HzPuiContactPointPhoneEO.Phone_Country_Code "Country Code",
            HzPuiContactPointPhoneEO.Phone_Area_Code "Area Code",
            HzPuiContactPointPhoneEO.Raw_Phone_Number "Raw Number",
            HzPuiContactPointPhoneEO.Phone_Number "Number",
           HzPuiContactPointPhoneEO.Phone_Extension "Extension",
           HzPuiContactPointPhoneEO.Status "Status",
           HzPuiContactPointPhoneEO.Email_Address "Email",
           HzPuiContactPointPhoneEO.Email_Format "Email Format",
           HzPuiContactPointPhoneEO.Contact_Point_Purpose "Purpose",
           HzPuiContactPointPhoneEO.Status "Status",
           HzPuiContactPointPhoneEO.Primary_Flag "Primary",
           HzPuiOrgContactsEOEx.contact_number "Contact Number",
           CEPaymentDocumentsEO.PAYMENT_DOCUMENT_NAME "Payment Doc Name"  ,
           CEPaymentDocumentsEO.PAPER_STOCK_TYPE   "Paper Stock Type"   ,
           decode(CEPaymentDocumentsEO.ATTACHED_REMITTANCE_STUB_FLAG,'Y','Yes','N','No') "Attach Remittance stub"  ,
           CEPaymentDocumentsEO.NUMBER_OF_LINES_PER_REMIT_STUB  "Number Of Lines Remit"  ,
           CEPaymentDocumentsEO.NUMBER_OF_SETUP_DOCUMENTS "Number Of Setup"   ,
           fmts.format_name "Format"   ,
          CEPaymentDocumentsEO.PAYMENT_DOC_CATEGORY "Payment Doc Category" ,
          CEPaymentDocumentsEO.FIRST_AVAILABLE_DOCUMENT_NUM "First Avail Doc Num" ,
          CEPaymentDocumentsEO.LAST_AVAILABLE_DOCUMENT_NUMBER "Last Avail Doc Num"           
 from 
ce_bank_acct_uses_all bau,hr_all_organization_units ou,iby_formats_vl fmts,CE_PAYMENT_DOCUMENTS CEPaymentDocumentsEO,HZ_ORG_CONTACT_ROLES HzPuiOrgContactRolesEOEx,HZ_PERSON_PROFILES_CPUI_V HzPuiPersonProfileEOEx,HZ_ORG_CONTACTS_CPUI_V HzPuiOrgContactsEOEx,hz_party_sites HzPuiPartySiteEO,hz_locations loc,HZ_CONTACT_POINTS HzPuiContactPointPhoneEO,
   FND_TERRITORIES_VL FT,CE_LOOKUPS CL,HZ_RELATIONSHIPS BRRel,HZ_CODE_ASSIGNMENTS BankCA,HZ_CODE_ASSIGNMENTS BranchCA,HZ_PARTIES BankParty,HZ_ORGANIZATION_PROFILES BankOrgProfile,CE_BANK_ACCOUNTS BankAccountEO,HZ_ORGANIZATION_PROFILES BranchOrgProfile,HZ_PARTIES BranchParty,xle_entity_profiles xle,CE_LOOKUPS CLAccountType
 WHERE CLAccountType.lookup_type (+) = 'BANK_ACCOUNT_TYPE'
        AND CLAccountType.lookup_code (+)   = BankAccountEO.BANK_ACCOUNT_TYPE
        AND xle.LEGAL_ENTITY_ID             = BankAccountEO.ACCOUNT_OWNER_ORG_ID
        and BankParty.PARTY_TYPE = 'ORGANIZATION'
AND BankParty.status       = 'A'
AND BankParty.PARTY_ID     = BankOrgProfile.PARTY_ID
AND SYSDATE BETWEEN TRUNC(BankOrgProfile.effective_start_date) AND NVL(TRUNC(BankOrgProfile.effective_end_date), SYSDATE+1)
AND BankCA.CLASS_CATEGORY     = 'BANK_INSTITUTION_TYPE'
AND BankCA.CLASS_CODE         = 'BANK'
AND BankCA.OWNER_TABLE_NAME   = 'HZ_PARTIES'
AND BankCA.OWNER_TABLE_ID     = BankParty.PARTY_ID
AND NVL(BankCA.STATUS, 'A')   = 'A'
AND BranchParty.PARTY_TYPE    = 'ORGANIZATION'
AND BranchParty.status        = 'A'
AND BranchOrgProfile.PARTY_ID = BranchParty.PARTY_ID
AND SYSDATE BETWEEN TRUNC(BranchOrgProfile.effective_start_date(+)) AND NVL(TRUNC(BranchOrgProfile.effective_end_date(+)), SYSDATE+1)
AND BranchCA.CLASS_CATEGORY     = 'BANK_INSTITUTION_TYPE'
AND BranchCA.CLASS_CODE         = 'BANK_BRANCH'
AND BranchCA.OWNER_TABLE_NAME   = 'HZ_PARTIES'
AND BranchCA.OWNER_TABLE_ID     = BranchParty.PARTY_ID
AND NVL(BranchCA.STATUS, 'A')   = 'A'
AND BRRel.OBJECT_ID             = BankParty.PARTY_ID
AND BranchParty.PARTY_ID        = BRRel.SUBJECT_ID
AND BRRel.RELATIONSHIP_TYPE     = 'BANK_AND_BRANCH'
AND BRRel.RELATIONSHIP_CODE     = 'BRANCH_OF'
AND BRRel.STATUS                = 'A'
AND BRRel.SUBJECT_TABLE_NAME    = 'HZ_PARTIES'
AND BRRel.SUBJECT_TYPE          = 'ORGANIZATION'
AND BRRel.OBJECT_TABLE_NAME     = 'HZ_PARTIES'
AND BRRel.OBJECT_TYPE           = 'ORGANIZATION'
AND cl.lookup_type              = 'ACCOUNT_CLASSIFICATION'
AND cl.lookup_code              = BankAccountEO.ACCOUNT_CLASSIFICATION
AND BankOrgProfile.home_country = FT.territory_code
AND BankAccountEO.BANK_BRANCH_ID = BranchParty.PARTY_ID
and HzPuiPersonProfileEOEx.party_id(+) = BranchParty.PARTY_ID
and HzPuiPersonProfileEOEx.party_id = HzPuiOrgContactsEOEx.object_id(+)
and HzPuiPartySiteEO.party_id(+) = BranchParty.PARTY_ID
AND HzPuiPartySiteEO.location_id = loc.location_id(+)
AND HzPuiPartySiteEO.status(+) = 'A'
and HzPuiContactPointPhoneEO.contact_point_id(+) = BranchParty.party_id
and HzPuiOrgContactsEOEx.ORG_CONTACT_ID = HzPuiOrgContactRolesEOEx.ORG_CONTACT_ROLE_ID(+)
and (BankAccountEO.bank_account_type in ('SAVINGS','CHECKING','OTHER') or BankAccountEO.bank_account_type is null)
and CEPaymentDocumentsEO.format_code = fmts.format_code
and BankAccountEO.bank_account_id = CEPaymentDocumentsEO.internal_bank_account_id
AND ou.organization_id  = bau.org_id
and bau.bank_account_id(+) = BankAccountEO.bank_account_id;

