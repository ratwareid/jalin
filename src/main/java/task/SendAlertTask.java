package task;

import model.AlertData;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/***********************************************************************
 * Module:  PACKAGE_NAME.SendAlertTask
 * Author:  Ratwareid
 * Created: 07/09/2023
 * Info:  If You dont know me ? Just type ratwareid in google.
 ***********************************************************************/
public class SendAlertTask implements Runnable{

    @Override
    public void run() {

        String inputFolderPath = "input";
        String alertFileName = "DataAlert.txt";

        File inputFile = new File(inputFolderPath, alertFileName);

        if (inputFile.exists()) {
            try {
                // Membaca isi file alert.txt menjadi sebuah string
                ArrayList<String> alertFileContents = readFile(inputFile);

                HashMap<String, List<AlertData>> alertPerBank = new HashMap<>();
                for (String alert : alertFileContents) {
                    String[] data = alert.split(";");
                    String bankCode = data[0];
                    String envi = data[1];
                    String port = data[2];
                    String bankName = data[3].trim();
                    String status = data[4];

                    if (status.equalsIgnoreCase("Online")) continue; //skip status yang online

                    List<AlertData> listAlert = alertPerBank.get(bankCode);
                    if (listAlert == null) listAlert = new ArrayList<>();
                    AlertData dto = new AlertData(bankCode,envi,bankName,port,status);
                    listAlert.add(dto);
                    alertPerBank.put(bankCode,listAlert);
                }

                //Data Siap diolah ingin send mail atau apapun
                String templateMsg =    "Selamat Siang Rekan Bank %bankCode%,\n" +
                                        "\n" +
                                        "Mohon bantuan untuk Sign on pada envi berikut:\n" +
                                        "\n" +
                                        "%dataEnvi%\n" +
                                        "\n" +
                                        "Terima Kasih";

                String separator = "\n-----------------------------------------------\n";//opsional

                for (String bankCode : alertPerBank.keySet()) {
                    List<AlertData> listAlert = alertPerBank.get(bankCode);

                    StringBuilder dataEnvi = new StringBuilder("");
                    for (AlertData alert : listAlert) {
                        if (!dataEnvi.toString().equals("")) dataEnvi.append("\n");
                        dataEnvi.append("- Envi ").append(alert.getEnvironment())
                                .append(" Port ").append(alert.getPort())
                                .append(" terpantau ").append(alert.getStatus());
                    }
                    String message = templateMsg.replace("%bankCode%",bankCode)
                                    .replace("%dataEnvi%",dataEnvi.toString());
                    message += separator;
                    System.out.println(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("File "+alertFileName+" tidak ditemukan.");
        }
    }

    // Metode untuk membaca isi file menjadi string
    private static ArrayList<String> readFile(File file) throws IOException {
        ArrayList<String> content = new ArrayList<String>();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line = "";
            while ((line = reader.readLine()) != null) {
                content.add(line);
            }
        }
        return content;
    }
}

