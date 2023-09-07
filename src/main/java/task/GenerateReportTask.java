package task;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;

/***********************************************************************
 * Module:  PACKAGE_NAME.GenerateReportTask
 * Author:  Ratwareid
 * Created: 07/09/2023
 * Info:  If You dont know me ? Just type ratwareid in google.
 ***********************************************************************/
public class GenerateReportTask implements Runnable{

    private final String[] clientCode;

    public GenerateReportTask(String... client){
        this.clientCode = client;
    }

    @Override
    public void run() {
        try {
            if (clientCode.length == 0) {
                System.out.println("No Client Attached ! ... Skipping generating report.");
                return;
            }
            for (String client : clientCode) {
                final String templatePath = "src/main/resources/templates/";
                // Mengatur koneksi ke database MySQL
                Connection connection = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/report", "postgres", "postgres"
                );

                // Memuat laporan dari file JRXML
                JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(templatePath+"reportPayment.jasper");
                String reportCode = "ACT-01";

                // Mengisi laporan dengan data dari database
                Map<String, Object> parameters = new HashMap<>();
                parameters.put("SUBREPORT_DIR", templatePath);
                parameters.put("client_code", client);
                parameters.put("report_code", reportCode);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);

                // Menyimpan laporan dalam format PDF
                String filename = "Payment_"+client+"_"+System.currentTimeMillis()+".pdf";
                JasperExportManager.exportReportToPdfFile(jasperPrint, "report/"+filename);

                // Menutup koneksi ke database
                connection.close();

                System.out.println("Laporan "+filename+" telah dibuat, mohon periksa folder report!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
