using System;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System.IO;
using System.Web;
using System.Threading;

namespace BLL.Services
{
    public class GoggelApiCalendarService
    {
        //Install-Package Google.Apis.Calendar.v3
        //  https://developers.google.com/calendar/quickstart/dotnet

        // If modifying these scopes, delete your previously saved credentials
        // at ~/.credentials/calendar-dotnet-quickstart.json
        static string[] Scopes = { CalendarService.Scope.Calendar };
        static string ApplicationName = "Google Calendar API .NET Quickstart AhmedNageeb";


        public static Event AddEvent(string title, string description, DateTime? eventDateTime, string location)
        {
            try
            {
                
                UserCredential credential;
                //  GoogleCredential credential;

                using (var stream =
                        new FileStream(HttpContext.Current.Server.MapPath("/credentials.json"), FileMode.Open, FileAccess.Read))
                {
                    // The file token.json stores the user's access and refresh tokens, and is created
                    // automatically when the authorization flow completes for the first time.
                    string credPath = HttpContext.Current.Server.MapPath("/token.json");// "token.json";

                    credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                            GoogleClientSecrets.Load(stream).Secrets,
                            Scopes,
                            "user",
                            CancellationToken.None,
                            new FileDataStore(credPath, true)).Result;



                }

                //credential = GoogleWebAuthorizationBroker.AuthorizeAsync(new ClientSecrets
                //{
                //    ClientId = "661076660760-3ajonrlv2kebb3qt00pcpsuhrqftiqga.apps.googleusercontent.com",
                //    ClientSecret = "LSfD1asqxBGvq3Y6esJ4Xeke"
                //}, new string[] { CalendarService.Scope.Calendar },
                //"user",
                //CancellationToken.None,
                //new FileDataStore("Googel Clander")).Result;

                // Create Google Calendar API service.
                var service = new CalendarService(new BaseClientService.Initializer()
                {
                    HttpClientInitializer = credential,
                    ApplicationName = ApplicationName,
                });

                Event newEvent = new Event()
                {
                    Summary = title,
                    //  Location = location,
                    Description = description,

                    Start = new EventDateTime()
                    {
                        DateTime = eventDateTime,
                        TimeZone = "America/Los_Angeles",
                    },
                    End = new EventDateTime()
                    {
                        DateTime = eventDateTime.Value.AddHours(1),
                        TimeZone = "America/Los_Angeles",
                    },
                    //         Recurrence = new String[] { "RRULE:FREQ=DAILY;COUNT=2" }, هنا يتم اضافة مرتين بفارق يوم اى يضيفة كل يوم بمن بعد اول يوم
                    //            Attendees = new EventAttendee[] {
                    //            new EventAttendee() { Email = "lpage@example.com" },
                    //            new EventAttendee() { Email = "sbrin@example.com" },
                    //},
                    //            Reminders = new Event.RemindersData()
                    //            {
                    //                UseDefault = false,
                    //                Overrides = new EventReminder[] {
                    //        new EventReminder() { Method = "email", Minutes = 24 * 60 },
                    //        new EventReminder() { Method = "sms", Minutes = 10 },
                    //    }
                    //},
                    Locked = true,
                    AnyoneCanAddSelf = true,
                };
                string calendarId = "primary";
                EventsResource.InsertRequest request = service.Events.Insert(newEvent, calendarId);
                Event createdEvent = request.Execute();
                return createdEvent;
            }
            catch (Exception ex)
            {
                return new Event();
            }
        }
        public static void DeleteEvent(string id)
        {
            try
            {

                if (string.IsNullOrEmpty(id)) return;

                UserCredential credential;

                using (var stream =
                    new FileStream(HttpContext.Current.Server.MapPath("/credentials.json"), FileMode.Open, FileAccess.Read))
                {
                    // The file token.json stores the user's access and refresh tokens, and is created
                    // automatically when the authorization flow completes for the first time.
                    string credPath = HttpContext.Current.Server.MapPath("/token.json");// "token.json";
                    credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                        GoogleClientSecrets.Load(stream).Secrets,
                        Scopes,
                        "user",
                        CancellationToken.None,
                        new FileDataStore(credPath, true)).Result;
                    //   Console.WriteLine("Credential file saved to: " + credPath);
                }

                // Create Google Calendar API service.
                var service = new CalendarService(new BaseClientService.Initializer()
                {
                    HttpClientInitializer = credential,
                    ApplicationName = ApplicationName,
                });


                string CalendarId = "primary";
                service.Events.Delete(CalendarId, id).Execute();


            }
            catch (Exception ex)
            {

            }
        }
    }//end
}
