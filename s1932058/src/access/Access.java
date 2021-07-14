package access;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


public class Access {

	public JsonNode getResult(String... params) {
		String apiUrl = "https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404"
				+ "?format=json"
				+ "&applicationId=1062302241302135134"
				+ "&formatVersion=2"
				+ "&booksGenreId=000"
				+ "&hits=30";
		for(String param :params) {
			apiUrl += "&" + param;
		}
		HttpURLConnection conn = null;
		String result = "";
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonResult = null; // 初期化
		try {
			URL url = new URL(apiUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.connect();
			//			パラメータを送る
			//			PrintWriter out = new PrintWriter(conn.getOutputStream());
			//			out.write();
			//			out.flush();
			//			out.close();
			final int status = conn.getResponseCode();
			if (status == HttpURLConnection.HTTP_OK) {
				final InputStream in = conn.getInputStream();
				String encoding = conn.getContentEncoding();
				if (null == encoding) {
					encoding = "UTF-8";
				}
				final InputStreamReader inReader = new InputStreamReader(in, encoding);
				final BufferedReader bufReader = new BufferedReader(inReader);
				String line = null;
				// 1行ずつテキストを読み込む
				while ((line = bufReader.readLine()) != null) {
					result += line;
				}

				bufReader.close();
				inReader.close();
				jsonResult = mapper.readTree(result);
				in.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				// コネクションを切断
				conn.disconnect();
			}
		}
		return jsonResult;
	}
}
