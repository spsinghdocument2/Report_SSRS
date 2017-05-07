using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PayOnlineReportApplication.Web
{
        /// <summary>
        /// Helper class 
        /// </summary>
        public static class Helper
        {
            /// <summary>
            /// Method to get list from enum
            /// </summary>
            /// <returns></returns>
            public static List<ListItem> ConvertEnumToList<T>()
            {
                Array values = Enum.GetValues(typeof(T));
                List<ListItem> items = new List<ListItem>(values.Length);

                foreach (var i in values)
                {
                    items.Add(new ListItem
                    {
                        Text = Enum.GetName(typeof(T), i),
                        Value = ((int)i).ToString()
                    });
                }
                return items;
            }
        }
}