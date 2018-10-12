*&---------------------------------------------------------------------*
*& Report ZTESTZAB_OPEN_SQL2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztestzab_opsql2.

PARAMETERS: p_stcd1 TYPE stcd1 DEFAULT '2801157600'.

START-OF-SELECTION.

  SELECT stcd3
    FROM kna1
    USING CLIENT '120'
    WHERE stcd1 = @p_stcd1
    UNION DISTINCT
    SELECT stcd3
    FROM lfa1
    USING CLIENT '120'
    WHERE stcd1 = @p_stcd1
    INTO TABLE @DATA(lt_tax).
*

*  SELECT SINGLE coalesce( kna1~stcd3, lfa1~stcd3 ) AS tax3
*    FROM kna1 LEFT OUTER JOIN lfa1
*    ON lfa1~stcd1 = kna1~stcd1
*    USING CLIENT '120'
*    WHERE ( kna1~stcd1 = @p_stcd1
*       OR lfa1~stcd1 = @p_stcd1 )
*     INTO @DATA(lv_tax3).
*  IF sy-subrc = 0.
*    WRITE: / lv_tax3.
*  ENDIF.



  IF sy-subrc = 0.
*    cl_demo_output=>display_data(
*    EXPORTING
*    value = lt_tax
*    name = 'Old AGE SQL : 1' ).
  ENDIF.




END-OF-SELECTION.
