CLASS zcl_spec01 DEFINITION PUBLIC.
* Generated by abap-openapi-client
* test, 1.2.3
  PUBLIC SECTION.
    INTERFACES zif_spec01.
    METHODS constructor IMPORTING ii_client TYPE REF TO if_http_client.
  PROTECTED SECTION.
    DATA mi_client TYPE REF TO if_http_client.
    DATA mo_json TYPE REF TO zcl_oapi_json.
    METHODS send_receive RETURNING VALUE(rv_code) TYPE i.
    METHODS parse_errormessage
      IMPORTING iv_prefix TYPE string
      RETURNING VALUE(errormessage) TYPE zif_spec01=>errormessage
      RAISING cx_static_check.
    METHODS parse_qos
      IMPORTING iv_prefix TYPE string
      RETURNING VALUE(qos) TYPE zif_spec01=>qos
      RAISING cx_static_check.
ENDCLASS.

CLASS zcl_spec01 IMPLEMENTATION.
  METHOD constructor.
    mi_client = ii_client.
  ENDMETHOD.

  METHOD send_receive.
    mi_client->send( ).
    mi_client->receive( ).
    mi_client->response->get_status( IMPORTING code = rv_code ).
  ENDMETHOD.

  METHOD parse_errormessage.
    errormessage-message = mo_json->value_string( iv_prefix && '/message' ).
  ENDMETHOD.

  METHOD parse_qos.
    qos = mo_json->value_integer( iv_prefix && '/' ).
  ENDMETHOD.

  METHOD zif_spec01~consume_from_queue.
    DATA lv_code TYPE i.
    DATA lv_temp TYPE string.
    DATA lv_uri TYPE string VALUE '/queues/{queue-name}/messages/consumption'.
    lv_temp = queue_name.
    lv_temp = cl_http_utility=>escape_url( condense( lv_temp ) ).
    REPLACE ALL OCCURRENCES OF '{queue-name}' IN lv_uri WITH lv_temp.
    mi_client->request->set_method( 'POST' ).
    mi_client->request->set_header_field( name = '~request_uri' value = lv_uri ).
    mi_client->request->set_header_field( name = 'x-qos' value = x_qos ).
    lv_code = send_receive( ).
    WRITE / lv_code.
    CASE lv_code.
      WHEN 200. " Ok
" application/json,
      WHEN 204. " No Content, queue is empty
      WHEN 404. " Not Found
" application/json,#/components/schemas/ErrorMessage
        CREATE OBJECT mo_json EXPORTING iv_json = mi_client->response->get_cdata( ).
        parse_errormessage( '' ).
" todo, raise
    ENDCASE.
  ENDMETHOD.

  METHOD zif_spec01~publish_message_to_queue.
    DATA lv_code TYPE i.
    DATA lv_temp TYPE string.
    DATA lv_uri TYPE string VALUE '/queues/{queue-name}/messages'.
    lv_temp = queue_name.
    lv_temp = cl_http_utility=>escape_url( condense( lv_temp ) ).
    REPLACE ALL OCCURRENCES OF '{queue-name}' IN lv_uri WITH lv_temp.
    mi_client->request->set_method( 'POST' ).
    mi_client->request->set_header_field( name = '~request_uri' value = lv_uri ).
    mi_client->request->set_header_field( name = 'x-qos' value = x_qos ).
    mi_client->request->set_header_field( name = 'x-message-expiration' value = x_message_expiration ).
    mi_client->request->set_cdata( body ).
    lv_code = send_receive( ).
    WRITE / lv_code.
    CASE lv_code.
      WHEN 204. " No Content, message published successfully
      WHEN 400. " Bad Request
" application/json,#/components/schemas/ErrorMessage
        CREATE OBJECT mo_json EXPORTING iv_json = mi_client->response->get_cdata( ).
        parse_errormessage( '' ).
" todo, raise
      WHEN 404. " Not Found
" application/json,#/components/schemas/ErrorMessage
        CREATE OBJECT mo_json EXPORTING iv_json = mi_client->response->get_cdata( ).
        parse_errormessage( '' ).
" todo, raise
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
