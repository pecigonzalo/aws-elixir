# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.Personalize do
  @moduledoc """
  Amazon Personalize is a machine learning service that makes it easy to add
  individualized recommendations to customers.
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: nil,
      api_version: "2018-05-22",
      content_type: "application/x-amz-json-1.1",
      credential_scope: nil,
      endpoint_prefix: "personalize",
      global?: false,
      protocol: "json",
      service_id: "Personalize",
      signature_version: "v4",
      signing_name: "personalize",
      target_prefix: "AmazonPersonalize"
    }
  end

  @doc """
  Generates batch recommendations based on a list of items or users stored in
  Amazon S3 and exports the recommendations to an Amazon S3 bucket.

  To generate batch recommendations, specify the ARN of a solution version and an
  Amazon S3 URI for the input and output data. For user personalization, popular
  items, and personalized ranking solutions, the batch inference job generates a
  list of recommended items for each user ID in the input file. For related items
  solutions, the job generates a list of recommended items for each item ID in the
  input file.

  For more information, see [Creating a batch inference job
  ](https://docs.aws.amazon.com/personalize/latest/dg/getting-batch-recommendations.html).

  If you use the Similar-Items recipe, Amazon Personalize can add descriptive
  themes to batch recommendations. To generate themes, set the job's mode to
  `THEME_GENERATION` and specify the name of the field that contains item names in
  the input data.

  For more information about generating themes, see [Batch recommendations with themes from Content Generator
  ](https://docs.aws.amazon.com/personalize/latest/dg/themed-batch-recommendations.html).

  You can't get batch recommendations with the Trending-Now or Next-Best-Action
  recipes.
  """
  def create_batch_inference_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateBatchInferenceJob", input, options)
  end

  @doc """
  Creates a batch segment job.

  The operation can handle up to 50 million records and the input file must be in
  JSON format. For more information, see [Getting batch recommendations and user segments](https://docs.aws.amazon.com/personalize/latest/dg/recommendations-batch.html).
  """
  def create_batch_segment_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateBatchSegmentJob", input, options)
  end

  @doc """
  Creates a campaign that deploys a solution version.

  When a client calls the
  [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) and
  [GetPersonalizedRanking](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html)
  APIs, a campaign is specified in the request.

  ## Minimum Provisioned TPS and Auto-Scaling

  A high `minProvisionedTPS` will increase your cost. We recommend starting with 1
  for `minProvisionedTPS` (the default). Track your usage using Amazon CloudWatch
  metrics, and increase the `minProvisionedTPS` as necessary.

  When you create an Amazon Personalize campaign, you can specify the minimum
  provisioned transactions per second (`minProvisionedTPS`) for the campaign. This
  is the baseline transaction throughput for the campaign provisioned by Amazon
  Personalize. It sets the minimum billing charge for the campaign while it is
  active. A transaction is a single `GetRecommendations` or
  `GetPersonalizedRanking` request. The default `minProvisionedTPS` is 1.

  If your TPS increases beyond the `minProvisionedTPS`, Amazon Personalize
  auto-scales the provisioned capacity up and down, but never below
  `minProvisionedTPS`. There's a short time delay while the capacity is increased
  that might cause loss of transactions. When your traffic reduces, capacity
  returns to the `minProvisionedTPS`.

  You are charged for the the minimum provisioned TPS or, if your requests exceed
  the `minProvisionedTPS`, the actual TPS. The actual TPS is the total number of
  recommendation requests you make. We recommend starting with a low
  `minProvisionedTPS`, track your usage using Amazon CloudWatch metrics, and then
  increase the `minProvisionedTPS` as necessary.

  For more information about campaign costs, see [Amazon Personalize pricing](https://aws.amazon.com/personalize/pricing/).

  ## Status

  A campaign can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * DELETE PENDING > DELETE IN_PROGRESS

  To get the campaign status, call
  [DescribeCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html).  Wait until the `status` of the campaign is `ACTIVE` before asking the campaign
  for recommendations.

  ## Related APIs

    *
  [ListCampaigns](https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html)

    *
  [DescribeCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html)     *
  [UpdateCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateCampaign.html)

    *
  [DeleteCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteCampaign.html)
  """
  def create_campaign(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateCampaign", input, options)
  end

  @doc """
  Creates an empty dataset and adds it to the specified dataset group.

  Use
  [CreateDatasetImportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html) to import your training data to a dataset.

  There are 5 types of datasets:

    * Item interactions

    * Items

    * Users

    * Action interactions

    * Actions

  Each dataset type has an associated schema with required field types. Only the
  `Item interactions` dataset is required in order to train a model (also referred
  to as creating a solution).

  A dataset can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * DELETE PENDING > DELETE IN_PROGRESS

  To get the status of the dataset, call
  [DescribeDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html).

  ## Related APIs

    *
  [CreateDatasetGroup](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html)     *
  [ListDatasets](https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasets.html)

    *
  [DescribeDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html)     *
  [DeleteDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDataset.html)
  """
  def create_dataset(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateDataset", input, options)
  end

  @doc """
  Creates a job that exports data from your dataset to an Amazon S3 bucket.

  To allow Amazon Personalize to export the training data, you must specify an
  service-linked IAM role that gives Amazon Personalize `PutObject` permissions
  for your Amazon S3 bucket. For information, see [Exporting a dataset](https://docs.aws.amazon.com/personalize/latest/dg/export-data.html) in
  the Amazon Personalize developer guide.

  ## Status

  A dataset export job can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

  To get the status of the export job, call
  [DescribeDatasetExportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetExportJob.html),
  and specify the Amazon Resource Name (ARN) of the dataset export job. The
  dataset export is complete when the status shows as ACTIVE. If the status shows
  as CREATE FAILED, the response includes a `failureReason` key, which describes
  why the job failed.
  """
  def create_dataset_export_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateDatasetExportJob", input, options)
  end

  @doc """
  Creates an empty dataset group.

  A dataset group is a container for Amazon Personalize resources. A dataset group
  can contain at most three datasets, one for each type of dataset:

    * Item interactions

    * Items

    * Users

    * Actions

    * Action interactions

  A dataset group can be a Domain dataset group, where you specify a domain and
  use pre-configured resources like recommenders, or a Custom dataset group, where
  you use custom resources, such as a solution with a solution version, that you
  deploy with a campaign. If you start with a Domain dataset group, you can still
  add custom resources such as solutions and solution versions trained with
  recipes for custom use cases and deployed with campaigns.

  A dataset group can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * DELETE PENDING

  To get the status of the dataset group, call
  [DescribeDatasetGroup](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html). If the status shows as CREATE FAILED, the response includes a `failureReason`
  key, which describes why the creation failed.

  You must wait until the `status` of the dataset group is `ACTIVE` before adding
  a dataset to the group.

  You can specify an Key Management Service (KMS) key to encrypt the datasets in
  the group. If you specify a KMS key, you must also include an Identity and
  Access Management (IAM) role that has permission to access the key.

  ## APIs that require a dataset group ARN in the request

    *
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html)

    *
  [CreateEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html)     *
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html)

  ## Related APIs

    *
  [ListDatasetGroups](https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetGroups.html)     *
  [DescribeDatasetGroup](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html)

    *
  [DeleteDatasetGroup](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDatasetGroup.html)
  """
  def create_dataset_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateDatasetGroup", input, options)
  end

  @doc """
  Creates a job that imports training data from your data source (an Amazon S3
  bucket) to an Amazon Personalize dataset.

  To allow Amazon Personalize to import the training data, you must specify an IAM
  service role that has permission to read from the data source, as Amazon
  Personalize makes a copy of your data and processes it internally. For
  information on granting access to your Amazon S3 bucket, see [Giving Amazon Personalize Access to Amazon S3
  Resources](https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html).

  If you already created a recommender or deployed a custom solution version with
  a campaign, how new bulk records influence recommendations depends on the domain
  use case or recipe that you use. For more information, see [How new data influences real-time
  recommendations](https://docs.aws.amazon.com/personalize/latest/dg/how-new-data-influences-recommendations.html).

  By default, a dataset import job replaces any existing data in the dataset that
  you imported in bulk. To add new records without replacing existing data,
  specify INCREMENTAL for the import mode in the CreateDatasetImportJob operation.

  ## Status

  A dataset import job can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

  To get the status of the import job, call
  [DescribeDatasetImportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html), providing the Amazon Resource Name (ARN) of the dataset import job. The dataset
  import is complete when the status shows as ACTIVE. If the status shows as
  CREATE FAILED, the response includes a `failureReason` key, which describes why
  the job failed.

  Importing takes time. You must wait until the status shows as ACTIVE before
  training a model using the dataset.

  ## Related APIs

    *
  [ListDatasetImportJobs](https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetImportJobs.html)

    *
  [DescribeDatasetImportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html)
  """
  def create_dataset_import_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateDatasetImportJob", input, options)
  end

  @doc """
  Creates an event tracker that you use when adding event data to a specified
  dataset group using the
  [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html) API.

  Only one event tracker can be associated with a dataset group. You will get an
  error if you call `CreateEventTracker` using the same dataset group as an
  existing event tracker.

  When you create an event tracker, the response includes a tracking ID, which you
  pass as a parameter when you use the
  [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html)
  operation. Amazon Personalize then appends the event data to the Item
  interactions dataset of the dataset group you specify in your event tracker.

  The event tracker can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * DELETE PENDING > DELETE IN_PROGRESS

  To get the status of the event tracker, call
  [DescribeEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html).  The event tracker must be in the ACTIVE state before using the tracking ID.

  ## Related APIs

    *
  [ListEventTrackers](https://docs.aws.amazon.com/personalize/latest/dg/API_ListEventTrackers.html)

    *
  [DescribeEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html)     *
  [DeleteEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteEventTracker.html)
  """
  def create_event_tracker(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateEventTracker", input, options)
  end

  @doc """
  Creates a recommendation filter.

  For more information, see [Filtering recommendations and user segments](https://docs.aws.amazon.com/personalize/latest/dg/filter.html).
  """
  def create_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateFilter", input, options)
  end

  @doc """
  Creates a metric attribution.

  A metric attribution creates reports on the data that you import into Amazon
  Personalize. Depending on how you imported the data, you can view reports in
  Amazon CloudWatch or Amazon S3. For more information, see [Measuring impact of recommendations](https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html).
  """
  def create_metric_attribution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateMetricAttribution", input, options)
  end

  @doc """
  Creates a recommender with the recipe (a Domain dataset group use case) you
  specify.

  You create recommenders for a Domain dataset group and specify the recommender's
  Amazon Resource Name (ARN) when you make a
  [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) request.

  ## Minimum recommendation requests per second

  A high `minRecommendationRequestsPerSecond` will increase your bill. We
  recommend starting with 1 for `minRecommendationRequestsPerSecond` (the
  default). Track your usage using Amazon CloudWatch metrics, and increase the
  `minRecommendationRequestsPerSecond` as necessary.

  When you create a recommender, you can configure the recommender's minimum
  recommendation requests per second. The minimum recommendation requests per
  second (`minRecommendationRequestsPerSecond`) specifies the baseline
  recommendation request throughput provisioned by Amazon Personalize. The default
  minRecommendationRequestsPerSecond is `1`. A recommendation request is a single
  `GetRecommendations` operation. Request throughput is measured in requests per
  second and Amazon Personalize uses your requests per second to derive your
  requests per hour and the price of your recommender usage.

  If your requests per second increases beyond
  `minRecommendationRequestsPerSecond`, Amazon Personalize auto-scales the
  provisioned capacity up and down, but never below
  `minRecommendationRequestsPerSecond`. There's a short time delay while the
  capacity is increased that might cause loss of requests.

  Your bill is the greater of either the minimum requests per hour (based on
  minRecommendationRequestsPerSecond) or the actual number of requests. The actual
  request throughput used is calculated as the average requests/second within a
  one-hour window. We recommend starting with the default
  `minRecommendationRequestsPerSecond`, track your usage using Amazon CloudWatch
  metrics, and then increase the `minRecommendationRequestsPerSecond` as
  necessary.

  ## Status

  A recommender can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START
  IN_PROGRESS > ACTIVE

    * DELETE PENDING > DELETE IN_PROGRESS

  To get the recommender status, call
  [DescribeRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html).

  Wait until the `status` of the recommender is `ACTIVE` before asking the
  recommender for recommendations.

  ## Related APIs

    *
  [ListRecommenders](https://docs.aws.amazon.com/personalize/latest/dg/API_ListRecommenders.html)     *
  [DescribeRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html)

    *
  [UpdateRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateRecommender.html)     *
  [DeleteRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteRecommender.html)
  """
  def create_recommender(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateRecommender", input, options)
  end

  @doc """
  Creates an Amazon Personalize schema from the specified schema string.

  The schema you create must be in Avro JSON format.

  Amazon Personalize recognizes three schema variants. Each schema is associated
  with a dataset type and has a set of required field and keywords. If you are
  creating a schema for a dataset in a Domain dataset group, you provide the
  domain of the Domain dataset group. You specify a schema when you call
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html).  ## Related APIs

    *
  [ListSchemas](https://docs.aws.amazon.com/personalize/latest/dg/API_ListSchemas.html)

    *
  [DescribeSchema](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSchema.html)     *
  [DeleteSchema](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSchema.html)
  """
  def create_schema(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSchema", input, options)
  end

  @doc """
  Creates the configuration for training a model.

  A trained model is known as a solution version. After the configuration is
  created, you train the model (create a solution version) by calling the
  [CreateSolutionVersion](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html) operation. Every time you call `CreateSolutionVersion`, a new version of the
  solution is created.

  After creating a solution version, you check its accuracy by calling
  [GetSolutionMetrics](https://docs.aws.amazon.com/personalize/latest/dg/API_GetSolutionMetrics.html).
  When you are satisfied with the version, you deploy it using
  [CreateCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html). The campaign provides recommendations to a client through the
  [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  API.

  To train a model, Amazon Personalize requires training data and a recipe. The
  training data comes from the dataset group that you provide in the request. A
  recipe specifies the training algorithm and a feature transformation. You can
  specify one of the predefined recipes provided by Amazon Personalize.

  Amazon Personalize doesn't support configuring the `hpoObjective` for solution
  hyperparameter optimization at this time.

  ## Status

  A solution can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * DELETE PENDING > DELETE IN_PROGRESS

  To get the status of the solution, call
  [DescribeSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html). Wait until the status shows as ACTIVE before calling `CreateSolutionVersion`.

  ## Related APIs

    *
  [ListSolutions](https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html)

    *
  [CreateSolutionVersion](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html)     *
  [DescribeSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html)

    *
  [DeleteSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html) 

    *
  [ListSolutionVersions](https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html)

    *
  [DescribeSolutionVersion](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html)
  """
  def create_solution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSolution", input, options)
  end

  @doc """
  Trains or retrains an active solution in a Custom dataset group.

  A solution is created using the
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html) operation and must be in the ACTIVE state before calling
  `CreateSolutionVersion`. A new version of the solution is created every time you
  call this operation.

  ## Status

  A solution version can be in one of the following states:

    * CREATE PENDING

    * CREATE IN_PROGRESS

    * ACTIVE

    * CREATE FAILED

    * CREATE STOPPING

    * CREATE STOPPED

  To get the status of the version, call
  [DescribeSolutionVersion](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html).
  Wait until the status shows as ACTIVE before calling `CreateCampaign`.

  If the status shows as CREATE FAILED, the response includes a `failureReason`
  key, which describes why the job failed.

  ## Related APIs

    *
  [ListSolutionVersions](https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html)     *
  [DescribeSolutionVersion](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html)

    *
  [ListSolutions](https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html)     *
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html)

    *
  [DescribeSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html)     *
  [DeleteSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html)
  """
  def create_solution_version(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateSolutionVersion", input, options)
  end

  @doc """
  Removes a campaign by deleting the solution deployment.

  The solution that the campaign is based on is not deleted and can be redeployed
  when needed. A deleted campaign can no longer be specified in a
  [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) request. For information on creating campaigns, see
  [CreateCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html).
  """
  def delete_campaign(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteCampaign", input, options)
  end

  @doc """
  Deletes a dataset.

  You can't delete a dataset if an associated `DatasetImportJob` or
  `SolutionVersion` is in the CREATE PENDING or IN PROGRESS state. For more
  information on datasets, see
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html).
  """
  def delete_dataset(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDataset", input, options)
  end

  @doc """
  Deletes a dataset group.

  Before you delete a dataset group, you must delete the following:

    * All associated event trackers.

    * All associated solutions.

    * All datasets in the dataset group.
  """
  def delete_dataset_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteDatasetGroup", input, options)
  end

  @doc """
  Deletes the event tracker.

  Does not delete the dataset from the dataset group. For more information on
  event trackers, see
  [CreateEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html).
  """
  def delete_event_tracker(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteEventTracker", input, options)
  end

  @doc """
  Deletes a filter.
  """
  def delete_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteFilter", input, options)
  end

  @doc """
  Deletes a metric attribution.
  """
  def delete_metric_attribution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteMetricAttribution", input, options)
  end

  @doc """
  Deactivates and removes a recommender.

  A deleted recommender can no longer be specified in a
  [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  request.
  """
  def delete_recommender(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteRecommender", input, options)
  end

  @doc """
  Deletes a schema.

  Before deleting a schema, you must delete all datasets referencing the schema.
  For more information on schemas, see
  [CreateSchema](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html).
  """
  def delete_schema(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSchema", input, options)
  end

  @doc """
  Deletes all versions of a solution and the `Solution` object itself.

  Before deleting a solution, you must delete all campaigns based on the solution.
  To determine what campaigns are using the solution, call
  [ListCampaigns](https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html) and supply the Amazon Resource Name (ARN) of the solution. You can't delete a
  solution if an associated `SolutionVersion` is in the CREATE PENDING or IN
  PROGRESS state. For more information on solutions, see
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html).
  """
  def delete_solution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteSolution", input, options)
  end

  @doc """
  Describes the given algorithm.
  """
  def describe_algorithm(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAlgorithm", input, options)
  end

  @doc """
  Gets the properties of a batch inference job including name, Amazon Resource
  Name (ARN), status, input and output configurations, and the ARN of the solution
  version used to generate the recommendations.
  """
  def describe_batch_inference_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeBatchInferenceJob", input, options)
  end

  @doc """
  Gets the properties of a batch segment job including name, Amazon Resource Name
  (ARN), status, input and output configurations, and the ARN of the solution
  version used to generate segments.
  """
  def describe_batch_segment_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeBatchSegmentJob", input, options)
  end

  @doc """
  Describes the given campaign, including its status.

  A campaign can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * DELETE PENDING > DELETE IN_PROGRESS

  When the `status` is `CREATE FAILED`, the response includes the `failureReason`
  key, which describes why.

  For more information on campaigns, see
  [CreateCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html).
  """
  def describe_campaign(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCampaign", input, options)
  end

  @doc """
  Describes the given dataset.

  For more information on datasets, see
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html).
  """
  def describe_dataset(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDataset", input, options)
  end

  @doc """
  Describes the dataset export job created by
  [CreateDatasetExportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html),
  including the export job status.
  """
  def describe_dataset_export_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDatasetExportJob", input, options)
  end

  @doc """
  Describes the given dataset group.

  For more information on dataset groups, see
  [CreateDatasetGroup](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html).
  """
  def describe_dataset_group(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDatasetGroup", input, options)
  end

  @doc """
  Describes the dataset import job created by
  [CreateDatasetImportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html),
  including the import job status.
  """
  def describe_dataset_import_job(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeDatasetImportJob", input, options)
  end

  @doc """
  Describes an event tracker.

  The response includes the `trackingId` and `status` of the event tracker. For
  more information on event trackers, see
  [CreateEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html).
  """
  def describe_event_tracker(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeEventTracker", input, options)
  end

  @doc """
  Describes the given feature transformation.
  """
  def describe_feature_transformation(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeFeatureTransformation", input, options)
  end

  @doc """
  Describes a filter's properties.
  """
  def describe_filter(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeFilter", input, options)
  end

  @doc """
  Describes a metric attribution.
  """
  def describe_metric_attribution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeMetricAttribution", input, options)
  end

  @doc """
  Describes a recipe.

  A recipe contains three items:

    * An algorithm that trains a model.

    * Hyperparameters that govern the training.

    * Feature transformation information for modifying the input data
  before training.

  Amazon Personalize provides a set of predefined recipes. You specify a recipe
  when you create a solution with the
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html) API. `CreateSolution` trains a model by using the algorithm in the specified
  recipe and a training dataset. The solution, when deployed as a campaign, can
  provide recommendations using the
  [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  API.
  """
  def describe_recipe(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeRecipe", input, options)
  end

  @doc """
  Describes the given recommender, including its status.

  A recommender can be in one of the following states:

    * CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED

    * STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START
  IN_PROGRESS > ACTIVE

    * DELETE PENDING > DELETE IN_PROGRESS

  When the `status` is `CREATE FAILED`, the response includes the `failureReason`
  key, which describes why.

  The `modelMetrics` key is null when the recommender is being created or deleted.

  For more information on recommenders, see
  [CreateRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html).
  """
  def describe_recommender(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeRecommender", input, options)
  end

  @doc """
  Describes a schema.

  For more information on schemas, see
  [CreateSchema](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html).
  """
  def describe_schema(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSchema", input, options)
  end

  @doc """
  Describes a solution.

  For more information on solutions, see
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html).
  """
  def describe_solution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSolution", input, options)
  end

  @doc """
  Describes a specific version of a solution.

  For more information on solutions, see
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html)
  """
  def describe_solution_version(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeSolutionVersion", input, options)
  end

  @doc """
  Gets the metrics for the specified solution version.
  """
  def get_solution_metrics(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "GetSolutionMetrics", input, options)
  end

  @doc """
  Gets a list of the batch inference jobs that have been performed off of a
  solution version.
  """
  def list_batch_inference_jobs(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListBatchInferenceJobs", input, options)
  end

  @doc """
  Gets a list of the batch segment jobs that have been performed off of a solution
  version that you specify.
  """
  def list_batch_segment_jobs(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListBatchSegmentJobs", input, options)
  end

  @doc """
  Returns a list of campaigns that use the given solution.

  When a solution is not specified, all the campaigns associated with the account
  are listed. The response provides the properties for each campaign, including
  the Amazon Resource Name (ARN). For more information on campaigns, see
  [CreateCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html).
  """
  def list_campaigns(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListCampaigns", input, options)
  end

  @doc """
  Returns a list of dataset export jobs that use the given dataset.

  When a dataset is not specified, all the dataset export jobs associated with the
  account are listed. The response provides the properties for each dataset export
  job, including the Amazon Resource Name (ARN). For more information on dataset
  export jobs, see
  [CreateDatasetExportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html). For more information on datasets, see
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html).
  """
  def list_dataset_export_jobs(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDatasetExportJobs", input, options)
  end

  @doc """
  Returns a list of dataset groups.

  The response provides the properties for each dataset group, including the
  Amazon Resource Name (ARN). For more information on dataset groups, see
  [CreateDatasetGroup](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html).
  """
  def list_dataset_groups(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDatasetGroups", input, options)
  end

  @doc """
  Returns a list of dataset import jobs that use the given dataset.

  When a dataset is not specified, all the dataset import jobs associated with the
  account are listed. The response provides the properties for each dataset import
  job, including the Amazon Resource Name (ARN). For more information on dataset
  import jobs, see
  [CreateDatasetImportJob](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html). For more information on datasets, see
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html).
  """
  def list_dataset_import_jobs(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDatasetImportJobs", input, options)
  end

  @doc """
  Returns the list of datasets contained in the given dataset group.

  The response provides the properties for each dataset, including the Amazon
  Resource Name (ARN). For more information on datasets, see
  [CreateDataset](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html).
  """
  def list_datasets(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDatasets", input, options)
  end

  @doc """
  Returns the list of event trackers associated with the account.

  The response provides the properties for each event tracker, including the
  Amazon Resource Name (ARN) and tracking ID. For more information on event
  trackers, see
  [CreateEventTracker](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html).
  """
  def list_event_trackers(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListEventTrackers", input, options)
  end

  @doc """
  Lists all filters that belong to a given dataset group.
  """
  def list_filters(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListFilters", input, options)
  end

  @doc """
  Lists the metrics for the metric attribution.
  """
  def list_metric_attribution_metrics(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListMetricAttributionMetrics", input, options)
  end

  @doc """
  Lists metric attributions.
  """
  def list_metric_attributions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListMetricAttributions", input, options)
  end

  @doc """
  Returns a list of available recipes.

  The response provides the properties for each recipe, including the recipe's
  Amazon Resource Name (ARN).
  """
  def list_recipes(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListRecipes", input, options)
  end

  @doc """
  Returns a list of recommenders in a given Domain dataset group.

  When a Domain dataset group is not specified, all the recommenders associated
  with the account are listed. The response provides the properties for each
  recommender, including the Amazon Resource Name (ARN). For more information on
  recommenders, see
  [CreateRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html).
  """
  def list_recommenders(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListRecommenders", input, options)
  end

  @doc """
  Returns the list of schemas associated with the account.

  The response provides the properties for each schema, including the Amazon
  Resource Name (ARN). For more information on schemas, see
  [CreateSchema](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html).
  """
  def list_schemas(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListSchemas", input, options)
  end

  @doc """
  Returns a list of solution versions for the given solution.

  When a solution is not specified, all the solution versions associated with the
  account are listed. The response provides the properties for each solution
  version, including the Amazon Resource Name (ARN).
  """
  def list_solution_versions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListSolutionVersions", input, options)
  end

  @doc """
  Returns a list of solutions that use the given dataset group.

  When a dataset group is not specified, all the solutions associated with the
  account are listed. The response provides the properties for each solution,
  including the Amazon Resource Name (ARN). For more information on solutions, see
  [CreateSolution](https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html).
  """
  def list_solutions(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListSolutions", input, options)
  end

  @doc """
  Get a list of
  [tags](https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html)
  attached to a resource.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  Starts a recommender that is INACTIVE.

  Starting a recommender does not create any new models, but resumes billing and
  automatic retraining for the recommender.
  """
  def start_recommender(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StartRecommender", input, options)
  end

  @doc """
  Stops a recommender that is ACTIVE.

  Stopping a recommender halts billing and automatic retraining for the
  recommender.
  """
  def stop_recommender(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StopRecommender", input, options)
  end

  @doc """
  Stops creating a solution version that is in a state of CREATE_PENDING or CREATE
  IN_PROGRESS.

  Depending on the current state of the solution version, the solution version
  state changes as follows:

    * CREATE_PENDING > CREATE_STOPPED

  or

    * CREATE_IN_PROGRESS > CREATE_STOPPING > CREATE_STOPPED

  You are billed for all of the training completed up until you stop the solution
  version creation. You cannot resume creating a solution version once it has been
  stopped.
  """
  def stop_solution_version_creation(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "StopSolutionVersionCreation", input, options)
  end

  @doc """
  Add a list of tags to a resource.
  """
  def tag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagResource", input, options)
  end

  @doc """
  Remove
  [tags](https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html)
  that are attached to a resource.
  """
  def untag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagResource", input, options)
  end

  @doc """
  Updates a campaign to deploy a retrained solution version with an existing
  campaign, change your campaign's `minProvisionedTPS`, or modify your campaign's
  configuration, such as the exploration configuration.

  To update a campaign, the campaign status must be ACTIVE or CREATE FAILED. Check
  the campaign status using the
  [DescribeCampaign](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html) operation.

  You can still get recommendations from a campaign while an update is in
  progress. The campaign will use the previous solution version and campaign
  configuration to generate recommendations until the latest campaign update
  status is `Active`.

  For more information about updating a campaign, including code samples, see
  [Updating a
  campaign](https://docs.aws.amazon.com/personalize/latest/dg/update-campaigns.html).
  For more information about campaigns, see [Creating a campaign](https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html).
  """
  def update_campaign(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateCampaign", input, options)
  end

  @doc """
  Update a dataset to replace its schema with a new or existing one.

  For more information, see [Replacing a dataset's schema](https://docs.aws.amazon.com/personalize/latest/dg/updating-dataset-schema.html).
  """
  def update_dataset(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateDataset", input, options)
  end

  @doc """
  Updates a metric attribution.
  """
  def update_metric_attribution(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateMetricAttribution", input, options)
  end

  @doc """
  Updates the recommender to modify the recommender configuration.

  If you update the recommender to modify the columns used in training, Amazon
  Personalize automatically starts a full retraining of the models backing your
  recommender. While the update completes, you can still get recommendations from
  the recommender. The recommender uses the previous configuration until the
  update completes. To track the status of this update, use the
  `latestRecommenderUpdate` returned in the
  [DescribeRecommender](https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html)
  operation.
  """
  def update_recommender(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateRecommender", input, options)
  end
end
