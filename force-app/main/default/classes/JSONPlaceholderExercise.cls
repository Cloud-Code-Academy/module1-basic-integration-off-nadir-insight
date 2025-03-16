public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);

        return response.getBody();
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + 'posts');
        request.setMethod('POST');
        Map<String, String> dataMap = new Map<String, String>{
            'favorite language' => 'apex'
        };
        String jsonString = JSON.serialize(dataMap);
        request.setBody(jsonString);
        
        Http http = new Http();
        HttpResponse response = http.send(request);

        return response.getBody();
    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('PUT');
        String httpBody = 'title: ' + title + '\r body: ' + body;
        request.setBody(JSON.serialize(httpBody));
        
        Http http = new Http();
        HttpResponse response = http.send(request);

        return response.getBody();
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('PATCH');

        Map<String, String> titles = new Map<String, String>{
            'title' => title
        };

        request.setBody(JSON.serialize(titles));
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        return response.getBody();
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setMethod('DELETE');

        Http http = new Http();
        HttpResponse response = http.send(request);

        return response.getStatusCode();
    }
} 