      / This is a simple program to just echo todays date
      / using the CURRENT-DATE function in COBOL.
      /
      / Tested on NetBSD with OpenCOBOL
      / OpenVMS Support is questionable
        IDENTIFICATION DIVISION.
        PROGRAM-ID. TODAY.
        AUTHOR. JDM.
        INSTALLATION. 01-JAN-2000.
        DATE-WRITTEN. 18-FEB-2025.
        DATE-COMPILED. 18-FEB-2025.
        SECURITY. NORMAL.
      / ------------------------------
        ENVIRONMENT DIVISION.
      / ------------------------------
        DATA DIVISION.
        FILE SECTION.
      / ------------------------------
      / Formatted date and time to display on the terminal
      / ------------------------------
        WORKING-STORAGE SECTION.
        01 WS-DATETIME                                  PIC X(21).
        01 WS-FORMATTED-DT.
                05      WS-FORMATTED-DTE-TME.
                        15      WS-FORMATTED-YEAR       PIC 9(4).
                        15      FILLER                  PIC X VALUE '-'.
                        15      WS-FORMATTED-MONTH      PIC 9(2).
                        15      FILLER                  PIC X VALUE '-'.
                        15      WS-FORMATTED-DY         PIC 9(2).
                        15      FILLER                  PIC X VALUE ' '.
        01 WS-FORMATTED-TM
                        15      WS-FORMATTED-HOUR       PIC 9(2).
                        15      FILLER                  PIC X VALUE ':'.
                        15      WS-FORMATTED-MINS       PIC 9(2).
                        15      FILLER                  PIC X VALUE ':'.
                        15      WS-FORMATTED-SEC        PIC 9(2).
                        15      FILLER                  PIC X VALUE ':'.
                        15      WS-FORMATTED-MS         PIC 9(2).
      / ------------------------------
        PROCEDURE DIVISION.
                MOVE FUNCTION CURRENT-DATE TO WS-DATETIME.

                MOVE WS-DATETIME(1:4)   TO WS-FORMATTED-YEAR.
                MOVE WS-DATETIME(5:2)   TO WS-FORMATTED-MONTH.
                MOVE WS-DATETIME(7:2)   TO WS-FORMATTED-DY.
                MOVE WS-DATETIME(9:2)   TO WS-FORMATTED-HOUR.
                MOVE WS-DATETIME(11:2)  TO WS-FORMATTED-MINS.
                MOVE WS-DATETIME(13:2)  TO WS-FORMATTED-SEC.
                MOVE WS-DATETIME(15:2)  TO WS-FORMATTED-MS.

                DISPLAY 'Hello There'.
                DISPLAY ' '.
                DISPLAY 'Todays date is'.
                DISPLAY WS-FORMATTED-DT.
                DISPLAY ' '.
                DISPLAY 'and the time is'.
                DISPLAY WS-FORMATTED-TM.
        STOP RUN.
