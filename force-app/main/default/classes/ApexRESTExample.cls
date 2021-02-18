@RestResource(urlMapping = '/Example/*')
global with sharing class ApexRESTExample {
    
    @HttpGet
    global static String getExampleResponse() {
        return 'Example';
    }

    @HttpPost
    global static String postExampleResponse(String inputData) {
        return 'You posted ' + inputData;
    }

    @HttpPut
    global static String putExampleResponse(String inputData) {
        return 'You put ' + inputData;
    }

    @HttpPatch
    global static String patchExampleResponse(String inputData) {
        return 'You patched ' + inputData;
    }

    @HttpDelete
    global static String deleteExampleResponse() {
        return 'Example delete';
    }
}
