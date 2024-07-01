package com.rcggs.enable.data.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.lang.Thread.UncaughtExceptionHandler;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ThreadFactory;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.common.base.Throwables;
import com.google.common.util.concurrent.ThreadFactoryBuilder;
import com.rcggs.datalake.configuration.DatalakeContext;
import com.rcggs.datalake.connect.DatalakeConnectionFactory;
import com.rcggs.datalake.core.model.ConnectionConfig;
import com.rcggs.datalake.core.model.Level;
import com.rcggs.datalake.core.model.SchemaDef;
import com.rcggs.datalake.core.model.SchemaReader;
import com.rcggs.enable.data.resource.ResourceReader;
import com.rcggs.enable.data.service.HttpUtil;

@RestController
public class MetadataController extends AbstractController {

	final Logger logger = Logger.getLogger(getClass());
	ObjectMapper mapper = new ObjectMapper();

	// @Resource
	DatalakeConnectionFactory datalakeConnectionFactory = new DatalakeConnectionFactory();

	@RequestMapping(value = "/getOptions/{name}", method = RequestMethod.GET, produces = "application/json")
	public String getOptions(final @PathVariable String name) {
		List<Map<String, String>> data = DatalakeContext.getMetadataDao().getOptions(name);
		try {
			return ow.writeValueAsString(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getConnectionsResponse", method = RequestMethod.GET, produces = "application/json")
	public String getConnectionsResponse(@RequestBody String data) {
		return getConnections("");
	}

	@RequestMapping(value = "/getServices", method = RequestMethod.GET, produces = "application/json")
	public String getServices(@RequestBody String data) {
		List<Map<String, String>> response = new LinkedList<Map<String, String>>();
		List<Map<String, String>> services = DatalakeContext.getMetadataDao().getServices("");
		try {
			for (Map<String, String> service : services) {
				Map<String, String> map = new LinkedHashMap<String, String>();
				map.put("id", service.get("id"));
				map.put("name", service.get("name"));
				map.put("description", service.get("description"));
				map.put("tags", service.get("tags"));
				String route = service.get("route");
				org.codehaus.jackson.JsonNode _route_ = mapper.readTree(route);
				System.err.println(_route_.get("target").get("config").toString());
				map.put("location",
						_route_.get("target").get("config").get("type").getTextValue() + "://"
								+ _route_.get("target").get("config").get("host").getTextValue() + ":"
								+ _route_.get("target").get("config").get("port").getTextValue()
								+ _route_.get("target").get("config").get("path").getTextValue());
				map.put("owner", "admin@rcggs.com");
				response.add(map);
			}
			return ow.writeValueAsString(response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/updateSchema/{op}/{name}", method = RequestMethod.GET)
	public String updateSchema(final @PathVariable String op, final @PathVariable String name) {
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			Connection con = DriverManager.getConnection("jdbc:hive2://192.168.56.101:10000/default", "hive", "hive");
			Statement stmt = con.createStatement();
			if (op.equals("add")) {
				stmt.execute("ALTER TABLE edi.mckdelimdata_810_stage ADD COLUMNS (" + name + " BIGINT)");
				stmt.execute("ALTER TABLE edi.mckdelimdata_810_stage CHANGE COLUMN " + name + " " + name
						+ " string  AFTER customer_account_id__bill_to_");
			} else if (op.equals("remove")) {

			} else if (op.equals("createnew")) {

			} else {

			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.format("{name:%s,value:%s}", op, name);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getSchema/{id}", method = RequestMethod.POST)
	public String getSchema(@RequestBody Object obj) {
		try {
			String type = null;
			String path = null;
			String values = obj.toString().substring(1, obj.toString().length() - 1);
			String[] data = values.split(",");
			String clazz = data[0].split("=")[1];
			if (data.length > 1) {
				type = data[1];
				path = data[2];
			}
			SchemaReader reader = DatalakeContext.getSchemaReaders().get(clazz);
			Map<String, String> pathMap = reader.getPathMap();

			Class<ResourceReader<SchemaDef>> instance = (Class<ResourceReader<SchemaDef>>) Class
					.forName(reader.getValue());

			ResourceReader<SchemaDef> schemaReader = instance.newInstance();

			List<SchemaDef> schema = schemaReader.read(path, type, pathMap);
			return ow.writeValueAsString(schema);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getSchemaReaders/{name}", method = RequestMethod.GET)
	public String getSchemaReaders(@PathVariable String name) {
		try {
			return ow.writeValueAsString(DatalakeContext.getSchemaReaders());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@RequestMapping(value = "/watch/{name}", method = RequestMethod.POST)
	public String watch(@RequestBody Map<String, String> map) {
		try {
			System.err.println("http://127.0.0.1:5000/openfile/1/?id="
					+ URLEncoder.encode(map.get("uri"), StandardCharsets.UTF_8.toString()));
			String response = HttpUtil.get("http://127.0.0.1:5000/openfile/1?id="
					+ URLEncoder.encode(map.get("uri"), StandardCharsets.UTF_8.toString()));
			return ow.writeValueAsString(DatalakeContext.getSchemaReaders());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{}";
	}

	@RequestMapping(value = "/update_canvas/{name}", method = RequestMethod.GET)
	public String updateCanvas(@PathVariable String name) {
		try {
			BufferedReader reader;
			try {
				reader = new BufferedReader(new FileReader("/tmp/upadte_canvas"));
				String line = reader.readLine();
				while (line != null) {
//					System.out.println(line);
					line = reader.readLine();
				}

				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@RequestMapping(value = "/progress", method = RequestMethod.GET)
	public String progress() {
		System.err.println("progress...");
		HttpUtil.get("http://127.0.0.1:5000/progress");
		return "{}";
	}

	static List<String> processed = new ArrayList<>();

	@RequestMapping(value = "/deploy/{name}", method = RequestMethod.GET)
	public String deploy(@PathVariable String name) {
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				HttpUtil.get("http://127.0.0.1:5000/");
//			}}).start();
		System.err.println("initializing...");
		String response = HttpUtil.get("http://127.0.0.1:5000/deploy/1");
		return response;
	}

	@RequestMapping(value = "/translate/{name}", method = RequestMethod.POST)
	public String translate(@RequestBody Map<String, String> map) {
		try {

			System.err.println("----------------------------");
			System.err.println(map.get("uri"));
			System.err.println("----------------------------");

			org.codehaus.jackson.JsonNode node = mapper.readTree(map.get("uri"));
			Iterator<org.codehaus.jackson.JsonNode> iter = node.getElements();

			String response = "";

			while (iter.hasNext()) {

				org.codehaus.jackson.JsonNode entry = iter.next();

				System.err.println(entry);

				if (entry.get("parent") != null && !processed.contains(entry.get("id").getTextValue())) {

					System.err.println("###### " + entry.get("text").getTextValue());

					/// Users/ericperler/work/src/python/azure/accelerate-ai-v2/backend/indexer/faiss_index

					if (entry.get("text").getTextValue().endsWith(".wav")) {

						processed.add(entry.get("id").getTextValue());
						System.err.println(entry.get("parent").getTextValue() + entry.get("text").getTextValue());
						response = HttpUtil.get("http://127.0.0.1:5000/audio2txt/1?id=" + URLEncoder.encode(
								entry.get("parent").getTextValue() + entry.get("text").getTextValue(),
								StandardCharsets.UTF_8.toString()));

						System.err.println(response);
//						Files.write(
//								Paths.get("/Users/ericperler/work/src/python/azure/demo/output"
//										+ entry.get("text").getTextValue().replaceAll(".wav", ".segment")),
//								response.getBytes());

						System.err.println("DONE !!!!!");

					} else if (entry.get("type").getTextValue().endsWith("crawler")) {
						System.err.println(entry.get("parent").getTextValue() + entry.get("text").getTextValue());
						response = HttpUtil.get("http://127.0.0.1:5000/crawl/1/2?id=" + URLEncoder.encode(
								entry.get("parent").getTextValue() + entry.get("text").getTextValue(),
								StandardCharsets.UTF_8.toString()));

						System.err.println(response);

					} else if (entry.get("text").getTextValue().endsWith(".png")) {
						processed.add(entry.get("id").getTextValue());
						System.err.println(entry.get("parent").getTextValue() + entry.get("text").getTextValue());
						response = HttpUtil.get("http://127.0.0.1:5000/img2txt/1?id=" + URLEncoder.encode(
								entry.get("parent").getTextValue() + entry.get("text").getTextValue(),
								StandardCharsets.UTF_8.toString()));
//						Files.write(Paths.get("/Users/ericperler/work/src/python/azure/demo/output/"
//								+ entry.get("text").getTextValue() + ".txt"), response.getBytes());

						System.err.println(response);

					} else if (entry.get("text").getTextValue().endsWith("/data/demo")) {
						processed.add(entry.get("id").getTextValue());
						System.err.println(entry.get("parent").getTextValue() + entry.get("text").getTextValue());

//						try (PDDocument document1 = Loader.loadPDF(
//								new File(entry.get("parent").getTextValue() + entry.get("text").getTextValue()))) {

//							PDFTextStripper stripper = new PDFTextStripper();
//							String text = stripper.getText(document1);
							// System.out.println(text);
							response = HttpUtil.get("http://127.0.0.1:5000/pdf/1/2" + "?id="
									+ URLEncoder.encode(
											entry.get("parent").getTextValue() + entry.get("text").getTextValue(),
											StandardCharsets.UTF_8.toString()));

//							Files.write(Paths.get("/Users/ericperler/work/src/python/azure/demo/output/"
//									+ entry.get("text").getTextValue() + ".txt"), text.getBytes());

							File source = new File("/Users/ericperler/work/src/python/azure/demo/data/pdfs");
							File dest = new File("/Users/ericperler/work/src/python/azure/demo/output/");
							try {
								FileUtils.copyDirectory(source, dest);
							} catch (IOException e) {
								e.printStackTrace();
							}

							System.err.println("/Users/ericperler/work/src/python/azure/demo/output/"
									+ entry.get("text").getTextValue() + ".txt");
						//}
					} else if (entry.get("text").getTextValue().endsWith(".docx")) {
						processed.add(entry.get("id").getTextValue());
						System.err.println(entry.get("parent").getTextValue() + entry.get("text").getTextValue());
						StringBuilder b = new StringBuilder();
						File file = new File("/Users/ericperler/Documents/home/clients/DAI/dai_assesment.docx");
						FileInputStream fis = new FileInputStream(file.getAbsolutePath());
						XWPFDocument document = new XWPFDocument(fis);
						System.err.println(document);
						List<XWPFParagraph> paragraphs = document.getParagraphs();
						for (XWPFParagraph para : paragraphs) {
							System.out.println(para.getText());
							b.append(para.getText());
						}

						response = HttpUtil.get("http://127.0.0.1:5000/doc/1/2X?id=" + URLEncoder.encode(
								entry.get("parent").getTextValue() + entry.get("text").getTextValue(),
								StandardCharsets.UTF_8.toString()));
						Files.write(
								Paths.get("/Users/ericperler/work/src/python/azure/demo/output"
										+ entry.get("text").getTextValue().replaceAll(".doc", ".segment")),
								b.toString().getBytes());

						fis.close();

						System.err.println(response);

					} else if (entry.get("type").getTextValue().equals("mysql")) {

						response = HttpUtil.get("http://127.0.0.1:5000/mysql/1");
						File source = new File("/Users/ericperler/work/src/python/azure/demo/data/mysql.pdf");
						File dest = new File("/Users/ericperler/work/src/python/azure/demo/output/mysql.pdf");
						try {
							FileUtils.copyFile(source, dest);
						} catch (IOException e) {
							e.printStackTrace();
						}
						System.err.println(response);

					}
				}
			}

			return response;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{}";
	}

	@RequestMapping(value = "/getMetadata/{id}", method = RequestMethod.POST, produces = "application/json")
	public String getMetadata(@RequestBody Map<String, String> map) {
		try {
			List<Map<String, String>> data = DatalakeContext.getJobDao().getMetadata(map.get("key"));
			return ow.writeValueAsString(data);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getConnection/{name}/{fields}", method = RequestMethod.GET)
	public String getConnection(@PathVariable final String name, @PathVariable final String fields) {
		try {
			ConnectionConfig connection = DatalakeContext.getConnections().get(name);
			return ow.writeValueAsString(MetadataBuilder.build(datalakeConnectionFactory,
					new AbstractMap.SimpleImmutableEntry<>(name, connection), fields));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getConnections/{name}", method = RequestMethod.GET)
	public String getConnections(@PathVariable final String name) {

		ExecutorService executor = null;
		try {

			ConcurrentMap<String, ConnectionConfig> connections = DatalakeContext.getConnections();
			ThreadFactory tf = new ThreadFactoryBuilder().setNameFormat("edge-web-thread #%d")
					.setUncaughtExceptionHandler(new UncaughtExceptionHandler() {
						@Override
						public void uncaughtException(Thread t, Throwable e) {
							e.printStackTrace();
						}
					}).build();

			executor = Executors.newFixedThreadPool(connections.size(), tf);
			final List<Level> levels = new ArrayList<Level>();
			List<FutureTask<Level>> taskList = new ArrayList<FutureTask<Level>>(connections.size());

			for (final Map.Entry<String, ConnectionConfig> entry : connections.entrySet()) {

				FutureTask<Level> futureTask_1 = new FutureTask<Level>(new Callable<Level>() {
					@Override
					public Level call() {
						return MetadataBuilder.build(datalakeConnectionFactory, entry, null);
					}
				});
				taskList.add(futureTask_1);
				executor.execute(futureTask_1);
			}

			for (int j = 0; j < taskList.size(); j++) {
				FutureTask<Level> futureTask = taskList.get(j);
				Level level = futureTask.get();
				levels.add(level);
			}
			executor.shutdown();

			String json = ow.writeValueAsString(levels);

			return json;

		} catch (Exception e) {
			logger.info(Throwables.getStackTraceAsString(e));
			logger.info("Error ocuured " + e.getMessage());
			e.printStackTrace();
		} finally {
			executor.shutdown();
		}

		return null;
	}

	public static void main(String[] args) throws IOException {

		Files.walkFileTree(Paths.get("/Users/ericperler/work/src/python/azure/ci_cd/data/demo/"),
				new SimpleFileVisitor<Path>() {
					@Override
					public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
						if (!Files.isDirectory(file)) {
							System.err.println(file.getFileName().toString());
							if (file.getFileName().toString().endsWith(".pdf")) {
								try (PDDocument document1 = Loader
										.loadPDF(new File("/Users/ericperler/work/src/python/azure/ci_cd/data/demo/"
												+ file.getFileName().toString()))) {

									PDFTextStripper stripper = new PDFTextStripper();
									String text = stripper.getText(document1);

									Files.write(
											Paths.get("/Users/ericperler/work/src/python/azure/ci_cd/data/demo/txt/"
													+ file.getFileName().toString().replaceAll("pdf", "txt")),
											text.getBytes());
								}
							}
						}

						return FileVisitResult.CONTINUE;
					}
				});
	}

}
