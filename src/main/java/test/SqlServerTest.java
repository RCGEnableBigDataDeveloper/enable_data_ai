package test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class SqlServerTest {

	public static void main1(String[] args) throws Exception {
		System.out.println("begin transaction");
		String connectionUrl = "jdbc:sqlserver://localhost:1433;database=master;user=sa;password=Cdi6954c!";
		Connection connection = DriverManager.getConnection(connectionUrl);
		String query = "{call dbo.publish_BATCH_MESSAGE}";
		CallableStatement statement = connection.prepareCall(query);
		statement.execute();
		System.out.println("end transaction complete .. exit JVM");
	}

	public static void main2(String[] args) throws Exception {
		System.out.println("begin transaction");
		String connectionUrl = "jdbc:sqlserver://localhost:1433;database=master;user=sa;password=Cdi6954c!";
		Connection connection = DriverManager.getConnection(connectionUrl);
		String query = "INSERT INTO FH_AUDIT(transaction_id,batch_id,batch_key,source_sys,target_sys,source_sys_type,target_sys_type,source_schema,target_schema,start_time,\r\n"
				+ "end_time,initiated_by,records_in,records_out,xargs)\r\n"
				+ "VALUES(NEWID(), '2','3','4','5','6','7','8','9',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'{}',1000,2000,'{}')";
		Statement statement = connection.createStatement();
		statement.executeUpdate(query);
		System.out.println("end transaction exit JVM");
	}

	public static void main(String[] args) throws Exception {
		System.out.println("begin transaction");
		String connectionUrl = "jdbc:sqlserver://localhost:1433;database=master;user=sa;password=Cdi6954c!";
		Connection connection = DriverManager.getConnection(connectionUrl);

		ExecutorService executor = Executors.newFixedThreadPool(2);
		ThreadPoolExecutor pool = (ThreadPoolExecutor) executor;

		for (int i = 0; i < 10; i++) {
			//executor.submit(new Task(i));
		}
		
		executor.shutdown();

		String query = "select count(*), table_name from information_schema.columns GROUP BY table_name ORDER BY table_name";
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query);
		while (rs.next()) {
			System.err.println(rs.getString(2));
		}
		System.out.println("end transaction complete .. exit JVM");
	}

	static class Task implements Runnable {

		int i = 0;

		public Task(int i) {
			this.i = i;
		}

		public void run() {

			try {
				Long duration = (long) (Math.random() * 5);
				System.out.println("Running Task! Thread Name: " + Thread.currentThread().getName() + " : " + i);
				TimeUnit.SECONDS.sleep(duration);

				System.out.println("Task Completed! Thread Name: " + Thread.currentThread().getName() + " : " + i);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}
