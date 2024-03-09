# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.Transfer do
  @moduledoc """
  Transfer Family is a fully managed service that enables the transfer of files
  over the File Transfer Protocol (FTP), File Transfer Protocol over SSL (FTPS),
  or Secure Shell (SSH) File Transfer Protocol (SFTP) directly into and out of
  Amazon Simple Storage Service (Amazon S3) or Amazon EFS.

  Additionally, you can use Applicability Statement 2 (AS2) to transfer files into
  and out of Amazon S3. Amazon Web Services helps you seamlessly migrate your file
  transfer workflows to Transfer Family by integrating with existing
  authentication systems, and providing DNS routing with Amazon Route 53 so
  nothing changes for your customers and partners, or their applications. With
  your data in Amazon S3, you can use it with Amazon Web Services for processing,
  analytics, machine learning, and archiving. Getting started with Transfer Family
  is easy since there is no infrastructure to buy and set up.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: "AWS Transfer",
      api_version: "2018-11-05",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "transfer",
      global?: false,
      protocol: "json",
      service_id: "Transfer",
      signature_version: "v4",
      signing_name: "transfer",
      target_prefix: "TransferService"
    }
  end

  @doc """
  Used by administrators to choose which groups in the directory should have
  access to upload and download files over the enabled protocols using Transfer
  Family.

  For example, a Microsoft Active Directory might contain 50,000 users, but only a
  small fraction might need the ability to transfer files to the server. An
  administrator can use `CreateAccess` to limit the access to the correct set of
  users who need this ability.
  """
  def create_access(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateAccess", input, options)
  end

  @doc """
  Creates an agreement.

  An agreement is a bilateral trading partner agreement, or partnership, between
  an Transfer Family server and an AS2 process. The agreement defines the file and
  message transfer relationship between the server and the AS2 process. To define
  an agreement, Transfer Family combines a server, local profile, partner profile,
  certificate, and other attributes.

  The partner is identified with the `PartnerProfileId`, and the AS2 process is
  identified with the `LocalProfileId`.
  """
  def create_agreement(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateAgreement", input, options)
  end

  @doc """
  Creates the connector, which captures the parameters for a connection for the
  AS2 or SFTP protocol.

  For AS2, the connector is required for sending files to an externally hosted AS2
  server. For SFTP, the connector is required when sending files to an SFTP server
  or receiving files from an SFTP server. For more details about connectors, see
  [Configure AS2 connectors](https://docs.aws.amazon.com/transfer/latest/userguide/configure-as2-connector.html)
  and [Create SFTP connectors](https://docs.aws.amazon.com/transfer/latest/userguide/configure-sftp-connector.html).

  You must specify exactly one configuration object: either for AS2 (`As2Config`)
  or SFTP (`SftpConfig`).
  """
  def create_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateConnector", input, options)
  end

  @doc """
  Creates the local or partner profile to use for AS2 transfers.
  """
  def create_profile(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateProfile", input, options)
  end

  @doc """
  Instantiates an auto-scaling virtual server based on the selected file transfer
  protocol in Amazon Web Services.

  When you make updates to your file transfer protocol-enabled server or when you
  work with users, use the service-generated `ServerId` property that is assigned
  to the newly created server.
  """
  def create_server(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateServer", input, options)
  end

  @doc """
  Creates a user and associates them with an existing file transfer
  protocol-enabled server.

  You can only create and associate users with servers that have the
  `IdentityProviderType` set to `SERVICE_MANAGED`. Using parameters for
  `CreateUser`, you can specify the user name, set the home directory, store the
  user's public key, and assign the user's Identity and Access Management (IAM)
  role. You can also optionally add a session policy, and assign metadata with
  tags that can be used to group and search for users.
  """
  def create_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateUser", input, options)
  end

  @doc """
  Allows you to create a workflow with specified steps and step details the
  workflow invokes after file transfer completes.

  After creating a workflow, you can associate the workflow created with any
  transfer servers by specifying the `workflow-details` field in `CreateServer`
  and `UpdateServer` operations.
  """
  def create_workflow(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateWorkflow", input, options)
  end

  @doc """
  Allows you to delete the access specified in the `ServerID` and `ExternalID`
  parameters.
  """
  def delete_access(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteAccess", input, options)
  end

  @doc """
  Delete the agreement that's specified in the provided `AgreementId`.
  """
  def delete_agreement(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteAgreement", input, options)
  end

  @doc """
  Deletes the certificate that's specified in the `CertificateId` parameter.
  """
  def delete_certificate(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteCertificate", input, options)
  end

  @doc """
  Deletes the connector that's specified in the provided `ConnectorId`.
  """
  def delete_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteConnector", input, options)
  end

  @doc """
  Deletes the host key that's specified in the `HostKeyId` parameter.
  """
  def delete_host_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteHostKey", input, options)
  end

  @doc """
  Deletes the profile that's specified in the `ProfileId` parameter.
  """
  def delete_profile(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteProfile", input, options)
  end

  @doc """
  Deletes the file transfer protocol-enabled server that you specify.

  No response returns from this operation.
  """
  def delete_server(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteServer", input, options)
  end

  @doc """
  Deletes a user's Secure Shell (SSH) public key.
  """
  def delete_ssh_public_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSshPublicKey", input, options)
  end

  @doc """
  Deletes the user belonging to a file transfer protocol-enabled server you
  specify.

  No response returns from this operation.

  When you delete a user from a server, the user's information is lost.
  """
  def delete_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteUser", input, options)
  end

  @doc """
  Deletes the specified workflow.
  """
  def delete_workflow(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteWorkflow", input, options)
  end

  @doc """
  Describes the access that is assigned to the specific file transfer
  protocol-enabled server, as identified by its `ServerId` property and its
  `ExternalId`.

  The response from this call returns the properties of the access that is
  associated with the `ServerId` value that was specified.
  """
  def describe_access(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAccess", input, options)
  end

  @doc """
  Describes the agreement that's identified by the `AgreementId`.
  """
  def describe_agreement(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAgreement", input, options)
  end

  @doc """
  Describes the certificate that's identified by the `CertificateId`.
  """
  def describe_certificate(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCertificate", input, options)
  end

  @doc """
  Describes the connector that's identified by the `ConnectorId.`
  """
  def describe_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeConnector", input, options)
  end

  @doc """
  You can use `DescribeExecution` to check the details of the execution of the
  specified workflow.

  This API call only returns details for in-progress workflows.

  If you provide an ID for an execution that is not in progress, or if the
  execution doesn't match the specified workflow ID, you receive a
  `ResourceNotFound` exception.
  """
  def describe_execution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeExecution", input, options)
  end

  @doc """
  Returns the details of the host key that's specified by the `HostKeyId` and
  `ServerId`.
  """
  def describe_host_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeHostKey", input, options)
  end

  @doc """
  Returns the details of the profile that's specified by the `ProfileId`.
  """
  def describe_profile(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeProfile", input, options)
  end

  @doc """
  Describes the security policy that is attached to your file transfer
  protocol-enabled server.

  The response contains a description of the security policy's properties. For
  more information about security policies, see [Working with security policies](https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html).
  """
  def describe_security_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSecurityPolicy", input, options)
  end

  @doc """
  Describes a file transfer protocol-enabled server that you specify by passing
  the `ServerId` parameter.

  The response contains a description of a server's properties. When you set
  `EndpointType` to VPC, the response will contain the `EndpointDetails`.
  """
  def describe_server(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeServer", input, options)
  end

  @doc """
  Describes the user assigned to the specific file transfer protocol-enabled
  server, as identified by its `ServerId` property.

  The response from this call returns the properties of the user associated with
  the `ServerId` value that was specified.
  """
  def describe_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeUser", input, options)
  end

  @doc """
  Describes the specified workflow.
  """
  def describe_workflow(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeWorkflow", input, options)
  end

  @doc """
  Imports the signing and encryption certificates that you need to create local
  (AS2) profiles and partner profiles.
  """
  def import_certificate(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ImportCertificate", input, options)
  end

  @doc """
  Adds a host key to the server that's specified by the `ServerId` parameter.
  """
  def import_host_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ImportHostKey", input, options)
  end

  @doc """
  Adds a Secure Shell (SSH) public key to a Transfer Family user identified by a
  `UserName` value assigned to the specific file transfer protocol-enabled server,
  identified by `ServerId`.

  The response returns the `UserName` value, the `ServerId` value, and the name of
  the `SshPublicKeyId`.
  """
  def import_ssh_public_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ImportSshPublicKey", input, options)
  end

  @doc """
  Lists the details for all the accesses you have on your server.
  """
  def list_accesses(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAccesses", input, options)
  end

  @doc """
  Returns a list of the agreements for the server that's identified by the
  `ServerId` that you supply.

  If you want to limit the results to a certain number, supply a value for the
  `MaxResults` parameter. If you ran the command previously and received a value
  for `NextToken`, you can supply that value to continue listing agreements from
  where you left off.
  """
  def list_agreements(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAgreements", input, options)
  end

  @doc """
  Returns a list of the current certificates that have been imported into Transfer
  Family.

  If you want to limit the results to a certain number, supply a value for the
  `MaxResults` parameter. If you ran the command previously and received a value
  for the `NextToken` parameter, you can supply that value to continue listing
  certificates from where you left off.
  """
  def list_certificates(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListCertificates", input, options)
  end

  @doc """
  Lists the connectors for the specified Region.
  """
  def list_connectors(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListConnectors", input, options)
  end

  @doc """
  Lists all in-progress executions for the specified workflow.

  If the specified workflow ID cannot be found, `ListExecutions` returns a
  `ResourceNotFound` exception.
  """
  def list_executions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListExecutions", input, options)
  end

  @doc """
  Returns a list of host keys for the server that's specified by the `ServerId`
  parameter.
  """
  def list_host_keys(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListHostKeys", input, options)
  end

  @doc """
  Returns a list of the profiles for your system.

  If you want to limit the results to a certain number, supply a value for the
  `MaxResults` parameter. If you ran the command previously and received a value
  for `NextToken`, you can supply that value to continue listing profiles from
  where you left off.
  """
  def list_profiles(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListProfiles", input, options)
  end

  @doc """
  Lists the security policies that are attached to your file transfer
  protocol-enabled servers.
  """
  def list_security_policies(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListSecurityPolicies", input, options)
  end

  @doc """
  Lists the file transfer protocol-enabled servers that are associated with your
  Amazon Web Services account.
  """
  def list_servers(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListServers", input, options)
  end

  @doc """
  Lists all of the tags associated with the Amazon Resource Name (ARN) that you
  specify.

  The resource can be a user, server, or role.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  Lists the users for a file transfer protocol-enabled server that you specify by
  passing the `ServerId` parameter.
  """
  def list_users(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListUsers", input, options)
  end

  @doc """
  Lists all workflows associated with your Amazon Web Services account for your
  current region.
  """
  def list_workflows(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListWorkflows", input, options)
  end

  @doc """
  Sends a callback for asynchronous custom steps.

  The `ExecutionId`, `WorkflowId`, and `Token` are passed to the target resource
  during execution of a custom step of a workflow. You must include those with
  their callback as well as providing a status.
  """
  def send_workflow_step_state(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "SendWorkflowStepState", input, options)
  end

  @doc """
  Begins a file transfer between local Amazon Web Services storage and a remote
  AS2 or SFTP server.

    * For an AS2 connector, you specify the `ConnectorId` and one or
  more `SendFilePaths` to identify the files you want to transfer.

    * For an SFTP connector, the file transfer can be either outbound or
  inbound. In both cases, you specify the `ConnectorId`. Depending on the
  direction of the transfer, you also specify the following items:

      * If you are transferring file from a partner's SFTP
  server to Amazon Web Services storage, you specify one or more
  `RetreiveFilePaths` to identify the files you want to transfer, and a
  `LocalDirectoryPath` to specify the destination folder.

      * If you are transferring file to a partner's SFTP
  server from Amazon Web Services storage, you specify one or more `SendFilePaths`
  to identify the files you want to transfer, and a `RemoteDirectoryPath` to
  specify the destination folder.
  """
  def start_file_transfer(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartFileTransfer", input, options)
  end

  @doc """
  Changes the state of a file transfer protocol-enabled server from `OFFLINE` to
  `ONLINE`.

  It has no impact on a server that is already `ONLINE`. An `ONLINE` server can
  accept and process file transfer jobs.

  The state of `STARTING` indicates that the server is in an intermediate state,
  either not fully able to respond, or not fully online. The values of
  `START_FAILED` can indicate an error condition.

  No response is returned from this call.
  """
  def start_server(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartServer", input, options)
  end

  @doc """
  Changes the state of a file transfer protocol-enabled server from `ONLINE` to
  `OFFLINE`.

  An `OFFLINE` server cannot accept and process file transfer jobs. Information
  tied to your server, such as server and user properties, are not affected by
  stopping your server.

  Stopping the server does not reduce or impact your file transfer protocol
  endpoint billing; you must delete the server to stop being billed.

  The state of `STOPPING` indicates that the server is in an intermediate state,
  either not fully able to respond, or not fully offline. The values of
  `STOP_FAILED` can indicate an error condition.

  No response is returned from this call.
  """
  def stop_server(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StopServer", input, options)
  end

  @doc """
  Attaches a key-value pair to a resource, as identified by its Amazon Resource
  Name (ARN).

  Resources are users, servers, roles, and other entities.

  There is no response returned from this call.
  """
  def tag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagResource", input, options)
  end

  @doc """
  Tests whether your SFTP connector is set up successfully.

  We highly recommend that you call this operation to test your ability to
  transfer files between local Amazon Web Services storage and a trading partner's
  SFTP server.
  """
  def test_connection(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TestConnection", input, options)
  end

  @doc """
  If the `IdentityProviderType` of a file transfer protocol-enabled server is
  `AWS_DIRECTORY_SERVICE` or `API_Gateway`, tests whether your identity provider
  is set up successfully.

  We highly recommend that you call this operation to test your authentication
  method as soon as you create your server. By doing so, you can troubleshoot
  issues with the identity provider integration to ensure that your users can
  successfully use the service.

  The `ServerId` and `UserName` parameters are required. The `ServerProtocol`,
  `SourceIp`, and `UserPassword` are all optional.

  Note the following:

    * You cannot use `TestIdentityProvider` if the
  `IdentityProviderType` of your server is `SERVICE_MANAGED`.

    * `TestIdentityProvider` does not work with keys: it only accepts
  passwords.

    * `TestIdentityProvider` can test the password operation for a
  custom Identity Provider that handles keys and passwords.

    * If you provide any incorrect values for any parameters, the
  `Response` field is empty.

    * If you provide a server ID for a server that uses service-managed
  users, you get an error:

  ` An error occurred (InvalidRequestException) when calling the
  TestIdentityProvider operation: s-*server-ID* not configured for external auth `

    * If you enter a Server ID for the `--server-id` parameter that does
  not identify an actual Transfer server, you receive the following error:

  `An error occurred (ResourceNotFoundException) when calling the
  TestIdentityProvider operation: Unknown server`.

  It is possible your sever is in a different region. You can specify a region by
  adding the following: `--region region-code`, such as `--region us-east-2` to
  specify a server in **US East (Ohio)**.
  """
  def test_identity_provider(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TestIdentityProvider", input, options)
  end

  @doc """
  Detaches a key-value pair from a resource, as identified by its Amazon Resource
  Name (ARN).

  Resources are users, servers, roles, and other entities.

  No response is returned from this call.
  """
  def untag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagResource", input, options)
  end

  @doc """
  Allows you to update parameters for the access specified in the `ServerID` and
  `ExternalID` parameters.
  """
  def update_access(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateAccess", input, options)
  end

  @doc """
  Updates some of the parameters for an existing agreement.

  Provide the `AgreementId` and the `ServerId` for the agreement that you want to
  update, along with the new values for the parameters to update.
  """
  def update_agreement(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateAgreement", input, options)
  end

  @doc """
  Updates the active and inactive dates for a certificate.
  """
  def update_certificate(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateCertificate", input, options)
  end

  @doc """
  Updates some of the parameters for an existing connector.

  Provide the `ConnectorId` for the connector that you want to update, along with
  the new values for the parameters to update.
  """
  def update_connector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateConnector", input, options)
  end

  @doc """
  Updates the description for the host key that's specified by the `ServerId` and
  `HostKeyId` parameters.
  """
  def update_host_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateHostKey", input, options)
  end

  @doc """
  Updates some of the parameters for an existing profile.

  Provide the `ProfileId` for the profile that you want to update, along with the
  new values for the parameters to update.
  """
  def update_profile(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateProfile", input, options)
  end

  @doc """
  Updates the file transfer protocol-enabled server's properties after that server
  has been created.

  The `UpdateServer` call returns the `ServerId` of the server you updated.
  """
  def update_server(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateServer", input, options)
  end

  @doc """
  Assigns new properties to a user.

  Parameters you pass modify any or all of the following: the home directory,
  role, and policy for the `UserName` and `ServerId` you specify.

  The response returns the `ServerId` and the `UserName` for the updated user.

  In the console, you can select *Restricted* when you create or update a user.
  This ensures that the user can't access anything outside of their home
  directory. The programmatic way to configure this behavior is to update the
  user. Set their `HomeDirectoryType` to `LOGICAL`, and specify
  `HomeDirectoryMappings` with `Entry` as root (`/`) and `Target` as their home
  directory.

  For example, if the user's home directory is `/test/admin-user`, the following
  command updates the user so that their configuration in the console shows the
  *Restricted* flag as selected.

  ` aws transfer update-user --server-id <server-id> --user-name admin-user
  --home-directory-type LOGICAL --home-directory-mappings "[{\"Entry\":\"/\", \"Target\":\"/test/admin-user\"}]"`
  """
  def update_user(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateUser", input, options)
  end
end
