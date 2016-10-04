using System;
using System.EnterpriseServices;
using BTSAppIntegration;
using System.Runtime.InteropServices;


namespace SoapClientDotNet
{
	/// <summary>
	/// Summary description for AIC.
	/// </summary>

    [Guid("2BC73916-FB97-4049-B1AF-DF6BBB43CDB2")]
	public class AIC : ServicedComponent, IBTSAppIntegration
	{
		public AIC()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		 public string ProcessMessage(string document)
		{
			string responsedoc;
			responsedoc = QuoteServiceSoapClient(document);
			UpdateDB (responsedoc);
			return "Stock Quotes have been updated successfully by .NET AIC";
		}
		string QuoteServiceSoapClient(string document)
		{
			///add your code here
				return document;
		}
		void UpdateDB(string document)
		{
			///add you code here
		}
	}
}
