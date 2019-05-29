using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class TempFunction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StopButton.Enabled = false;
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }


        bool stopped = false;

        protected void RecordButton_Click(object sender, EventArgs e)
        {
            RecordButton.Enabled = false;
            StopButton.Enabled = true;
            double x, y, z;
            int t = 0;

            while (stopped==false)
            {
                x = 0; //read x from sensor
                y = 0; //read y from sensor
                z = 0; //read z from sensor

                Task.Factory.StartNew(() => Thread.Sleep(1000))
                .ContinueWith(task =>
                 {
                     Record(t, x, y, z);
                 }, TaskScheduler.FromCurrentSynchronizationContext());
                t++;
                

                if (stopped == true)
                {
                    break;
                }
            }

        }

        protected  void StopButton_Click(object sender, EventArgs e)
        {
            stopped = true;
            RecordButton.Enabled =true;
            StopButton.Enabled = false;
        }

        private void Record (int t, double x, double y, double z)
        {
            tLabel.Text = t.ToString();
            xLabel.Text = x.ToString();
            yLabel.Text = y.ToString();
            zLabel.Text = z.ToString();
        }
    }
}