using System;
using System.Collections.Generic;
using System.Text;

namespace Toolbox
{
    public class Command
    {
        public string Query { get; set; }
        public bool IsStoredProcedure { get; set; }
        public Dictionary<string,object> Parameters { get; set; }

        public Command(string query, bool isStoredProcedure)
        {
            Query = query;
            IsStoredProcedure = isStoredProcedure;
            Parameters = new Dictionary<string, object>();
        }

        public void AddParameters(string parameterName, object value)
        {
            Parameters.Add(parameterName, value ?? DBNull.Value);
        }
    }
}
