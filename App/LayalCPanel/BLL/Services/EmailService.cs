using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;   
using System.Net.Mail;
using System.Web;
using BLL.Services;
using Resources;

namespace DAL.Service
{
    public class EmailService 
    {


        public static  void SendEmail(string toEmail,string alisName, string subjec, string message, bool isHtml)
        {

            var Smtp = new SmtpClient(WebConfigService.Smtp);
            Smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            Smtp.UseDefaultCredentials = false;
            Smtp.Credentials = new NetworkCredential(WebConfigService.Email, WebConfigService.Password);


            //new MailAddress(Email), new MailAddress(toEmail)
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(WebConfigService.Email, subjec);
            msg.To.Add(new MailAddress(toEmail));
            msg.Subject = subjec;
            msg.BodyEncoding = Encoding.UTF8;
            msg.IsBodyHtml = isHtml;
            msg.Body = message;
             Smtp.Send(msg);
            msg.Dispose();
        }


      
        public static void SendActiveCode(string email, string userName, string code)
        {
            string Mess = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("/Files/Document/EmailActiveAccountMessage.html"));
            string CssFileName = LanguageService.IsEn ? "EmailstyleEn.css" : "EmailstyleAr.css";
            string Css = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("/Content/" + CssFileName));
            var Message = string.Format(Mess,
                Css,Token.Dear, userName, Token.PleaseCopyThisCode, code.ToString(), Token.AndPasteTheCodeInAppication, Token.AppName);
            SendEmail(email, Token.AppName, Token.AppName + " - " + Token.ActiveEmail, Message, true);
        }

        }

 
}
