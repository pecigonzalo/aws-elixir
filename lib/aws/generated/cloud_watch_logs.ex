# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.CloudWatchLogs do
  @moduledoc """
  You can use Amazon CloudWatch Logs to monitor, store, and access your log files
  from EC2 instances, CloudTrail, and other sources.

  You can then retrieve the associated log data from CloudWatch Logs using the
  CloudWatch console. Alternatively, you can use CloudWatch Logs commands in the
  Amazon Web Services CLI, CloudWatch Logs API, or CloudWatch Logs SDK.

  You can use CloudWatch Logs to:

    * **Monitor logs from EC2 instances in real time**: You can use
  CloudWatch Logs to monitor applications and systems using log data. For example,
  CloudWatch Logs can track the number of errors that occur in your application
  logs. Then, it can send you a notification whenever the rate of errors exceeds a
  threshold that you specify. CloudWatch Logs uses your log data for monitoring so
  no code changes are required. For example, you can monitor application logs for
  specific literal terms (such as "NullReferenceException"). You can also count
  the number of occurrences of a literal term at a particular position in log data
  (such as "404" status codes in an Apache access log). When the term you are
  searching for is found, CloudWatch Logs reports the data to a CloudWatch metric
  that you specify.

    * **Monitor CloudTrail logged events**: You can create alarms in
  CloudWatch and receive notifications of particular API activity as captured by
  CloudTrail. You can use the notification to perform troubleshooting.

    * **Archive log data**: You can use CloudWatch Logs to store your
  log data in highly durable storage. You can change the log retention setting so
  that any log events earlier than this setting are automatically deleted. The
  CloudWatch Logs agent helps to quickly send both rotated and non-rotated log
  data off of a host and into the log service. You can then access the raw log
  data when you need it.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2014-03-28",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "logs",
      global?: false,
      protocol: "json",
      service_id: "CloudWatch Logs",
      signature_version: "v4",
      signing_name: "logs",
      target_prefix: "Logs_20140328"
    }
  end

  @doc """
  Associates the specified KMS key with either one log group in the account, or
  with all stored CloudWatch Logs query insights results in the account.

  When you use `AssociateKmsKey`, you specify either the `logGroupName` parameter
  or the `resourceIdentifier` parameter. You can't specify both of those
  parameters in the same operation.

    * Specify the `logGroupName` parameter to cause all log events
  stored in the log group to be encrypted with that key. Only the log events
  ingested after the key is associated are encrypted with that key.

  Associating a KMS key with a log group overrides any existing associations
  between the log group and a KMS key. After a KMS key is associated with a log
  group, all newly ingested data for the log group is encrypted using the KMS key.
  This association is stored as long as the data encrypted with the KMS key is
  still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data
  whenever it is requested.

  Associating a key with a log group does not cause the results of queries of that
  log group to be encrypted with that key. To have query results encrypted with a
  KMS key, you must use an `AssociateKmsKey` operation with the
  `resourceIdentifier` parameter that specifies a `query-result` resource.

    * Specify the `resourceIdentifier` parameter with a `query-result`
  resource, to use that key to encrypt the stored results of all future
  [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html) operations in the account. The response from a
  [GetQueryResults](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html)
  operation will still return the query results in plain text.

  Even if you have not associated a key with your query results, the query results
  are encrypted when stored, using the default CloudWatch Logs method.

  If you run a query from a monitoring account that queries logs in a source
  account, the query results key from the monitoring account, if any, is used.

  If you delete the key that is used to encrypt log events or log group query
  results, then all the associated stored log events or query results that were
  encrypted with that key will be unencryptable and unusable.

  CloudWatch Logs supports only symmetric KMS keys. Do not use an associate an
  asymmetric KMS key with your log group or query results. For more information,
  see [Using Symmetric and Asymmetric Keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html).

  It can take up to 5 minutes for this operation to take effect.

  If you attempt to associate a KMS key with a log group but the KMS key does not
  exist or the KMS key is disabled, you receive an `InvalidParameterException`
  error.
  """
  def associate_kms_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AssociateKmsKey", input, options)
  end

  @doc """
  Cancels the specified export task.

  The task must be in the `PENDING` or `RUNNING` state.
  """
  def cancel_export_task(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CancelExportTask", input, options)
  end

  @doc """
  Creates a *delivery*.

  A delivery is a connection between a logical *delivery source* and a logical
  *delivery destination* that you have already created.

  Only some Amazon Web Services services support being configured as a delivery
  source using this operation. These services are listed as **Supported [V2 Permissions]** in the table at [Enabling logging from Amazon Web Services services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)

  A delivery destination can represent a log group in CloudWatch Logs, an Amazon
  S3 bucket, or a delivery stream in Kinesis Data Firehose.

  To configure logs delivery between a supported Amazon Web Services service and a
  destination, you must do the following:

    * Create a delivery source, which is a logical object that
  represents the resource that is actually sending the logs. For more information,
  see
  [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).     * Create a *delivery destination*, which is a logical object that
  represents the actual delivery destination. For more information, see
  [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).

    * If you are delivering logs cross-account, you must use
  [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
  in the destination account to assign an IAM policy to the destination. This
  policy allows delivery to that destination.

    * Use `CreateDelivery` to create a *delivery* by pairing exactly one
  delivery source and one delivery destination.

  You can configure a single delivery source to send logs to multiple destinations
  by creating multiple deliveries. You can also create multiple deliveries to
  configure multiple delivery sources to send logs to the same delivery
  destination.

  You can't update an existing delivery. You can only create and delete
  deliveries.
  """
  def create_delivery(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateDelivery", input, options)
  end

  @doc """
  Creates an export task so that you can efficiently export data from a log group
  to an Amazon S3 bucket.

  When you perform a `CreateExportTask` operation, you must use credentials that
  have permission to write to the S3 bucket that you specify as the destination.

  Exporting log data to S3 buckets that are encrypted by KMS is supported.
  Exporting log data to Amazon S3 buckets that have S3 Object Lock enabled with a
  retention period is also supported.

  Exporting to S3 buckets that are encrypted with AES-256 is supported.

  This is an asynchronous call. If all the required information is provided, this
  operation initiates an export task and responds with the ID of the task. After
  the task has started, you can use
  [DescribeExportTasks](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html) to get the status of the export task. Each account can only have one active
  (`RUNNING` or `PENDING`) export task at a time. To cancel an export task, use
  [CancelExportTask](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html).

  You can export logs from multiple log groups or multiple time ranges to the same
  S3 bucket. To separate log data for each export task, specify a prefix to be
  used as the Amazon S3 key prefix for all exported objects.

  Time-based sorting on chunks of log data inside an exported file is not
  guaranteed. You can sort the exported log field data by using Linux utilities.
  """
  def create_export_task(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateExportTask", input, options)
  end

  @doc """
  Creates an *anomaly detector* that regularly scans one or more log groups and
  look for patterns and anomalies in the logs.

  An anomaly detector can help surface issues by automatically discovering
  anomalies in your log event traffic. An anomaly detector uses machine learning
  algorithms to scan log events and find *patterns*. A pattern is a shared text
  structure that recurs among your log fields. Patterns provide a useful tool for
  analyzing large sets of logs because a large number of log events can often be
  compressed into a few patterns.

  The anomaly detector uses pattern recognition to find `anomalies`, which are
  unusual log events. It uses the `evaluationFrequency` to compare current log
  events and patterns with trained baselines.

  Fields within a pattern are called *tokens*. Fields that vary within a pattern,
  such as a request ID or timestamp, are referred to as *dynamic tokens* and
  represented by `<*>`.

  The following is an example of a pattern:

  `[INFO] Request time: <*> ms`  This pattern represents log events like `[INFO] Request time: 327 ms` and other
  similar log events that differ only by the number, in this csse 327. When the
  pattern is displayed, the different numbers are replaced by `<*>`

  Any parts of log events that are masked as sensitive data are not scanned for
  anomalies. For more information about masking sensitive data, see [Help protect sensitive log data with
  masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html).
  """
  def create_log_anomaly_detector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateLogAnomalyDetector", input, options)
  end

  @doc """
  Creates a log group with the specified name.

  You can create up to 1,000,000 log groups per Region per account.

  You must use the following guidelines when naming a log group:

    * Log group names must be unique within a Region for an Amazon Web
  Services account.

    * Log group names can be between 1 and 512 characters long.

    * Log group names consist of the following characters: a-z, A-Z,
  0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#'
  (number sign)

  When you create a log group, by default the log events in the log group do not
  expire. To set a retention policy so that events expire and are deleted after a
  specified time, use
  [PutRetentionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html).  If you associate an KMS key with the log group, ingested data is encrypted using
  the KMS key. This association is stored as long as the data encrypted with the
  KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt
  this data whenever it is requested.

  If you attempt to associate a KMS key with the log group but the KMS key does
  not exist or the KMS key is disabled, you receive an `InvalidParameterException`
  error.

  CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric
  KMS key with your log group. For more information, see [Using Symmetric and
  Asymmetric
  Keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html).
  """
  def create_log_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateLogGroup", input, options)
  end

  @doc """
  Creates a log stream for the specified log group.

  A log stream is a sequence of log events that originate from a single source,
  such as an application instance or a resource that is being monitored.

  There is no limit on the number of log streams that you can create for a log
  group. There is a limit of 50 TPS on `CreateLogStream` operations, after which
  transactions are throttled.

  You must use the following guidelines when naming a log stream:

    * Log stream names must be unique within the log group.

    * Log stream names can be between 1 and 512 characters long.

    * Don't use ':' (colon) or '*' (asterisk) characters.
  """
  def create_log_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateLogStream", input, options)
  end

  @doc """
  Deletes a CloudWatch Logs account policy.

  This stops the policy from applying to all log groups or a subset of log groups
  in the account. Log-group level policies will still be in effect.

  To use this operation, you must be signed on with the correct permissions
  depending on the type of policy that you are deleting.

    * To delete a data protection policy, you must have the
  `logs:DeleteDataProtectionPolicy` and `logs:DeleteAccountPolicy` permissions.

    * To delete a subscription filter policy, you must have the
  `logs:DeleteSubscriptionFilter` and `logs:DeleteAccountPolicy` permissions.
  """
  def delete_account_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteAccountPolicy", input, options)
  end

  @doc """
  Deletes the data protection policy from the specified log group.

  For more information about data protection policies, see
  [PutDataProtectionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html).
  """
  def delete_data_protection_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDataProtectionPolicy", input, options)
  end

  @doc """
  Deletes s *delivery*.

  A delivery is a connection between a logical *delivery source* and a logical
  *delivery destination*. Deleting a delivery only deletes the connection between
  the delivery source and delivery destination. It does not delete the delivery
  destination or the delivery source.
  """
  def delete_delivery(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDelivery", input, options)
  end

  @doc """
  Deletes a *delivery destination*.

  A delivery is a connection between a logical *delivery source* and a logical
  *delivery destination*.

  You can't delete a delivery destination if any current deliveries are associated
  with it. To find whether any deliveries are associated with this delivery
  destination, use the
  [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
  operation and check the `deliveryDestinationArn` field in the results.
  """
  def delete_delivery_destination(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDeliveryDestination", input, options)
  end

  @doc """
  Deletes a delivery destination policy.

  For more information about these policies, see
  [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html).
  """
  def delete_delivery_destination_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDeliveryDestinationPolicy", input, options)
  end

  @doc """
  Deletes a *delivery source*.

  A delivery is a connection between a logical *delivery source* and a logical
  *delivery destination*.

  You can't delete a delivery source if any current deliveries are associated with
  it. To find whether any deliveries are associated with this delivery source, use
  the
  [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
  operation and check the `deliverySourceName` field in the results.
  """
  def delete_delivery_source(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDeliverySource", input, options)
  end

  @doc """
  Deletes the specified destination, and eventually disables all the subscription
  filters that publish to it.

  This operation does not delete the physical resource encapsulated by the
  destination.
  """
  def delete_destination(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDestination", input, options)
  end

  @doc """
  Deletes the specified CloudWatch Logs anomaly detector.
  """
  def delete_log_anomaly_detector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteLogAnomalyDetector", input, options)
  end

  @doc """
  Deletes the specified log group and permanently deletes all the archived log
  events associated with the log group.
  """
  def delete_log_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteLogGroup", input, options)
  end

  @doc """
  Deletes the specified log stream and permanently deletes all the archived log
  events associated with the log stream.
  """
  def delete_log_stream(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteLogStream", input, options)
  end

  @doc """
  Deletes the specified metric filter.
  """
  def delete_metric_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteMetricFilter", input, options)
  end

  @doc """
  Deletes a saved CloudWatch Logs Insights query definition.

  A query definition contains details about a saved CloudWatch Logs Insights
  query.

  Each `DeleteQueryDefinition` operation can delete one query definition.

  You must have the `logs:DeleteQueryDefinition` permission to be able to perform
  this operation.
  """
  def delete_query_definition(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteQueryDefinition", input, options)
  end

  @doc """
  Deletes a resource policy from this account.

  This revokes the access of the identities in that policy to put log events to
  this account.
  """
  def delete_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteResourcePolicy", input, options)
  end

  @doc """
  Deletes the specified retention policy.

  Log events do not expire if they belong to log groups without a retention
  policy.
  """
  def delete_retention_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteRetentionPolicy", input, options)
  end

  @doc """
  Deletes the specified subscription filter.
  """
  def delete_subscription_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSubscriptionFilter", input, options)
  end

  @doc """
  Returns a list of all CloudWatch Logs account policies in the account.
  """
  def describe_account_policies(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAccountPolicies", input, options)
  end

  @doc """
  Retrieves a list of the deliveries that have been created in the account.
  """
  def describe_deliveries(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDeliveries", input, options)
  end

  @doc """
  Retrieves a list of the delivery destinations that have been created in the
  account.
  """
  def describe_delivery_destinations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDeliveryDestinations", input, options)
  end

  @doc """
  Retrieves a list of the delivery sources that have been created in the account.
  """
  def describe_delivery_sources(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDeliverySources", input, options)
  end

  @doc """
  Lists all your destinations.

  The results are ASCII-sorted by destination name.
  """
  def describe_destinations(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDestinations", input, options)
  end

  @doc """
  Lists the specified export tasks.

  You can list all your export tasks or filter the results based on task ID or
  task status.
  """
  def describe_export_tasks(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeExportTasks", input, options)
  end

  @doc """
  Lists the specified log groups.

  You can list all your log groups or filter the results by prefix. The results
  are ASCII-sorted by log group name.

  CloudWatch Logs doesn’t support IAM policies that control access to the
  `DescribeLogGroups` action by using the `aws:ResourceTag/*key-name* ` condition
  key. Other CloudWatch Logs actions do support the use of the
  `aws:ResourceTag/*key-name* ` condition key to control access. For more
  information about using tags to control access, see [Controlling access to Amazon Web Services resources using
  tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html).

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account and view data from the linked source accounts.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
  """
  def describe_log_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeLogGroups", input, options)
  end

  @doc """
  Lists the log streams for the specified log group.

  You can list all the log streams or filter the results by prefix. You can also
  control how the results are ordered.

  You can specify the log group to search by using either `logGroupIdentifier` or
  `logGroupName`. You must include one of these two parameters, but you can't
  include both.

  This operation has a limit of five transactions per second, after which
  transactions are throttled.

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account and view data from the linked source accounts.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
  """
  def describe_log_streams(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeLogStreams", input, options)
  end

  @doc """
  Lists the specified metric filters.

  You can list all of the metric filters or filter the results by log name,
  prefix, metric name, or metric namespace. The results are ASCII-sorted by filter
  name.
  """
  def describe_metric_filters(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeMetricFilters", input, options)
  end

  @doc """
  Returns a list of CloudWatch Logs Insights queries that are scheduled, running,
  or have been run recently in this account.

  You can request all queries or limit it to queries of a specific log group or
  queries with a certain status.
  """
  def describe_queries(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeQueries", input, options)
  end

  @doc """
  This operation returns a paginated list of your saved CloudWatch Logs Insights
  query definitions.

  You can retrieve query definitions from the current account or from a source
  account that is linked to the current account.

  You can use the `queryDefinitionNamePrefix` parameter to limit the results to
  only the query definitions that have names that start with a certain string.
  """
  def describe_query_definitions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeQueryDefinitions", input, options)
  end

  @doc """
  Lists the resource policies in this account.
  """
  def describe_resource_policies(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeResourcePolicies", input, options)
  end

  @doc """
  Lists the subscription filters for the specified log group.

  You can list all the subscription filters or filter the results by prefix. The
  results are ASCII-sorted by filter name.
  """
  def describe_subscription_filters(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSubscriptionFilters", input, options)
  end

  @doc """
  Disassociates the specified KMS key from the specified log group or from all
  CloudWatch Logs Insights query results in the account.

  When you use `DisassociateKmsKey`, you specify either the `logGroupName`
  parameter or the `resourceIdentifier` parameter. You can't specify both of those
  parameters in the same operation.

    * Specify the `logGroupName` parameter to stop using the KMS key to
  encrypt future log events ingested and stored in the log group. Instead, they
  will be encrypted with the default CloudWatch Logs method. The log events that
  were ingested while the key was associated with the log group are still
  encrypted with that key. Therefore, CloudWatch Logs will need permissions for
  the key whenever that data is accessed.

    * Specify the `resourceIdentifier` parameter with the `query-result`
  resource to stop using the KMS key to encrypt the results of all future
  [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
  operations in the account. They will instead be encrypted with the default
  CloudWatch Logs method. The results from queries that ran while the key was
  associated with the account are still encrypted with that key. Therefore,
  CloudWatch Logs will need permissions for the key whenever that data is
  accessed.

  It can take up to 5 minutes for this operation to take effect.
  """
  def disassociate_kms_key(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisassociateKmsKey", input, options)
  end

  @doc """
  Lists log events from the specified log group.

  You can list all the log events or filter the results using a filter pattern, a
  time range, and the name of the log stream.

  You must have the `logs:FilterLogEvents` permission to perform this operation.

  You can specify the log group to search by using either `logGroupIdentifier` or
  `logGroupName`. You must include one of these two parameters, but you can't
  include both.

  By default, this operation returns as many log events as can fit in 1 MB (up to
  10,000 log events) or all the events found within the specified time range. If
  the results include a token, that means there are more log events available. You
  can get additional results by specifying the token in a subsequent call. This
  operation can return empty results while there are more log events available
  through the token.

  The returned log events are sorted by event timestamp, the timestamp when the
  event was ingested by CloudWatch Logs, and the ID of the `PutLogEvents` request.

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account and view data from the linked source accounts.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
  """
  def filter_log_events(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "FilterLogEvents", input, options)
  end

  @doc """
  Returns information about a log group data protection policy.
  """
  def get_data_protection_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetDataProtectionPolicy", input, options)
  end

  @doc """
  Returns complete information about one *delivery*.

  A delivery is a connection between a logical *delivery source* and a logical
  *delivery destination*

  You need to specify the delivery `id` in this operation. You can find the IDs of
  the deliveries in your account with the
  [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
  operation.
  """
  def get_delivery(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetDelivery", input, options)
  end

  @doc """
  Retrieves complete information about one delivery destination.
  """
  def get_delivery_destination(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetDeliveryDestination", input, options)
  end

  @doc """
  Retrieves the delivery destination policy assigned to the delivery destination
  that you specify.

  For more information about delivery destinations and their policies, see
  [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html).
  """
  def get_delivery_destination_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetDeliveryDestinationPolicy", input, options)
  end

  @doc """
  Retrieves complete information about one delivery source.
  """
  def get_delivery_source(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetDeliverySource", input, options)
  end

  @doc """
  Retrieves information about the log anomaly detector that you specify.
  """
  def get_log_anomaly_detector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetLogAnomalyDetector", input, options)
  end

  @doc """
  Lists log events from the specified log stream.

  You can list all of the log events or filter using a time range.

  By default, this operation returns as many log events as can fit in a response
  size of 1MB (up to 10,000 log events). You can get additional log events by
  specifying one of the tokens in a subsequent call. This operation can return
  empty results while there are more log events available through the token.

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account and view data from the linked source accounts.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).

  You can specify the log group to search by using either `logGroupIdentifier` or
  `logGroupName`. You must include one of these two parameters, but you can't
  include both.
  """
  def get_log_events(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetLogEvents", input, options)
  end

  @doc """
  Returns a list of the fields that are included in log events in the specified
  log group.

  Includes the percentage of log events that contain each field. The search is
  limited to a time period that you specify.

  You can specify the log group to search by using either `logGroupIdentifier` or
  `logGroupName`. You must specify one of these parameters, but you can't specify
  both.

  In the results, fields that start with `@` are fields generated by CloudWatch
  Logs. For example, `@timestamp` is the timestamp of each log event. For more
  information about the fields that are generated by CloudWatch logs, see
  [Supported Logs and Discovered Fields](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html).

  The response results are sorted by the frequency percentage, starting with the
  highest percentage.

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account and view data from the linked source accounts.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
  """
  def get_log_group_fields(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetLogGroupFields", input, options)
  end

  @doc """
  Retrieves all of the fields and values of a single log event.

  All fields are retrieved, even if the original query that produced the
  `logRecordPointer` retrieved only a subset of fields. Fields are returned as
  field name/field value pairs.

  The full unparsed log event is returned within `@message`.
  """
  def get_log_record(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetLogRecord", input, options)
  end

  @doc """
  Returns the results from the specified query.

  Only the fields requested in the query are returned, along with a `@ptr` field,
  which is the identifier for the log record. You can use the value of `@ptr` in a
  [GetLogRecord](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html) operation to get the full log record.

  `GetQueryResults` does not start running a query. To run a query, use
  [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html).
  For more information about how long results of previous queries are available,
  see [CloudWatch Logs quotas](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html).

  If the value of the `Status` field in the output is `Running`, this operation
  returns only partial results. If you see a value of `Scheduled` or `Running` for
  the status, you can retry the operation later to see the final results.

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account to start queries in linked source accounts.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
  """
  def get_query_results(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetQueryResults", input, options)
  end

  @doc """
  Returns a list of anomalies that log anomaly detectors have found.

  For details about the structure format of each anomaly object that is returned,
  see the example in this section.
  """
  def list_anomalies(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAnomalies", input, options)
  end

  @doc """
  Retrieves a list of the log anomaly detectors in the account.
  """
  def list_log_anomaly_detectors(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListLogAnomalyDetectors", input, options)
  end

  @doc """
  Displays the tags associated with a CloudWatch Logs resource.

  Currently, log groups and destinations support tagging.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  The ListTagsLogGroup operation is on the path to deprecation.

  We recommend that you use
  [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html)
  instead.

  Lists the tags for the specified log group.
  """
  def list_tags_log_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsLogGroup", input, options)
  end

  @doc """
  Creates an account-level data protection policy or subscription filter policy
  that applies to all log groups or a subset of log groups in the account.

  ## Data protection policy

  A data protection policy can help safeguard sensitive data that's ingested by
  your log groups by auditing and masking the sensitive log data. Each account can
  have only one account-level data protection policy.

  Sensitive data is detected and masked when it is ingested into a log group. When
  you set a data protection policy, log events ingested into the log groups before
  that time are not masked.

  If you use `PutAccountPolicy` to create a data protection policy for your whole
  account, it applies to both existing log groups and all log groups that are
  created later in this account. The account-level policy is applied to existing
  log groups with eventual consistency. It might take up to 5 minutes before
  sensitive data in existing log groups begins to be masked.

  By default, when a user views a log event that includes masked data, the
  sensitive data is replaced by asterisks. A user who has the `logs:Unmask`
  permission can use a
  [GetLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html) or
  [FilterLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html)
  operation with the `unmask` parameter set to `true` to view the unmasked log
  events. Users with the `logs:Unmask` can also view unmasked data in the
  CloudWatch Logs console by running a CloudWatch Logs Insights query with the
  `unmask` query command.

  For more information, including a list of types of data that can be audited and
  masked, see [Protect sensitive log data with masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html).

  To use the `PutAccountPolicy` operation for a data protection policy, you must
  be signed on with the `logs:PutDataProtectionPolicy` and `logs:PutAccountPolicy`
  permissions.

  The `PutAccountPolicy` operation applies to all log groups in the account. You
  can use
  [PutDataProtectionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html) to create a data protection policy that applies to just one log group. If a log
  group has its own data protection policy and the account also has an
  account-level data protection policy, then the two policies are cumulative. Any
  sensitive term specified in either policy is masked.

  ## Subscription filter policy

  A subscription filter policy sets up a real-time feed of log events from
  CloudWatch Logs to other Amazon Web Services services. Account-level
  subscription filter policies apply to both existing log groups and log groups
  that are created later in this account. Supported destinations are Kinesis Data
  Streams, Kinesis Data Firehose, and Lambda. When log events are sent to the
  receiving service, they are Base64 encoded and compressed with the GZIP format.

  The following destinations are supported for subscription filters:

    * An Kinesis Data Streams data stream in the same account as the
  subscription policy, for same-account delivery.

    * An Kinesis Data Firehose data stream in the same account as the
  subscription policy, for same-account delivery.

    * A Lambda function in the same account as the subscription policy,
  for same-account delivery.

    * A logical destination in a different account created with
  [PutDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html),
  for cross-account delivery. Kinesis Data Streams and Kinesis Data Firehose are
  supported as logical destinations.

  Each account can have one account-level subscription filter policy. If you are
  updating an existing filter, you must specify the correct name in `PolicyName`.
  To perform a `PutAccountPolicy` subscription filter operation for any
  destination except a Lambda function, you must also have the `iam:PassRole`
  permission.
  """
  def put_account_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutAccountPolicy", input, options)
  end

  @doc """
  Creates a data protection policy for the specified log group.

  A data protection policy can help safeguard sensitive data that's ingested by
  the log group by auditing and masking the sensitive log data.

  Sensitive data is detected and masked when it is ingested into the log group.
  When you set a data protection policy, log events ingested into the log group
  before that time are not masked.

  By default, when a user views a log event that includes masked data, the
  sensitive data is replaced by asterisks. A user who has the `logs:Unmask`
  permission can use a
  [GetLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html) or
  [FilterLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html)
  operation with the `unmask` parameter set to `true` to view the unmasked log
  events. Users with the `logs:Unmask` can also view unmasked data in the
  CloudWatch Logs console by running a CloudWatch Logs Insights query with the
  `unmask` query command.

  For more information, including a list of types of data that can be audited and
  masked, see [Protect sensitive log data with masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html).

  The `PutDataProtectionPolicy` operation applies to only the specified log group.
  You can also use
  [PutAccountPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html)
  to create an account-level data protection policy that applies to all log groups
  in the account, including both existing log groups and log groups that are
  created level. If a log group has its own data protection policy and the account
  also has an account-level data protection policy, then the two policies are
  cumulative. Any sensitive term specified in either policy is masked.
  """
  def put_data_protection_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutDataProtectionPolicy", input, options)
  end

  @doc """
  Creates or updates a logical *delivery destination*.

  A delivery destination is an Amazon Web Services resource that represents an
  Amazon Web Services service that logs can be sent to. CloudWatch Logs, Amazon
  S3, and Kinesis Data Firehose are supported as logs delivery destinations.

  To configure logs delivery between a supported Amazon Web Services service and a
  destination, you must do the following:

    * Create a delivery source, which is a logical object that
  represents the resource that is actually sending the logs. For more information,
  see
  [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).     * Use `PutDeliveryDestination` to create a *delivery destination*,
  which is a logical object that represents the actual delivery destination.

    * If you are delivering logs cross-account, you must use
  [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
  in the destination account to assign an IAM policy to the destination. This
  policy allows delivery to that destination.

    * Use `CreateDelivery` to create a *delivery* by pairing exactly one
  delivery source and one delivery destination. For more information, see
  [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html). 

  You can configure a single delivery source to send logs to multiple destinations
  by creating multiple deliveries. You can also create multiple deliveries to
  configure multiple delivery sources to send logs to the same delivery
  destination.

  Only some Amazon Web Services services support being configured as a delivery
  source. These services are listed as **Supported [V2 Permissions]** in the table
  at [Enabling logging from Amazon Web Services services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)

  If you use this operation to update an existing delivery destination, all the
  current delivery destination parameters are overwritten with the new parameter
  values that you specify.
  """
  def put_delivery_destination(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutDeliveryDestination", input, options)
  end

  @doc """
  Creates and assigns an IAM policy that grants permissions to CloudWatch Logs to
  deliver logs cross-account to a specified destination in this account.

  To configure the delivery of logs from an Amazon Web Services service in another
  account to a logs delivery destination in the current account, you must do the
  following:

    * Create a delivery source, which is a logical object that
  represents the resource that is actually sending the logs. For more information,
  see
  [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).     * Create a *delivery destination*, which is a logical object that
  represents the actual delivery destination. For more information, see
  [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).

    * Use this operation in the destination account to assign an IAM
  policy to the destination. This policy allows delivery to that destination.

    * Create a *delivery* by pairing exactly one delivery source and one
  delivery destination. For more information, see
  [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html). 

  Only some Amazon Web Services services support being configured as a delivery
  source. These services are listed as **Supported [V2 Permissions]** in the table
  at [Enabling logging from Amazon Web Services services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)

  The contents of the policy must include two statements. One statement enables
  general logs delivery, and the other allows delivery to the chosen destination.
  See the examples for the needed policies.
  """
  def put_delivery_destination_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutDeliveryDestinationPolicy", input, options)
  end

  @doc """
  Creates or updates a logical *delivery source*.

  A delivery source represents an Amazon Web Services resource that sends logs to
  an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3,
  or Kinesis Data Firehose.

  To configure logs delivery between a delivery destination and an Amazon Web
  Services service that is supported as a delivery source, you must do the
  following:

    * Use `PutDeliverySource` to create a delivery source, which is a
  logical object that represents the resource that is actually sending the logs.

    * Use `PutDeliveryDestination` to create a *delivery destination*,
  which is a logical object that represents the actual delivery destination. For
  more information, see
  [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).     * If you are delivering logs cross-account, you must use
  [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
  in the destination account to assign an IAM policy to the destination. This
  policy allows delivery to that destination.

    * Use `CreateDelivery` to create a *delivery* by pairing exactly one
  delivery source and one delivery destination. For more information, see
  [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html). 

  You can configure a single delivery source to send logs to multiple destinations
  by creating multiple deliveries. You can also create multiple deliveries to
  configure multiple delivery sources to send logs to the same delivery
  destination.

  Only some Amazon Web Services services support being configured as a delivery
  source. These services are listed as **Supported [V2 Permissions]** in the table
  at [Enabling logging from Amazon Web Services services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)

  If you use this operation to update an existing delivery source, all the current
  delivery source parameters are overwritten with the new parameter values that
  you specify.
  """
  def put_delivery_source(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutDeliverySource", input, options)
  end

  @doc """
  Creates or updates a destination.

  This operation is used only to create destinations for cross-account
  subscriptions.

  A destination encapsulates a physical resource (such as an Amazon Kinesis
  stream). With a destination, you can subscribe to a real-time stream of log
  events for a different account, ingested using
  [PutLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html).  Through an access policy, a destination controls what is written to it. By
  default, `PutDestination` does not set any access policy with the destination,
  which means a cross-account user cannot call
  [PutSubscriptionFilter](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html)
  against this destination. To enable this, the destination owner must call
  [PutDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html)
  after `PutDestination`.

  To perform a `PutDestination` operation, you must also have the `iam:PassRole`
  permission.
  """
  def put_destination(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutDestination", input, options)
  end

  @doc """
  Creates or updates an access policy associated with an existing destination.

  An access policy is an [IAM policy document](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html)
  that is used to authorize claims to register a subscription filter against a
  given destination.
  """
  def put_destination_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutDestinationPolicy", input, options)
  end

  @doc """
  Uploads a batch of log events to the specified log stream.

  The sequence token is now ignored in `PutLogEvents` actions. `PutLogEvents`
  actions are always accepted and never return `InvalidSequenceTokenException` or
  `DataAlreadyAcceptedException` even if the sequence token is not valid. You can
  use parallel `PutLogEvents` actions on the same log stream.

  The batch of events must satisfy the following constraints:

    * The maximum batch size is 1,048,576 bytes. This size is calculated
  as the sum of all event messages in UTF-8, plus 26 bytes for each log event.

    * None of the log events in the batch can be more than 2 hours in
  the future.

    * None of the log events in the batch can be more than 14 days in
  the past. Also, none of the log events can be from earlier than the retention
  period of the log group.

    * The log events in the batch must be in chronological order by
  their timestamp. The timestamp is the time that the event occurred, expressed as
  the number of milliseconds after `Jan 1, 1970 00:00:00 UTC`. (In Amazon Web
  Services Tools for PowerShell and the Amazon Web Services SDK for .NET, the
  timestamp is specified in .NET format: `yyyy-mm-ddThh:mm:ss`. For example,
  `2017-09-15T13:45:30`.)

    * A batch of log events in a single request cannot span more than 24
  hours. Otherwise, the operation fails.

    * Each log event can be no larger than 256 KB.

    * The maximum number of log events in a batch is 10,000.

    * The quota of five requests per second per log stream has been
  removed. Instead, `PutLogEvents` actions are throttled based on a per-second
  per-account quota. You can request an increase to the per-second throttling
  quota by using the Service Quotas service.

  If a call to `PutLogEvents` returns "UnrecognizedClientException" the most
  likely cause is a non-valid Amazon Web Services access key ID or secret key.
  """
  def put_log_events(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutLogEvents", input, options)
  end

  @doc """
  Creates or updates a metric filter and associates it with the specified log
  group.

  With metric filters, you can configure rules to extract metric data from log
  events ingested through
  [PutLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html).  The maximum number of metric filters that can be associated with a log group is
  100.

  When you create a metric filter, you can also optionally assign a unit and
  dimensions to the metric that is created.

  Metrics extracted from log events are charged as custom metrics. To prevent
  unexpected high charges, do not specify high-cardinality fields such as
  `IPAddress` or `requestID` as dimensions. Each different value found for a
  dimension is treated as a separate metric and accrues charges as a separate
  custom metric.

  CloudWatch Logs might disable a metric filter if it generates 1,000 different
  name/value pairs for your specified dimensions within one hour.

  You can also set up a billing alarm to alert you if your charges are higher than
  expected. For more information, see [ Creating a Billing Alarm to Monitor Your
  Estimated Amazon Web Services
  Charges](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html).
  """
  def put_metric_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutMetricFilter", input, options)
  end

  @doc """
  Creates or updates a query definition for CloudWatch Logs Insights.

  For more information, see [Analyzing Log Data with CloudWatch Logs Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html).

  To update a query definition, specify its `queryDefinitionId` in your request.
  The values of `name`, `queryString`, and `logGroupNames` are changed to the
  values that you specify in your update operation. No current values are retained
  from the current query definition. For example, imagine updating a current query
  definition that includes log groups. If you don't specify the `logGroupNames`
  parameter in your update operation, the query definition changes to contain no
  log groups.

  You must have the `logs:PutQueryDefinition` permission to be able to perform
  this operation.
  """
  def put_query_definition(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutQueryDefinition", input, options)
  end

  @doc """
  Creates or updates a resource policy allowing other Amazon Web Services services
  to put log events to this account, such as Amazon Route 53.

  An account can have up to 10 resource policies per Amazon Web Services Region.
  """
  def put_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutResourcePolicy", input, options)
  end

  @doc """
  Sets the retention of the specified log group.

  With a retention policy, you can configure the number of days for which to
  retain log events in the specified log group.

  CloudWatch Logs doesn’t immediately delete log events when they reach their
  retention setting. It typically takes up to 72 hours after that before log
  events are deleted, but in rare situations might take longer.

  To illustrate, imagine that you change a log group to have a longer retention
  setting when it contains log events that are past the expiration date, but
  haven’t been deleted. Those log events will take up to 72 hours to be deleted
  after the new retention date is reached. To make sure that log data is deleted
  permanently, keep a log group at its lower retention setting until 72 hours
  after the previous retention period ends. Alternatively, wait to change the
  retention setting until you confirm that the earlier log events are deleted.

  When log events reach their retention setting they are marked for deletion.
  After they are marked for deletion, they do not add to your archival storage
  costs anymore, even if they are not actually deleted until later. These log
  events marked for deletion are also not included when you use an API to retrieve
  the `storedBytes` value to see how many bytes a log group is storing.
  """
  def put_retention_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutRetentionPolicy", input, options)
  end

  @doc """
  Creates or updates a subscription filter and associates it with the specified
  log group.

  With subscription filters, you can subscribe to a real-time stream of log events
  ingested through
  [PutLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html) and have them delivered to a specific destination. When log events are sent to
  the receiving service, they are Base64 encoded and compressed with the GZIP
  format.

  The following destinations are supported for subscription filters:

    * An Amazon Kinesis data stream belonging to the same account as the
  subscription filter, for same-account delivery.

    * A logical destination created with
  [PutDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html)
  that belongs to a different account, for cross-account delivery. We currently
  support Kinesis Data Streams and Kinesis Data Firehose as logical destinations.

    * An Amazon Kinesis Data Firehose delivery stream that belongs to
  the same account as the subscription filter, for same-account delivery.

    * An Lambda function that belongs to the same account as the
  subscription filter, for same-account delivery.

  Each log group can have up to two subscription filters associated with it. If
  you are updating an existing filter, you must specify the correct name in
  `filterName`.

  To perform a `PutSubscriptionFilter` operation for any destination except a
  Lambda function, you must also have the `iam:PassRole` permission.
  """
  def put_subscription_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutSubscriptionFilter", input, options)
  end

  @doc """
  Starts a Live Tail streaming session for one or more log groups.

  A Live Tail session returns a stream of log events that have been recently
  ingested in the log groups. For more information, see [Use Live Tail to view logs in near real
  time](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html).

  The response to this operation is a response stream, over which the server sends
  live log events and the client receives them.

  The following objects are sent over the stream:

    * A single
  [LiveTailSessionStart](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionStart.html) object is sent at the start of the session.

    * Every second, a
  [LiveTailSessionUpdate](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionUpdate.html)
  object is sent. Each of these objects contains an array of the actual log
  events.

  If no new log events were ingested in the past second, the
  `LiveTailSessionUpdate` object will contain an empty array.

  The array of log events contained in a `LiveTailSessionUpdate` can include as
  many as 500 log events. If the number of log events matching the request exceeds
  500 per second, the log events are sampled down to 500 log events to be included
  in each `LiveTailSessionUpdate` object.

  If your client consumes the log events slower than the server produces them,
  CloudWatch Logs buffers up to 10 `LiveTailSessionUpdate` events or 5000 log
  events, after which it starts dropping the oldest events.

    * A
  [SessionStreamingException](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_SessionStreamingException.html) object is returned if an unknown error occurs on the server side.

    * A
  [SessionTimeoutException](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_SessionTimeoutException.html)
  object is returned when the session times out, after it has been kept open for
  three hours.

  You can end a session before it times out by closing the session stream or by
  closing the client that is receiving the stream. The session also ends if the
  established connection between the client and the server breaks.

  For examples of using an SDK to start a Live Tail session, see [ Start a Live Tail session using an Amazon Web Services
  SDK](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/example_cloudwatch-logs_StartLiveTail_section.html).
  """
  def start_live_tail(%Client{} = client, input, options \\ []) do
    meta = metadata() |> Map.put_new(:host_prefix, "streaming-")

    Request.request_post(client, meta, "StartLiveTail", input, options)
  end

  @doc """
  Schedules a query of a log group using CloudWatch Logs Insights.

  You specify the log group and time range to query and the query string to use.

  For more information, see [CloudWatch Logs Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).

  After you run a query using `StartQuery`, the query results are stored by
  CloudWatch Logs. You can use
  [GetQueryResults](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html) to retrieve the results of a query, using the `queryId` that `StartQuery`
  returns.

  If you have associated a KMS key with the query results in this account, then
  [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
  uses that key to encrypt the results when it stores them. If no key is
  associated with query results, the query results are encrypted with the default
  CloudWatch Logs encryption method.

  Queries time out after 60 minutes of runtime. If your queries are timing out,
  reduce the time range being searched or partition your query into a number of
  queries.

  If you are using CloudWatch cross-account observability, you can use this
  operation in a monitoring account to start a query in a linked source account.
  For more information, see [CloudWatch cross-account observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
  For a cross-account `StartQuery` operation, the query definition must be defined
  in the monitoring account.

  You can have up to 30 concurrent CloudWatch Logs insights queries, including
  queries that have been added to dashboards.
  """
  def start_query(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartQuery", input, options)
  end

  @doc """
  Stops a CloudWatch Logs Insights query that is in progress.

  If the query has already ended, the operation returns an error indicating that
  the specified query is not running.
  """
  def stop_query(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StopQuery", input, options)
  end

  @doc """
  The TagLogGroup operation is on the path to deprecation.

  We recommend that you use
  [TagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html) instead.

  Adds or updates the specified tags for the specified log group.

  To list the tags for a log group, use
  [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html).
  To remove tags, use
  [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html).  For more information about tags, see [Tag Log Groups in Amazon CloudWatch
  Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging)
  in the *Amazon CloudWatch Logs User Guide*.

  CloudWatch Logs doesn’t support IAM policies that prevent users from assigning
  specified tags to log groups using the `aws:Resource/*key-name* ` or
  `aws:TagKeys` condition keys. For more information about using tags to control
  access, see [Controlling access to Amazon Web Services resources using tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html).
  """
  def tag_log_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagLogGroup", input, options)
  end

  @doc """
  Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs
  resource.

  Currently, the only CloudWatch Logs resources that can be tagged are log groups
  and destinations.

  Tags can help you organize and categorize your resources. You can also use them
  to scope user permissions by granting a user permission to access or change only
  resources with certain tag values.

  Tags don't have any semantic meaning to Amazon Web Services and are interpreted
  strictly as strings of characters.

  You can use the `TagResource` action with a resource that already has tags. If
  you specify a new tag key for the alarm, this tag is appended to the list of
  tags associated with the alarm. If you specify a tag key that is already
  associated with the alarm, the new tag value that you specify replaces the
  previous value for that tag.

  You can associate as many as 50 tags with a CloudWatch Logs resource.
  """
  def tag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagResource", input, options)
  end

  @doc """
  Tests the filter pattern of a metric filter against a sample of log event
  messages.

  You can use this operation to validate the correctness of a metric filter
  pattern.
  """
  def test_metric_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TestMetricFilter", input, options)
  end

  @doc """
  The UntagLogGroup operation is on the path to deprecation.

  We recommend that you use
  [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html) instead.

  Removes the specified tags from the specified log group.

  To list the tags for a log group, use
  [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html).
  To add tags, use
  [TagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html).

  CloudWatch Logs doesn’t support IAM policies that prevent users from assigning
  specified tags to log groups using the `aws:Resource/*key-name* ` or
  `aws:TagKeys` condition keys.
  """
  def untag_log_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagLogGroup", input, options)
  end

  @doc """
  Removes one or more tags from the specified resource.
  """
  def untag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagResource", input, options)
  end

  @doc """
  Use this operation to *suppress* anomaly detection for a specified anomaly or
  pattern.

  If you suppress an anomaly, CloudWatch Logs won’t report new occurrences of that
  anomaly and won't update that anomaly with new data. If you suppress a pattern,
  CloudWatch Logs won’t report any anomalies related to that pattern.

  You must specify either `anomalyId` or `patternId`, but you can't specify both
  parameters in the same operation.

  If you have previously used this operation to suppress detection of a pattern or
  anomaly, you can use it again to cause CloudWatch Logs to end the suppression.
  To do this, use this operation and specify the anomaly or pattern to stop
  suppressing, and omit the `suppressionType` and `suppressionPeriod` parameters.
  """
  def update_anomaly(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateAnomaly", input, options)
  end

  @doc """
  Updates an existing log anomaly detector.
  """
  def update_log_anomaly_detector(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateLogAnomalyDetector", input, options)
  end
end
