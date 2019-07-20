using Resources;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class DateService
    {

        public static string GetDateTimeByCulture(DateTime? date, bool isArabTimeZone = true)
        {
            string Format = "dd/MM/yyyy hh:mm:ss tt";
            if (date == null) return null;

            if (isArabTimeZone)
            {

                /*
                 نحول التوقيت الى الكويت لان التحويل لان الوقت الذى يضاف هوا توقيت السيرفر والسيرف  فى الهند
                 */
                return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(date.Value,
                             TimeZoneInfo.Local.Id, "Arab Standard Time").ToString(Format, new CultureInfo("en"));
            }
            return date.Value.ToString(Format, new CultureInfo("en"));
        }

        internal static string GetTimeEn(TimeSpan time)
        {
            return time.ToString();
        }

        private  static string GetDateTimeByCulture(DateTime date)
        {
            string Format = "dd/MM/yyyy hh:mm:ss tt";
                /*
                 نحول التوقيت الى الكويت لان التحويل لان الوقت الذى يضاف هوا توقيت السيرفر والسيرف  فى الهند
                 */
                return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(date,
                             TimeZoneInfo.Local.Id, "Arab Standard Time").ToString(Format, new CultureInfo("en"));
        }

        public static string GetDateTimeEn(DateTime? date)
        {
            if (!date.HasValue)
                return "";

            string Format = "dd/MM/yyyy hh:mm:ss tt";
            /*
             نحول التوقيت الى الكويت لان التحويل لان الوقت الذى يضاف هوا توقيت السيرفر والسيرف  فى الهند
             */
            return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(date.Value,
                         TimeZoneInfo.Local.Id, "Arab Standard Time").ToString(Format, new CultureInfo("en"));
        }
        /// <summary>
        /// ANageeb : 
        /// convert date time to date time since
        /// </summary>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public static string GetDateTimeSince(DateTime? dateTime)
        {
            if (!dateTime.HasValue) return "";

            /*
               نتحقق من السنين ثم الشهور ثم الايام ثم الدقائق
           if    A: Year
           if    B:Month
           if    C: Day
           if    D: Hour
           if    D: Minute
           else  J: JustNow
             * */
            var DTime = DateTime.Now - dateTime.Value;

            //A: Year
            if (DTime.Days >= 366)
            {
                //We check the number of years greater than 3 or less. 
                if (DTime.Days >= (366 * 3))
                    return CultAgoText($"{(DTime.Days / 366)} {Token.Years}");

                //We check the number of years greater than 2 or less. 
                if (DTime.Days >= (366 * 2))
                    return CultAgoText(Token.TwoYears);

                //So it's one year.
                return CultAgoText(Token.OneYear);
            }


            //B:Month
            if (DTime.Days >= 31)
            {
                //We check the number of months greater than 3 or less. 
                if (DTime.Days >= (31 * 3))
                    return CultAgoText($"{(DTime.Days / 31)} {Token.Months}");

                //We check the number of months greater than 2 or less. 
                if (DTime.Days >= (31 * 2))
                    return CultAgoText(Token.TwoMonths);

                //So it's one month.
                return CultAgoText(Token.OneMonth);
            }

            //C: Day
            if (DTime.Days > 0)
            {
                if (DTime.Days >= 3)
                    return CultAgoText($"{DTime.Days} {Token.Days}");

                if (DTime.Days >= 2)
                    return CultAgoText(Token.TwoDays);

                return CultAgoText(Token.OneDay);
            }

            //D: Hour
            if (DTime.Hours > 0)
            {
                if (DTime.Hours >= 3)
                    return CultAgoText($"{DTime.Hours} {Token.Hour}");

                if (DTime.Hours >= 2)
                    return CultAgoText(Token.TwoHour);

                return CultAgoText(Token.OneHour);
            }

            //D: Minute
            if (DTime.Minutes > 0)
            {
                if (DTime.Minutes >= 3)
                    return CultAgoText($"{DTime.Minutes} {Token.Minute}");
                else if (DTime.Minutes >= 2)
                    return CultAgoText(Token.TwoMinute);
                return CultAgoText(Token.OneMinute);
            }

            return Token.JustNow;
        }

        private static string CultAgoText(string dateText)
        {
            if (LanguageService.IsEn)
                return $"{dateText} {Token.Ago}";

            return $"{Token.Ago} {dateText}";

        }

        internal static string GetDateEn(DateTime? date)
        {
            if (!date.HasValue)
                return "";
            return date.Value.ToString("MM/dd/yyyy",new CultureInfo("en"));
        }
        public static DateTime DateTimeByCulture(DateTime date)
        {
            try
            {
                return DateTime.Parse(GetDateTimeByCulture(date));
            }
            catch
            {
                try
                {
                    return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(date,
                            TimeZoneInfo.Local.Id, "Arab Standard Time");
                }
                catch
                {

                    return date;
                }

            }
        }











    }//end 
}
