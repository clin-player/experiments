import 'dart:io';
import 'package:http/http.dart' as http;

void loadDataWithHelper(String url) {
	http.get(url).then(onLoadWithHelper);
}

void onLoadWithHelper(http.Response response) {
	print(response.body);
}

void loadData(String url) {
	// TODO connection not closing
	HttpClient client = new HttpClient();

	client
		.getUrl(Uri.parse(url))
		.then((HttpClientRequest request) {
			return request.close();
		})
		.then(onLoad);
}

void onLoad(HttpClientResponse response) {
	print(response);
}

void main() {
	String url = 'https://jsonplaceholder.typicode.com/posts/1';
	loadDataWithHelper(url);
	loadData(url);
}
