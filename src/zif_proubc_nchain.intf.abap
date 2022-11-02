INTERFACE zif_proubc_nchain
  PUBLIC .

* Component schema: CreateconnectorRequest, object
  TYPES: BEGIN OF ty_createconnectorrequest,
           name       TYPE string,
           network_id TYPE string,
           type       TYPE string,
           config     TYPE config,
         END OF ty_createconnectorrequest.


* Component schema: Credentials, object
  TYPES: BEGIN OF ty_credentials,
           aws_access_key_id     TYPE string,
           aws_secret_access_key TYPE string,
         END OF ty_credentials.

* Component schema: m00000, object
  TYPES: BEGIN OF ty_m00000,
           tcp TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           udp TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
         END OF ty_m00000.


* Component schema: Ingress, object
  TYPES: BEGIN OF ty_ingress,
           ingress TYPE ty_m00000,
         END OF ty_ingress.


* Component schema: Security, object
  TYPES: BEGIN OF ty_security,
           egress  TYPE string,
           ingress TYPE ty_ingress,
         END OF ty_security.

* Component schema: Config, object
  TYPES: BEGIN OF ty_config,
           region      TYPE string,
           target_id   TYPE string,
           provider_id TYPE string,
           role        TYPE string,
           container   TYPE string,
           credentials TYPE STANDARD TABLE OF ty_credentials WITH DEFAULT KEY,
           image       TYPE string,
           api_port    TYPE i,
           security    TYPE STANDARD TABLE OF ty_security WITH DEFAULT KEY,
         END OF ty_config.







* Component schema: Chainspec, object
  TYPES: BEGIN OF ty_subchainspec_alloc,
           dummy_workaround TYPE i,
         END OF ty_subchainspec_alloc.




* Component schema: Config2, object
  TYPES: BEGIN OF ty_config2,
           homesteadblock      TYPE i,
           eip150block         TYPE i,
           eip155block         TYPE i,
           eip158block         TYPE i,
           byzantiumblock      TYPE i,
           constantinopleblock TYPE i,
           petersburgblock     TYPE i,
         END OF ty_config2.

  TYPES: BEGIN OF ty_chainspec,
           config     TYPE ty_config2,
           alloc      TYPE ty_subchainspec_alloc,
           coinbase   TYPE string,
           difficulty TYPE string,
           extradata  TYPE string,
           gaslimit   TYPE string,
           nonce      TYPE string,
           mixhash    TYPE string,
           parenthash TYPE string,
           timestamp  TYPE string,
         END OF ty_chainspec.

* Component schema: Config1, object
  TYPES: BEGIN OF ty_config1,
           native_currency TYPE string,
           platform        TYPE string,
           engine_id       TYPE string,
           chain           TYPE string,
           protocol_id     TYPE string,
           chainspec       TYPE ty_chainspec,
         END OF ty_config1.

* Component schema: CreatenetworkRequest, object
  TYPES: BEGIN OF ty_createnetworkrequest,
           name      TYPE string,
           cloneable TYPE abap_bool,
           config    TYPE ty_config1,
         END OF ty_createnetworkrequest.

* Component schema: CreateaccountsRequest, object
  TYPES: BEGIN OF ty_createaccountsrequest,
           network_id TYPE string,
         END OF ty_createaccountsrequest.

* Component schema: CreateHDwalletRequest, object
  TYPES: BEGIN OF ty_createhdwalletrequest,
           purpose TYPE i,
         END OF ty_createhdwalletrequest.

* Component schema: create_broadcast_transaction-AccountRequest, object
  TYPES: BEGIN OF ty_create_broadcast_txn_ac,
           network_id TYPE string,
           key_id     TYPE string,
           to         TYPE string,
           value      TYPE i,
           account_id TYPE string,
         END OF ty_create_broadcast_txn_ac.

* Component schema: create_broadcast_transaction-WalletRequest, object
  TYPES: BEGIN OF ty_create_broadcast_txn_wa,
           network_id         TYPE string,
           key_id             TYPE string,
           from               TYPE string,
           to                 TYPE string,
           value              TYPE i,
           wallet_id          TYPE string,
           hd_derivation_path TYPE string,
         END OF ty_create_broadcast_txn_wa.

* Component schema: CompiledArtifact, object
  TYPES: BEGIN OF ty_compiledartifact,
           contractname TYPE string,
           abi          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           bytecode     TYPE string,
           source       TYPE string,
         END OF ty_compiledartifact.

  TYPES: BEGIN OF ty_pricefeed_compiledartifact,
           name TYPE zcasesensitive_str,
           "abi  TYPE zcasesensitive_str,
           abi  TYPE REF TO data,
         END OF ty_pricefeed_compiledartifact.

* Component schema: Params, object
  TYPES: BEGIN OF ty_params,
           account_id        TYPE string,
           compiled_artifact TYPE ty_compiledartifact,
         END OF ty_params.

* Component schema: DeploycontractRequest, object
  TYPES: BEGIN OF ty_deploycontractrequest,
           application_id TYPE string,
           network_id     TYPE string,
           name           TYPE string,
           address        TYPE string,
           params         TYPE ty_params,
         END OF ty_deploycontractrequest.

* Component schema: Abi, object
  TYPES: BEGIN OF ty_abi,
           anonymous       TYPE abap_bool,
           inputs          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           name            TYPE string,
           type            TYPE string,
           outputs         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           statemutability TYPE string,
         END OF ty_abi.

* Component schema: Input, object
  TYPES: BEGIN OF ty_input,
           indexed      TYPE abap_bool,
           internaltype TYPE string,
           name         TYPE string,
           type         TYPE string,
         END OF ty_input.

* Component schema: Assembly, object
  TYPES: BEGIN OF ty_subassembly_data,
           dummy_workaround TYPE i,
         END OF ty_subassembly_data.
  TYPES: BEGIN OF ty_assembly,
           _code TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           _data TYPE ty_subassembly_data,
         END OF ty_assembly.


* Component schema: CompiledArtifact1, object
  TYPES: BEGIN OF ty_compiledartifact1,
           abi         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           assembly    TYPE ty_assembly,
           bytecode    TYPE string,
           deps        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           fingerprint TYPE string,
           name        TYPE string,
           opcodes     TYPE string,
           raw         TYPE string,
           source      TYPE string,
         END OF ty_compiledartifact1.

* Component schema: Params1, object
  TYPES: BEGIN OF ty_params1,
           account_id        TYPE string,
           compiled_artifact TYPE ty_compiledartifact1,
         END OF ty_params1.

* Component schema: BaselinedeployregistrycontractRequest, object
  TYPES: BEGIN OF ty_baselineregistrycontract,
           application_id TYPE string,
           network_id     TYPE string,
           name           TYPE string,
           address        TYPE string,
           params         TYPE ty_params1,
         END OF ty_baselineregistrycontract.


* Component schema: Abi1, object
  TYPES: BEGIN OF ty_abi1,
           inputs          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           payable         TYPE abap_bool,
           statemutability TYPE string,
           type            TYPE string,
           anonymous       TYPE abap_bool,
           name            TYPE string,
         END OF ty_abi1.

* Component schema: Input1, object
  TYPES: BEGIN OF ty_input1,
           indexed TYPE abap_bool,
           name    TYPE string,
           type    TYPE string,
         END OF ty_input1.


* Component schema: Code, object
  TYPES: BEGIN OF ty_code,
           begin TYPE i,
           end   TYPE i,
           name  TYPE string,
           value TYPE string,
         END OF ty_code.

* Component schema: generatedObject, object
  TYPES: BEGIN OF ty_generatedobject,
           _auxdata TYPE string,
           _code    TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
         END OF ty_generatedobject.

* Component schema: generatedObject1, object
  TYPES: BEGIN OF ty_subgeneratedobject1_data,
           dummy_workaround TYPE i,
         END OF ty_subgeneratedobject1_data.
  TYPES: BEGIN OF ty_generatedobject1,
           _code TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           _data TYPE ty_subgeneratedobject1_data,
         END OF ty_generatedobject1.

* Component schema: Dep, object
  TYPES: BEGIN OF ty_dep,
           abi         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           assembly    TYPE ty_assembly,
           bytecode    TYPE string,
           deps        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           fingerprint TYPE string,
           name        TYPE string,
           opcodes     TYPE string,
           raw         TYPE string,
           source      TYPE string,
         END OF ty_dep.

* Component schema: Abi2, object
  TYPES: BEGIN OF ty_abi2,
           constant        TYPE abap_bool,
           inputs          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           name            TYPE string,
           outputs         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           payable         TYPE abap_bool,
           statemutability TYPE string,
           type            TYPE string,
           anonymous       TYPE abap_bool,
         END OF ty_abi2.

* Component schema: Input2, object
  TYPES: BEGIN OF ty_input2,
           name    TYPE string,
           type    TYPE string,
           indexed TYPE abap_bool,
         END OF ty_input2.

* Component schema: Output, object
  TYPES: BEGIN OF ty_output,
           name TYPE string,
           type TYPE string,
         END OF ty_output.

* Component schema: Assembly2, object
  TYPES: BEGIN OF ty_subassembly2_data,
           dummy_workaround TYPE i,
         END OF ty_subassembly2_data.
  TYPES: BEGIN OF ty_assembly2,
           _code TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           _data TYPE ty_subassembly2_data,
         END OF ty_assembly2.


* Component schema: Dep1, object
  TYPES: BEGIN OF ty_dep1,
           abi         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           assembly    TYPE ty_assembly2,
           bytecode    TYPE string,
           deps        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           fingerprint TYPE string,
           name        TYPE string,
           opcodes     TYPE string,
           raw         TYPE string,
           source      TYPE string,
         END OF ty_dep1.

* Component schema: Abi3, object
  TYPES: BEGIN OF ty_abi3,
           constant        TYPE abap_bool,
           inputs          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           name            TYPE string,
           outputs         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           payable         TYPE abap_bool,
           statemutability TYPE string,
           type            TYPE string,
           anonymous       TYPE abap_bool,
         END OF ty_abi3.


* Component schema: Dep2, object
  TYPES: BEGIN OF ty_dep2,
           abi         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           assembly    TYPE string,
           bytecode    TYPE string,
           deps        TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           fingerprint TYPE string,
           name        TYPE string,
           opcodes     TYPE string,
           raw         TYPE string,
           source      TYPE string,
         END OF ty_dep2.

* Component schema: Abi4, object
  TYPES: BEGIN OF ty_abi4,
           constant        TYPE abap_bool,
           inputs          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           name            TYPE string,
           outputs         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           payable         TYPE abap_bool,
           statemutability TYPE string,
           type            TYPE string,
         END OF ty_abi4.

* Component schema: Input4, object
  TYPES: BEGIN OF ty_input4,
           name TYPE string,
           type TYPE string,
         END OF ty_input4.

* Component schema: Dep3, object
  TYPES: BEGIN OF ty_dep3,
           abi         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           assembly    TYPE string,
           bytecode    TYPE string,
           deps        TYPE string,
           fingerprint TYPE string,
           name        TYPE string,
           opcodes     TYPE string,
           raw         TYPE string,
           source      TYPE string,
         END OF ty_dep3.

* Component schema: Abi5, object
  TYPES: BEGIN OF ty_abi5,
           constant        TYPE abap_bool,
           inputs          TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           name            TYPE string,
           outputs         TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           payable         TYPE abap_bool,
           statemutability TYPE string,
           type            TYPE string,
         END OF ty_abi5.

* Component schema: ExecutecontractRequest, object
  TYPES: BEGIN OF ty_executecontractrequest,
           method    TYPE string,
           params    TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           value     TYPE i,
           wallet_id TYPE string,
         END OF ty_executecontractrequest.

* Component schema: ExecutereadonlycontractRequest, object
  TYPES: BEGIN OF ty_executereadonlycontractreq,
           method     TYPE string,
           params     TYPE STANDARD TABLE OF string WITH DEFAULT KEY, " todo, handle array
           account_id TYPE string,
         END OF ty_executereadonlycontractreq.

  TYPES: BEGIN OF ty_pricefeed_req_params,
           argv              TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
           wallet_id         TYPE zcasesensitive_str,
           compiled_artifact TYPE ty_pricefeed_compiledartifact,
         END OF ty_pricefeed_req_params.

  TYPES: BEGIN OF ty_chainlinkpricefeed_req,
           address    TYPE zcasesensitive_str,
           name       TYPE zcasesensitive_str,
           network_id TYPE zcasesensitive_str,
           params     TYPE ty_pricefeed_req_params,
           type       TYPE zcasesensitive_str,
         END OF ty_chainlinkpricefeed_req.

  TYPES: BEGIN OF ty_hdwalletcreate_resp,
           id              TYPE string, "0e6ecd82-8d0e-4c45-bc45-8040be313f3e",
           created_at      TYPE string, "2022-10-27T19:14:00.574634616Z",
           organization_id TYPE string, ": "1e59736f-16d8-4d90-8ed0-755f15c9f573",
           vault_id        TYPE string, ": "190822c9-62f5-4caf-a419-df735a793b2f",
           key_id          TYPE string, ": "1252219c-d475-4cd7-ade3-66ae1e09745e",
           purpose         TYPE i, "44,
           public_key      TYPE string, ": "xpub661MyMwAqRbcFh4eaatbKy99k8qhPBdQWYUSPnmaeA14S6aVnZANoMzA1vDzwWeY8o7ax7gdHYbQLQv4QNabnsovT4SWFTLUPZAv2Jz9g9c"
         END OF ty_hdwalletcreate_resp.

  TYPES: BEGIN OF ty_executecontract_resp,
           confidence TYPE zcasesensitive_str,
           ref        TYPE zcasesensitive_str, "e71f3955-77e7-4a39-8abd-ee129c9f28b1",
           response   TYPE ref to data, ":  "comma separated array of values, some strings some ints
         END OF ty_executecontract_resp.


* GET - "List connectors"
* Operation id: Listconnectors
* Parameter: public, required, query
* Parameter: content-type, required, header
* Response: 200
  METHODS listconnectors
    IMPORTING
              public              TYPE abap_bool
              content_type        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Create connector"
* Operation id: Createconnector
* Response: 200
* Body ref: #/components/schemas/CreateconnectorRequest
  METHODS createconnector
    IMPORTING
              body                TYPE ty_createconnectorrequest
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get connector details"
* Operation id: Getconnectordetails
* Parameter: connector_id, required, path
* Response: 200
  METHODS getconnectordetails
    IMPORTING
              connector_id        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* DELETE - "Delete connector"
* Operation id: Deleteconnector
* Parameter: connector_id, required, path
* Response: 200
  METHODS deleteconnector
    IMPORTING
              connector_id        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* PUT - "Update network"
* Operation id: Updatenetwork
* Parameter: connector_id, required, path
* Response: 200
  METHODS updatenetwork
    IMPORTING
              connector_id        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get load balancer details"
* Operation id: Getloadbalancerdetails
* Parameter: connector_id, required, path
* Response: 200
  METHODS getloadbalancerdetails
    IMPORTING
              connector_id        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "List networks"
* Operation id: Listnetworks
* Parameter: network_id, required, path
* Response: 200
  METHODS listnetworks
    IMPORTING
              network_id          TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get network detail"
* Operation id: Getnetworkdetail
* Parameter: connector_id, required, path
* Response: 200
  METHODS getnetworkdetail
    IMPORTING
              connector_id        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get network status"
* Operation id: Getnetworkstatus
* Parameter: network_id, required, path
* Response: 200
  METHODS getnetworkstatus
    IMPORTING
              network_id          TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Create network"
* Operation id: Createnetwork
* Response: 200
* Body ref: #/components/schemas/CreatenetworkRequest
  METHODS createnetwork
    IMPORTING
              body                TYPE ty_createnetworkrequest
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Create accounts"
* Operation id: Createaccounts
* Response: 200
* Body ref: #/components/schemas/CreateaccountsRequest
  METHODS createaccounts
    IMPORTING
              body                TYPE ty_createaccountsrequest
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "List accounts"
* Operation id: Listaccounts
* Parameter: content-type, required, header
* Response: 200
  METHODS listaccounts
    IMPORTING
              content_type        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get account details"
* Operation id: Getaccountdetails
* Parameter: content-type, required, header
* Parameter: account_id, required, path
* Response: 200
  METHODS getaccountdetails
    IMPORTING
              content_type        TYPE string
              account_id          TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "List HD wallets"
* Operation id: ListHDwallets
* Parameter: content-type, required, header
* Response: 200
  METHODS listhdwallets
    IMPORTING
              content_type        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Create HD wallet"
* Operation id: CreateHDwallet
* Response: 200
* Body ref: #/components/schemas/CreateHDwalletRequest
  METHODS createhdwallet
    IMPORTING
              is_walletrequest    TYPE ty_createhdwalletrequest
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "List HD wallet accounts"
* Operation id: ListHDwalletaccounts
* Parameter: page, required, query
* Parameter: content-type, required, header
* Parameter: wallet_id, required, path
* Response: 200
  METHODS listhdwalletaccounts
    IMPORTING
              page                TYPE i
              content_type        TYPE string
              wallet_id           TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "List transactions"
* Operation id: Listtransactions
* Parameter: content-type, required, header
* Response: 200
  METHODS listtransactions
    IMPORTING
              content_type        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Create & broadcast transaction - Account"
* Operation id: create_broadcast_transaction-Account
* Response: 200
* Body ref: #/components/schemas/Create%26broadcasttransaction-AccountRequest
  METHODS create_broadcast_txn_ac
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get transaction details"
* Operation id: Gettransactiondetails
* Parameter: content-type, required, header
* Parameter: transaction_id, required, path
* Response: 200
  METHODS gettransactiondetails
    IMPORTING
              content_type        TYPE string
              transaction_id      TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "List contracts"
* Operation id: Listcontracts
* Parameter: content-type, required, header
* Response: 200
  METHODS listcontracts
    IMPORTING
              content_type        TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Deploy contract"
* Operation id: Deploycontract
* Response: 200
* Body ref: #/components/schemas/DeploycontractRequest
  METHODS deploycontract
    IMPORTING
              body                TYPE ty_deploycontractrequest
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* GET - "Get contract detail"
* Operation id: Getcontractdetail
* Parameter: content-type, required, header
* Parameter: contract_id, required, path
* Response: 200
  METHODS getcontractdetail
    IMPORTING
              content_type        TYPE string
              contract_id         TYPE string
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Execute contract"
* Operation id: Executecontract
* Parameter: contract_id, required, path
* Response: 200
* Body ref: #/components/schemas/ExecutecontractRequest
  METHODS executecontract
    IMPORTING
              iv_contract_id      TYPE zcasesensitive_str
              is_execcontractreq  TYPE ty_executecontractrequest
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

* POST - "Execute read only contract"
* Operation id: Executereadonlycontract
* Response: 200
* Body ref: #/components/schemas/ExecutereadonlycontractRequest
  METHODS executereadonlycontract
    IMPORTING
              body                TYPE ty_executereadonlycontractreq
    EXPORTING
              ev_apiresponsestr   TYPE string
              ev_apiresponse      TYPE REF TO data
              ev_httpresponsecode TYPE i
    RAISING   cx_static_check.

  METHODS createpricefeedcontract
    IMPORTING
              iv_smartcontractaddr TYPE zproubc_smartcontract_addr
              is_pricefeedcontract TYPE ty_chainlinkpricefeed_req
    EXPORTING
              ev_apiresponsestr    TYPE string
              ev_apiresponse       TYPE REF TO data
              ev_httpresponsecode  TYPE i
    RAISING   cx_static_check.


ENDINTERFACE.
