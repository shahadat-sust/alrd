using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace WebUI.HelperClass
{
    public class ImageUtil
    {
        public static byte[] resizeImage(byte[] ImageFile)
        {
            return resizeImage(ImageFile, new Size(140, 140), false);
        }

        public static byte[] resizeImage(byte[] ImageFile, Size size, bool keepAspectRatio)
        {
            MemoryStream ms = new MemoryStream(ImageFile);
            System.Drawing.Image imgToResize = System.Drawing.Image.FromStream(ms);

            int sourceWidth = imgToResize.Width;
            int sourceHeight = imgToResize.Height;

            int destWidth = size.Width;
            int destHeight = size.Height;

            if (keepAspectRatio)
            {
                float nPercent = 0;
                float nPercentW = 0;
                float nPercentH = 0;

                nPercentW = ((float)size.Width / (float)sourceWidth);
                nPercentH = ((float)size.Height / (float)sourceHeight);

                if (nPercentH < nPercentW)
                    nPercent = nPercentH;
                else
                    nPercent = nPercentW;

                destWidth = (int)(sourceWidth * nPercent);
                destHeight = (int)(sourceHeight * nPercent);
            }

            Bitmap b = new Bitmap(destWidth, destHeight);
            Graphics g = Graphics.FromImage((Image)b);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
            g.Dispose();

            byte[] byteArray;
            using (MemoryStream ms1 = new MemoryStream())
            {
                b.Save(ms1, ImageFormat.Jpeg);
                byteArray = new byte[ms1.Length];
                ms1.Position = 0;
                ms1.Read(byteArray, 0, Convert.ToInt32(ms1.Length));
            }
            b.Dispose();

            return byteArray;
        }
    }
}