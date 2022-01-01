﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Inventory_Management_System_017
{
    public partial class KarachiWarehouse : Form
    {
        public KarachiWarehouse()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Warehouses w = new Warehouses();
            w.Closed += (s, args) => this.Hide();
            w.Show();
        }

        private void populatedGridView()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=.;Initial Catalog=InventoryProject00;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("set nocount on; select ID, ProductCode, ProductName, ProductAmount, ProductStatus, SelectedWarehouse from tblProduct where SelectedWarehouse='Karachi';", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                karachiGridView.DataSource = dt;
            }
            else
            {
                karachiGridView.DataSource = null;
            }
            conn.Close();
        }


        private void KarachiWarehouse_Load(object sender, EventArgs e)
        {
              populatedGridView();
        }
    }
}
