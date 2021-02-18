global class HospitalAPIRewriter implements Site.UrlRewriter {
    global PageReference mapRequestUrl(PageReference friendlyUrl) {
        String url = friendlyUrl.getUrl();
        String matchPattern = '/v1/hospital/';
        if(url.startsWith(matchPattern)) {
            String refCode = url.substring(matchPattern.length(), url.length());
            return new Pagereference('/HospitalJSON?refCode=' + refCode);
        }
        return null;
    }

    global PageReference[] generateUrlFor(PageReference[] yourSalesforceUrls) {
        return null;
    }
}
