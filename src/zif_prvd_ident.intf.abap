INTERFACE zif_prvd_ident
  PUBLIC .


  TYPES:
"! Generated by abap-openapi-client
"! Ident, 1.0
"! Component schema: CreateapplicationRequest, object
    BEGIN OF createapplicationrequest,
           name TYPE string,
         END OF createapplicationrequest .
  TYPES:
"! Component schema: AssociateusertoapplicationRequest, object
    BEGIN OF associateusertoapplicationrequ,
           user_id TYPE string,
         END OF associateusertoapplicationrequ .
  TYPES:
"! Component schema: UpdateapplicationRequest, object
    BEGIN OF updateapplicationrequest,
           name        TYPE string,
           description TYPE string,
           type        TYPE string,
           hidden      TYPE abap_bool,
         END OF updateapplicationrequest .
  TYPES:
"! Component schema: CreateorganizationRequest, object
    BEGIN OF createorganizationrequest,
           name        TYPE string,
           description TYPE string,
         END OF createorganizationrequest .
  TYPES:
"! Component schema: UpdateorganizationdetailsRequest, object
    BEGIN OF updateorganizationdetailsreque,
           name        TYPE string,
           description TYPE string,
         END OF updateorganizationdetailsreque .
  TYPES:
"! Component schema: Authorizelong-termtokenRequest, object
    BEGIN OF authorize_access_refreshtoken,
           scope           TYPE zcasesensitive_str,
           organization_id TYPE zcasesensitive_str,
         END OF authorize_access_refreshtoken .
  TYPES:
"! Component schema: Authorizelong-termtokenRequest, object
    BEGIN OF refresh_accesstoken_request,
      organization_id TYPE zcasesensitive_str,
      grant_type      TYPE zcasesensitive_str,
    END OF refresh_accesstoken_request .
  TYPES:
    BEGIN OF authorizelongtermtokenresponse,
           id            TYPE zcasesensitive_str,
           access_token  TYPE zcasesensitive_str,
           refresh_token TYPE zcasesensitive_str,
           expires_in    TYPE int4,
           scope         TYPE zcasesensitive_str,
           permissions   TYPE int4,
         END OF authorizelongtermtokenresponse .
  TYPES:
"! Component schema: AuthenticationRequest, object
    BEGIN OF authenticationrequest,
           email    TYPE string,
           password TYPE zcasesensitive_str,
           scope type string,
         END OF authenticationrequest .
  TYPES:
"! Component schema: CreateuserRequest, object
    BEGIN OF createuserrequest,
           email      TYPE string,
           first_name TYPE string,
           last_name  TYPE string,
         END OF createuserrequest .
  TYPES:
"! Component schema: UpdateuserRequest, object
    BEGIN OF updateuserrequest,
           email      TYPE string,
           first_name TYPE string,
           last_name  TYPE string,
           password   TYPE string,
         END OF updateuserrequest .

"! POST - "Create application"
"! Operation id: Createapplication
"! Parameter: name, required, header
"! Response: 200
"! Body ref: #/components/schemas/CreateapplicationRequest
  METHODS createapplication
    IMPORTING
      !name TYPE string
      !body TYPE createapplicationrequest
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "List applications"
"! Operation id: Listapplications
"! Response: 200
  METHODS listapplications
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! POST - "Associate user to application"
"! Operation id: Associateusertoapplication
"! Parameter: application_id, required, path
"! Response: 200
"! Body ref: #/components/schemas/AssociateusertoapplicationRequest
  METHODS associateusertoapplication
    IMPORTING
      !application_id TYPE string
      !body TYPE associateusertoapplicationrequ
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "List application users"
"! Operation id: Listapplicationusers
"! Parameter: content-type, required, header
"! Parameter: application_id, required, path
"! Response: 200
  METHODS listapplicationusers
    IMPORTING
      !content_type TYPE string
      !application_id TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "Get application details"
"! Operation id: Getapplicationdetails
"! Parameter: content-type, required, header
"! Parameter: application_id, required, path
"! Response: 200
  METHODS getapplicationdetails
    IMPORTING
      !content_type TYPE string
      !application_id TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! PUT - "Update application"
"! Operation id: Updateapplication
"! Parameter: name, required, header
"! Parameter: application_id, required, path
"! Response: 200
"! Body ref: #/components/schemas/UpdateapplicationRequest
  METHODS updateapplication
    IMPORTING
      !name TYPE string
      !application_id TYPE string
      !body TYPE updateapplicationrequest
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! DELETE - "Delete application"
"! Operation id: Deleteapplication
"! Parameter: content-type, required, header
"! Parameter: application_id, required, path
"! Response: 200
  METHODS deleteapplication
    IMPORTING
      !content_type TYPE string
      !application_id TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "List organizations"
"! Operation id: Listorganizations
"! Parameter: content-type, required, header
"! Response: 200
  METHODS listorganizations
    IMPORTING
      !content_type TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! POST - "Create organization"
"! Operation id: Createorganization
"! Parameter: name, required, header
"! Response: 200
"! Body ref: #/components/schemas/CreateorganizationRequest
  METHODS createorganization
    IMPORTING
      !name TYPE string
      !body TYPE createorganizationrequest
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "Get organization details"
"! Operation id: Getorganizationdetails
"! Parameter: content-type, required, header
"! Parameter: name, required, header
"! Parameter: organization_id, required, path
"! Response: 200
  METHODS getorganizationdetails
    IMPORTING
      !content_type TYPE string
      !name TYPE string
      !organization_id TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! PUT - "Update organization details"
"! Operation id: Updateorganizationdetails
"! Parameter: name, required, header
"! Parameter: organization_id, required, path
"! Response: 200
"! Body ref: #/components/schemas/UpdateorganizationdetailsRequest
  METHODS updateorganizationdetails
    IMPORTING
      !name TYPE string
      !organization_id TYPE string
      !body TYPE updateorganizationdetailsreque
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "List tokens"
"! Operation id: Listtokens
"! Parameter: content-type, required, header
"! Parameter: name, required, header
"! Response: 200
  METHODS listtokens
    IMPORTING
      !content_type TYPE string
      !name TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! POST - "Authorize refresh token"
"! Operation id: refresh_accesstoken_request
"! Response: 201
"! Body ref: #/components/schemas/refresh_accesstoken_request
  METHODS refresh_access_token
    IMPORTING
      !is_req_body TYPE refresh_accesstoken_request
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
  METHODS authorizelong_termtoken
    IMPORTING
      !body TYPE authorize_access_refreshtoken
    EXPORTING
      !status TYPE i
      !apiresponse TYPE REF TO data
    RAISING
      cx_static_check .
"! PUT - "Update user"
"! Operation id: Updateuser
"! Parameter: name, required, header
"! Response: 200
"! Body ref: #/components/schemas/UpdateuserRequest
  METHODS updateuser
    IMPORTING
      !name TYPE string
      !body TYPE updateuserrequest
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! DELETE - "Revoke token"
"! Operation id: Revoketoken
"! Parameter: content-type, required, header
"! Response: 200
  METHODS revoketoken
    IMPORTING
      !content_type TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! POST - "Authentication"
"! Operation id: Authentication
"! Response: 200
"! Body ref: #/components/schemas/AuthenticationRequest
  METHODS authentication
    IMPORTING
      !body TYPE authenticationrequest
    EXPORTING
      !apiresponse TYPE REF TO data
    RAISING
      cx_static_check .
"! GET - "List users Copy"
"! Operation id: ListusersCopy
"! Parameter: content-type, required, header
"! Response: 200
  METHODS listuserscopy
    IMPORTING
      !content_type TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! POST - "Create user"
"! Operation id: Createuser
"! Response: 200
"! Body ref: #/components/schemas/CreateuserRequest
  METHODS createuser
    IMPORTING
      !body TYPE createuserrequest
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! GET - "Get user detail"
"! Operation id: Getuserdetail
"! Parameter: content-type, required, header
"! Parameter: name, required, header
"! Parameter: user_id, required, path
"! Response: 200
  METHODS getuserdetail
    IMPORTING
      !content_type TYPE string
      !name TYPE string
      !user_id TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
"! DELETE - "Delete user"
"! Operation id: Deleteuser
"! Parameter: content-type, required, header
"! Parameter: user_id, required, path
"! Response: 200
  METHODS deleteuser
    IMPORTING
      !content_type TYPE string
      !user_id TYPE string
    EXPORTING
      !ev_apiresponsestr   TYPE string
      !ev_apiresponse      TYPE REF TO data
      !ev_httpresponsecode TYPE i
    RAISING
      cx_static_check .
ENDINTERFACE.
