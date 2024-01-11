# ImageAnalysisController
This controller is used for object detection on an image uploaded to OCI Object Storage. 

Input data should consist of the following JSON fields:
- "COMPARMENT_OCID" (String)
- "namespace_name" (String)
- "bucket_name" (String)
- "object_name" (String)


The application only supports POST requests. 

## Pre-requisite
    - must have a ~/.oci/config file on your local machine
        - see https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm for details
    - within the ~/.oci/config file, the path to your key_file should begin with ~/.oci/

## Build and Run Container 
1. `docker build -t controllerimage .`

2. `docker run --name imageanalysiscontroller -v ~/.oci:/root/.oci -p 5000:5000 controllerimage`

3. In a separate terminal, run the command below to test the API


## Test API
- POST
    - The following command runs the default OCI AI Vision Object Detection Model on an image in your OCI Object Storage via POST request:
        - `docker exec -it imageanalysiscontroller curl -X POST http://localhost:5000/imageanalysis/analyzeimage -H "Content-Type: application/json" -d '{"COMPARMENT_OCID": {your compartment OCID}, "namespace_name": {your namespace name}, "bucket_name": {your bucket name}, "object_name": {your (image) object name}}'`
    - Returns a json. 
        - Example result:
            [
                {
                    "confidence": 0.9833403,
                    "name": "Football"
                }
            ]

## TO DO
- Add functionality to allow custom object detection models to be used with this application.