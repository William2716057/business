identification division.
program-id. BUSINESS-PROFIT.

data division.
working-storage section.

01 FC                  pic 9(7) value zero.
01 VC                  pic 9(7) value zero.
01 REVENUE             pic 9(7) value zero.

01 TOTAL-COST          pic 9(8) value zero.
01 NET-RESULT          pic s9(8) value zero.

01 PROFIT-MARGIN       pic s9(5)v99 value zero.
01 ROUNDED-MARGIN      pic -(5)9 value zero.

01 STATUS-TEXT         pic x(12).

procedure division.

MAIN-PROCEDURE.

    *> Get user input
    display "Enter Fixed Cost:"
    accept FC

    display "Enter Variable Cost:"
    accept VC

    display "Enter Revenue:"
    accept REVENUE

    *> Calculate total cost
    compute TOTAL-COST = FC + VC

    *> Calculate net result
    compute NET-RESULT = REVENUE - TOTAL-COST

    *> Calculate profit margin
    if REVENUE = 0
        move -100 to PROFIT-MARGIN
    else
        compute PROFIT-MARGIN =
            (NET-RESULT / REVENUE) * 100
    end-if

    *> Determine financial status
    if NET-RESULT = 0
        display "BREAK-EVEN"
    else
        if NET-RESULT > 0
            move "PROFITABLE" to STATUS-TEXT
        else
            move "LOSS" to STATUS-TEXT
        end-if

        *> Round margin to nearest whole number
        compute ROUNDED-MARGIN rounded =
            PROFIT-MARGIN

        *> Display financial summary
        display function trim(STATUS-TEXT)
            " | Net: " NET-RESULT
            " | Margin: " ROUNDED-MARGIN "%"
    end-if

    stop run.
