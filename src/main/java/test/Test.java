package test;

import java.io.IOException;

import org.apache.avro.Schema;
import org.apache.avro.Schema.Field;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;

public class Test {

	static String t = "";

	static void parse(Field field) {
		t = t + "\t";
		Schema schema = field.schema();
		for (Field field1 : schema.getFields()) {
			System.out.println(t + field1.schema().getName() + " : " + field1.name() + " : " + field1.schema());
			if (field1.schema().getType().getName().equals(Schema.Type.RECORD.toString().toLowerCase())) {
				parse(field1);
			}
		}
	}
	


	   
	   public static void main(String args[]) throws Exception{
	      
	      //Create an object of credentialsProvider
	      CredentialsProvider credentialsPovider = new BasicCredentialsProvider();

	      //Set the credentials
	      AuthScope scope = new AuthScope("https://rcgmail.sharepoint.com", 80);
	      
	      Credentials credentials = new UsernamePasswordCredentials("eric.perler@rcggs.com", "Cdi6954c");
	      credentialsPovider.setCredentials(scope,credentials);

	      //Creating the HttpClientBuilder
	      HttpClientBuilder clientbuilder = HttpClients.custom();

	      //Setting the credentials
	      clientbuilder = clientbuilder.setDefaultCredentialsProvider(credentialsPovider);

	      //Building the CloseableHttpClient object
	      CloseableHttpClient httpclient = clientbuilder.build();

	      //Creating a HttpGet object
	      HttpGet httpget = new HttpGet("https://rcgmail.sharepoint.com/_api/search/query?querytext=%27Testing%27&format=json");

	      //Printing the method used
	      System.out.println(httpget.getMethod()); 

	      //Executing the Get request
	      HttpResponse httpresponse = httpclient.execute(httpget);

	      //Printing the status line
	      System.out.println(httpresponse.getStatusLine());
	      int statusCode = httpresponse.getStatusLine().getStatusCode();
	      System.out.println(statusCode);

	      Header[] headers= httpresponse.getAllHeaders();
	      for (int i = 0; i<headers.length;i++) {
	         System.out.println(headers[i].getName());
	      }
	   }
	}

// public static void main(String args[]) throws Exception {
//
//
//
//
//
// String s =
// HttpUtil.get("https://rcgmail.sharepoint.com/_api/search/query?querytext=%27Testing%27&format=json");
// System.out.println(s);
//
//
// System.exit(0);
//
// Schema schema = new
// Schema.Parser().parse(Test.class.getClassLoader().getResourceAsStream("user2.avsc"));
// for (Field field : schema.getFields()) {
//
// if
// (field.schema().getType().getName().equals(Schema.Type.RECORD.toString().toLowerCase()))
// {
// System.out.println(t + field.schema().getName() + " : " + field.name() + " :
// " + field.schema());
// parse(field);
// } else if
// (field.schema().getType().getName().equals(Schema.Type.ARRAY.toString().toLowerCase()))
// {
//
//
//
//
// ObjectMapper m = new ObjectMapper();
// JsonNode n = m.readTree(field.schema().toString());
//
// System.err.println("==> " + n);
//
//
//
//
//
// } else if (field.schema().getType().getName().equals("union")) {
// System.err.println("UNION");
//
// } else {
// System.out.println(field.name());
// }
// }
//
// // ObjectMapper m = new ObjectMapper();
// // JsonNode n =
// // m.readTree(Test.class.getResourceAsStream("/user.avsc"));
// //
// // Iterator<Entry<String, JsonNode>> it = n.fields();
// // while (it.hasNext()) {
// // Entry<String, JsonNode> n1 = it.next();
// // if (n1.getKey().equals("fields")) {
// // getChildren(n1);
// // }
// // }
//
// System.exit(0);
// Class.forName("com.mysql.jdbc.Driver").newInstance();
// Connection conn =
// DriverManager.getConnection("jdbc:mysql://54.210.131.59/mysql", "root", "");
// Statement st = conn.createStatement();
// ResultSet rs = st.executeQuery("select * from " + "help_category");
// System.out.println("select * from " + "help_category");
//
// ResultSetMetaData rsMetaData = rs.getMetaData();
//
// List<String> rows = new LinkedList<>();
// while (rs.next()) {
// String row = "";
// for (int i = 1; i < rsMetaData.getColumnCount() + 1; i++) {
// row = row + rs.getString(i) + ",";
// }
// rows.add(row.substring(0, row.length() - 1));
//
// }
// System.err.println("****************** " + StringUtils.join(rows, "\n"));
//
// System.exit(0);
// System.err.println("STARTING ");
//
// final Admin admin = MapRDB.newAdmin();
// List<Path> tables = admin.listTables(new Path("/tmp"));
// System.err.println(String.format("found %s tables in path %s", tables.size(),
// "/tmp"));
//
// if (!admin.tableExists("/tmp/mytable"))
// admin.createTable("/tmp/mytable");
//
// for (final Path tablePath : admin.listTables(new Path("/tmp"))) {
// System.err.println(tablePath.getName());
// }
//
// byte buf[] = new byte[65 * 1024];
// int ac = 0;
// if (args.length != 1) {
// System.out.println("usage: MapRTest pathname");
// return;
// }
//
// System.setProperty("java.library.path", "/tmp/mapr/lib");
//
// // maprfs:/// -> uses the first entry in
// // /opt/mapr/conf/mapr-clusters.conf
// // maprfs:///mapr/my.cluster.com/
// // /mapr/my.cluster.com/
//
// // String uri = "maprfs:///";
// String dirname = args[ac++];
//
// Configuration conf = new Configuration();
// // conf.set("fs.default.name", "maprfs://54.84.48.198:7222");
//
// // FileSystem fs = FileSystem.get(URI.create(uri), conf); // if wanting
// // to use a different cluster
// FileSystem fs = FileSystem.get(conf);
//
// Path dirpath = new Path(dirname + "/dir");
// Path wfilepath = new Path(dirname + "/file.w");
// // Path rfilepath = new Path( dirname + "/file.r");
//
// FileStatus[] status = fs.listStatus(new Path("/tmp"));
//
// for (int i = 0; i < status.length; i++) {
// FileStatus fileStatus = status[i];
// String path = fileStatus.getPath().toString();
// System.out.println("XXXXXXXXXXXXXX " + path);
// }
//
// // Path rfilepath = wfilepath;
// //
// // // try mkdir
// // boolean res = fs.mkdirs(dirpath);
// // if (!res) {
// // System.out.println("mkdir failed, path: " + dirpath);
// // return;
// // }
// //
// // System.out.println("mkdir( " + dirpath + ") went ok, now writing
// // file");
// //
// // // create wfile
// // FSDataOutputStream ostr = fs.create(wfilepath, true, // overwrite
// // 512, // buffersize
// // (short) 1, // replication
// // (long) (64 * 1024 * 1024) // chunksize
// // );
// // ostr.write(buf);
// // ostr.close();
// //
// // System.out.println("write( " + wfilepath + ") went ok");
// //
// // // read rfile
// // System.out.println("reading file: " + rfilepath);
// // FSDataInputStream istr = fs.open(rfilepath);
// // int bb = istr.readInt();
// // istr.close();
// // System.out.println("Read ok");
// }
