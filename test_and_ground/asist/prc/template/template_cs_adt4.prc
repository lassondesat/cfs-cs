PROC $sc_$cpu_cs_adt4
;*******************************************************************************
;  Test Name:  cs_adt4
;  Test Level: Build Verification
;  Test Type:  Functional
;
;  Test Description
;	The purpose of this procedure is to generate an empty Application 
;	Definition Table for the Checksum Application.
;
;  Requirements Tested:
;	None
;
;  Prerequisite Conditions
;	None
;
;  Assumptions and Constraints
;	None.
;
;  Change History
;
;	Date		   Name		Description
;	07/18/11	Walt Moleski	Initial release.
;
;  Arguments
;	None.
;
;  Procedures Called
;	Name			Description
;      create_tbl_file_from_cvt Procedure that creates a load file from
;                               the specified arguments and cvt
;
;  Expected Test Results and Analysis
;
;**********************************************************************

local logging = %liv (log_procedure)
%liv (log_procedure) = FALSE

#include "cs_platform_cfg.h"
#include "cs_tbldefs.h"
#include "cs_msgdefs.h"

%liv (log_procedure) = logging

;**********************************************************************
; Define local variables
;**********************************************************************
LOCAL defAppId, defPktId
local CSAppName = "CS"
local ramDir = "RAM:0"
local appDefTblName = CSAppName & "." & CS_DEF_APP_TABLE_NAME

;;; Set the pkt and app IDs for the tables based upon the cpu being used
;; CPU1 is the default
defAppId = "0FAF"
defPktId = 4015

if ("$CPU" = "CPU2") then
  defAppId = "0FCD"
  defPktId = 4045
elseif ("$CPU" = "CPU3") then
  defAppId = "0FED"
  defPktId = 4077
endif

write ";*********************************************************************"
write ";  Define the Application Definition Table "
write ";********************************************************************"
local maxEntry = CS_MAX_NUM_APP_TABLE_ENTRIES - 1

;; Clear the remainder of the table
for i = 0 to maxEntry do
  $SC_$CPU_CS_APP_DEF_TABLE[i].State = CS_STATE_EMPTY
  $SC_$CPU_CS_APP_DEF_TABLE[i].Name = ""
enddo

local endmnemonic = "$SC_$CPU_CS_APP_DEF_TABLE[" & maxEntry & "].Name"

;; Create the Table Load file
s create_tbl_file_from_cvt ("$CPU",defAppId,"App Definition Empty Table Load","appdefemptytable",appDefTblName,"$SC_$CPU_CS_APP_DEF_TABLE[0].State",endmnemonic)

write ";*********************************************************************"
write ";  End procedure $SC_$CPU_cs_adt4                              "
write ";*********************************************************************"
ENDPROC
