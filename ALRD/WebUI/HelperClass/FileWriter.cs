using System.IO;

namespace WebUI.HelperClass
{
    public class FileWriter
    {
        public static void WriteFile(byte[] fileData, string filePath, string fileName, string extension)
        {
            string sFilename = filePath + fileName;

            //Delete the existing file
            if (File.Exists(sFilename))
            {
                File.Delete(sFilename);
            }

            // Save the stream to disk
            FileStream newFile = new FileStream(sFilename, FileMode.Create);
            newFile.Write(fileData, 0, fileData.Length);
            newFile.Close();
        }

        public static void DeleteFile(string filePath, string fileName)
        {
            string sFilename = filePath + fileName;
            if (File.Exists(sFilename))
            {
                File.Delete(sFilename);
            }
        }
    }
}