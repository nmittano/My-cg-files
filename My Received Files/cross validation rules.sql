
  CREATE OR REPLACE FORCE VIEW "APPS"."XXSAT_GL_CROSS_VAL_RULE_V" ("DATA_DUMP", "SEQ") AS 
  SELECT 'Application,Flexfield Title,Structure,Description,Cross-Validation Rules:Name,Description,Enabled,Error Message,Error Segment,From,To,Cross-Validation Rule Elements:Type,From,To'DATA_DUMP,1 SEQ
FROM DUAL
UNION
SELECT
('"'||FFCV.APPLICATION_NAME                                             ||'","'||
    FFCV.FLEX_NAME                                                      ||'","'||
    FFCV.FLEX_STRUCTURE_NAME                                            ||'","'||
    FFCV.FLEX_STRUCTURE_DESCRIPTION                                     ||'","'||
    FVR.FLEX_VALIDATION_RULE_NAME                                       ||'","'||
    FVR.DESCRIPTION                                                     ||'","'||
    DECODE(FVR.ENABLED_FLAG,'Y','Yes','N','No')                         ||'","'||
    FVR.ERROR_MESSAGE_TEXT                                              ||'","'||
    FVR.ERROR_SEGMENT_COLUMN_NAME                                       ||'","'||
    FVR.START_DATE_ACTIVE                                               ||'","'||
    FVR.END_DATE_ACTIVE                                                 ||'","'||
    FND.MEANING                                                         ||'","'||
    FVRL.CONCATENATED_SEGMENTS_LOW                                      ||'","'||
    FVRL.CONCATENATED_SEGMENTS_HIGH                                     ||'"')DATA_DUMP,2 SEQ
FROM 
    FND_FLEX_CROSS_VALIDATION_V FFCV            ,
    FND_FLEX_VDATION_RULES_VL FVR               ,
    FND_FLEX_VALIDATION_RULE_LINES FVRL         ,
    FND_LOOKUPS FND
WHERE
    FFCV.APPLICATION_ID             =   FVR.APPLICATION_ID(+)
AND FFCV.FLEX_STRUCTURE_NUM         =   FVR.ID_FLEX_NUM(+)
AND FFCV.FLEX_CODE                  =   FVR.ID_FLEX_CODE(+)
AND FVR.APPLICATION_ID              =   FVRL.APPLICATION_ID(+)
AND FVR.ID_FLEX_CODE                =   FVRL.ID_FLEX_CODE(+)
AND FVR.ID_FLEX_NUM                 =   FVRL.ID_FLEX_NUM(+)
AND FVR.FLEX_VALIDATION_RULE_NAME   =   FVRL.FLEX_VALIDATION_RULE_NAME(+)
AND FND.LOOKUP_TYPE(+)              =   'INCLUDE_EXCLUDE'
AND FND.LOOKUP_CODE(+)              =   FVRL.INCLUDE_EXCLUDE_INDICATOR
AND FFCV.FLEX_CODE                  =   'GL#'
AND FFCV.APPLICATION_ID             =   101
ORDER BY SEQ;
