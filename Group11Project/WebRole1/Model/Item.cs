using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebRole1.Model
{
    public class Item
    {
        private string medicinename;
        private string dosage;

        public Item(string medicinename, string dosage)
        {
            this.medicinename = medicinename;
            this.dosage = dosage;
        }
    }
}