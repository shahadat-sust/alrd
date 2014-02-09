using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Threading;
using System.Text;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI.HelperClass
{
    public class MailSender
    {
        private bool _DoDeleteAttacmentFiles = true;

        public bool DoDeleteAttacmentFiles
        {
            get { return _DoDeleteAttacmentFiles; }
            set { _DoDeleteAttacmentFiles = value; }
        }


        private List<MailReport> _MailReport;

        public void SendMail(List<Mail> maillist)
        {
            _MailReport = new List<MailReport>();
            Thread mailThread = new Thread(Send);
            mailThread.Start(maillist);

        }
        void Send(Object o)
        {
            List<string> lines = new List<string>();
            try
            {

                lines.Add("Mailing Started at " + DateTime.Now.ToString());
                List<Mail> maillist = (List<Mail>)o;
                int i = 0;
                foreach (var item in maillist)
                {
                    i++;
                    Send(item);
                    if (i == 5)
                    {
                        i = 0;
                        Thread.Sleep(60000);
                    }
                }

            }
            catch (Exception ex)
            {
                lines.Add("Error: " + ex.Message.ToString());

            }
            finally
            {
                foreach (var item in _MailReport)
                {
                    string tolist = "";
                    foreach (var item1 in item.SendMail.ToAddress)
                    {
                        string err = !item.IsSend ? item.Ex.Message.ToString() : "";
                        tolist = tolist + "" + item1 + " " + err + ",";
                    }

                    lines.Add(tolist + " :" + item.IsSend.ToString());
                }
                string filePath = System.Web.Hosting.HostingEnvironment.MapPath("~/Upload/Files/EmailLog/" + "EmilLog" + DateTime.Now.ToString("dd_MM_yyyy_HH_mm_ss") + ".txt");
                System.IO.File.WriteAllLines(filePath, lines);
            }





        }


        private void Send(Mail mail)
        {
            SmtpClient client = new SmtpClient();
            //client.DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory;
            try
            {
                MailMessage message = new MailMessage();

                if (!string.IsNullOrEmpty(mail.FromEmail))
                    message.From = new MailAddress(mail.FromEmail.Trim());

                if (mail.BCCAddress != null)
                    foreach (var item in mail.BCCAddress)
                    {
                        message.Bcc.Add(new MailAddress(item));
                    }

                if (mail.CCAddress != null)
                    foreach (var item in mail.CCAddress)
                    {
                        message.CC.Add(new MailAddress(item));
                    }
                if (mail.ToAddress != null)
                    foreach (var item in mail.ToAddress)
                    {
                        message.To.Add(new MailAddress(item));
                    }
                if (mail.AttachmantFileName != null)
                    foreach (string item in mail.AttachmantFileName)
                    {
                        var memStream = new MemoryStream(File.ReadAllBytes(item));
                        message.Attachments.Add(new Attachment(memStream, item.Split('\\')[item.Split('\\').Length - 1]));
                    }
                message.Subject = mail.Subject;
                message.Body = mail.Body;
                if (mail.IsHtml)
                    message.IsBodyHtml = true;
                message.BodyEncoding = UTF8Encoding.UTF8;
                message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;



                client.Send(message);
                _MailReport.Add(new MailReport(mail, true));


            }
            catch (SmtpException ex)
            {
                _MailReport.Add(new MailReport(mail, false, ex));

            }
            catch (Exception ex)
            {
                _MailReport.Add(new MailReport(mail, false, ex));
            }
            finally
            {
                //client.Dispose();
                if (_DoDeleteAttacmentFiles)
                    DeleteAttachMentFiles(mail);
            }
        }
        public void DeleteAttachMentFiles(Mail mail)
        {
            foreach (string item in mail.AttachmantFileName)
            {
                if (File.Exists(item))
                {
                    try
                    {
                        File.Delete(item);

                    }
                    catch (Exception)
                    {


                    }
                }
            }

        }
    }

    public class Mail
    {
        public string FromEmail { get; set; }
        private List<string> _ToAddress = new List<string>();
        public bool IsHtml { get; set; }

        public List<string> ToAddress
        {
            get { return _ToAddress; }
            set { _ToAddress = value; }
        }
        private List<string> _CCAddress;

        public List<string> CCAddress
        {
            get { return _CCAddress; }
            set { _CCAddress = value; }
        }

        private List<string> _BCCAddress;

        public List<string> BCCAddress
        {
            get { return _BCCAddress; }
            set { _BCCAddress = value; }
        }
        private List<string> _AttachmantFileName = new List<string>();

        public List<string> AttachmantFileName
        {
            get { return _AttachmantFileName; }
            set { _AttachmantFileName = value; }
        }

        public string Subject { get; set; }
        public string Body { get; set; }
    }
    public class MailReport
    {
        public Mail SendMail;
        public Exception Ex;
        public bool IsSend;
        public MailReport() { }
        public MailReport(Mail sendMail, bool isSend, Exception ex = null)
        {
            this.SendMail = sendMail;
            this.IsSend = isSend;
            this.Ex = ex;
        }
    }
}