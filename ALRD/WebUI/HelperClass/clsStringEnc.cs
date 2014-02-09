using System;
using System.Text;

namespace WebUI.HelperClass
{
    public class clsStringEnc
    {
        public enum AtionType : int
        {
            // Supported algorithms
            Enc,

            Dec
        }

        public string decryptSimple(string stringToDec)
        {
            try
            {
                System.Text.Decoder utf8decode = new UTF8Encoding().GetDecoder();
                byte[] todecode_byte = Convert.FromBase64String(stringToDec);
                char[] decoded_char = new char[utf8decode.GetCharCount(todecode_byte, 0, todecode_byte.Length)];
                utf8decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                return new string(decoded_char);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string encryptSimple(string stringToEnc)
        {
            try
            {
                byte[] testdata = new byte[stringToEnc.Length];
                return Convert.ToBase64String(Encoding.UTF8.GetBytes(stringToEnc));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}