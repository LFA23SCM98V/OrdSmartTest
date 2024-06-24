This Task involves 4 phases

**Phase 1: Application Setup**
In this phase, the candidate will scaffold the Kotlin application such that it is successfully able to run locally.
**Objectives**
The candidate is able to set up the Kotlin application for the project with skeleton code, including any dependencies needed in order to get the application running locally.

**Phase 2: Database Setup**
In this phase, the candidate will use the scaffolded Kotlin application from Phase 1 to add a database layer to it.
The database will define the business models for sample requests, which will be created and retrieved using the APIs in the next phase. Here is a pseudocode example of the structure of the data for a single sample request (note that the actual structure of data used by the candidate may end up being different):
Address {
  line_1 string
  line_2 string
  city string
  state string
  zip_code string
}

Product {
  // identifier for the product
  id int
  // name of the product
  name string
}

ProductVariant {
  // identifier for the product variant
  id int
  // the different attributes that describe the product variant
  attributes <string, string>
}

SampleRequest {
  // identifier for the sample request
  id int
  // the product for which the sample is requested
  product Product
  // the variant of the product for which the sample
  // is requested
  variant ProductVariant
  // the amount of product requested for the sample
  sample_quantity string
  // description of how the sample will be used by the customer
  sample_application string
  // address where the sample needs to be delivered
  shipping_address Address
  // any additional information provided by the customer
  additional_information string
  // time at which the request is made by the customer
  created_at time
  // name of the person who requests the sample
  created_by string
}
**Based on the example data structure, here is a populated request as an example:**
{
  id: 1,
  product: {
    id: 2,
    name: “Milk Concentrate Protein”,
  },
  variant: {
    id: 3,
    values: {
      “% concentration”: “50%”,
      “flavor”: “Vanilla”,
      “weight”: “250g”,
    },
  },
  sample_quantity: “3 bags”,
  sample_application: “dummy data for assessment”,
  shipping_address: {
    line_1: “2103 N Campbell Ave”,
    line_2: “”,
    city: “Chicago”,
    state: “IL”,
    zip_code: “60647”,
  },
  additional_information: “test”,
  created_at: Time{12:00 PM Monday, April 29, 2024},
  created_by: “Alison Burgers”,
}

**Objectives**
○	The candidate is able to use the provided data structure as a guide to set up the database tables and columns as needed
○	The candidate is free to use any database system (relational/non-relational, SQL/NoSQL, etc.) that can be integrated with their Kotlin application as they see fit.

**Phase 3: API**
●	In this phase, the candidate will use their application and database setup from Phases 1 and 2 to write 2 API endpoints that can be called locally when their application is running:
1.	CreateSampleRequest
●	CreateSampleRequest is an endpoint that takes in the metadata for a sample request and adds an entry to the database with the relevant fields populated
●	Example for the endpoint request:
{
  product_id: 2,
  variant_id: 3,
  sample_quantity: “3 bags”,
  sample_application: “dummy data for assessment”,
  shipping_address: {
    line_1: “2103 N Campbell Ave”,
    line_2: “”,
    city: “Chicago”,
    state: “IL”,
    zip_code: “60647”,
  },
  additional_information: “test”,
  requestor: “Alison Burgers”,
}

●	Example response:
success: true,
message: “successfully created sample request”,
sampleRequest: {
  id: 1,
  product: {
    id: 2,
    name: “Milk Concentrate Protein”,
  },
  variant: {
    id: 3,
    values: {
      “% concentration”: “50%”,
      “flavor”: “Vanilla”,
      “weight”: “250g”,
    },
  },
  sample_quantity: “3 bags”,
  sample_application: “dummy data for assessment”,
  shipping_address: {
    line_1: “2103 N Campbell Ave”,
    line_2: “”,
    city: “Chicago”,
    state: “IL”,
    zip_code: “60647”,
  },
  additional_information: “test”,
  created_at: Time{12:00 PM Monday, April 29, 2024},
  created_by: “Alison Burgers”,
}

2.	GetSampleRequestByID
●	GetSampleRequestByID is an endpoint that takes in the ID of an existing sample request and returns all the data for that request contained within the application database
●	Example for the endpoint request:
{
  sample_request_id: 1,
}

●	Example response:
success: true,
message: “successfully got sample request”,
sampleRequest: {
  id: 1,
  product: {
    id: 2,
    name: “Milk Concentrate Protein”,
  },
  variant: {
    id: 3,
    values: {
      “% concentration”: “50%”,
      “flavor”: “Vanilla”,
      “weight”: “250g”,
    },
  },
  sample_quantity: “3 bags”,
  sample_application: “dummy data for assessment”,
  shipping_address: {
    line_1: “2103 N Campbell Ave”,
    line_2: “”,
    city: “Chicago”,
    state: “IL”,
    zip_code: “60647”,
  },
  additional_information: “test”,
  created_at: Time{12:00 PM Monday, April 29, 2024},
  created_by: “Alison Burgers”,
}
**Objectives**
○	Endpoints are implemented in the application using a clear MVC architecture pattern
○	Both endpoints can be called locally using cURL
○	The Create endpoint saves the details of the request to the application database locally
■	Throws an error if the provided product ID or product variant ID in the request do not correspond to valid entries in each of their tables in the database.
●	Note that you may have to manually add some fake data for products and variants into the database so that you can successfully create sample requests
○	The Get endpoint fetches an existing sample request from the application database and returns it to the caller based on the given ID
■	Throws an error or returns nothing if the given ID does not exist in the database.

**[Optional] Phase 4: Bells & Whistles**

●	In this phase, the candidate will have an opportunity to be creative with the functionality of their application. You have the liberty to go above and beyond the scope of the assessment here, so have fun with it and use it as an opportunity to show us where you really shine!
●	Since this is an open-ended phase, there are no defined outcomes. Here are a few ideas for the candidate to consider:
○	Unit & Integration Testing
○	Containerization/Hosting
■	Can you dockerize the application and host it on a cloud platform (AWS/GCP/Azure/etc.) such that the APIs can be called via any public subnet rather than needing the application to be downloaded and run locally?
○	Additional API Interactions
■	Can you add an endpoint to edit an existing sample request?
■	Can you add an endpoint to delete/archive a sample request such that it can’t be retrieved anymore?
○	Data Enrichment
■	Can you think of adding more fields that would be important to track for each sample request?
■	Experiment with the types of data (dates, nested lists, long paragraphs, etc.)






