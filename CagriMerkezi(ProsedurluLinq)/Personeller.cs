using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CagriMerkezi_ProsedurluLinq_
{
    public partial class Personeller : Form
    {
        public Personeller()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void Personeller_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ad = textBox1.Text;
            string mezuniyet = comboBox1.Text;
            string vardiya = comboBox2.Text;
            string plan="";
            if (checkBox3.Checked == true)
            {
                plan += ", " +checkBox3.Text;
            }
            if (checkBox4.Checked == true)
            {
                plan += ", " + checkBox4.Text;
            }
            if (checkBox5.Checked == true)
            {
                plan += ", " + checkBox5.Text;
            }
            if (checkBox6.Checked == true)
            {
                plan += ", " + checkBox6.Text;

            }
            if (checkBox7.Checked == true)
            {
                plan += ", " + checkBox7.Text;
            }
            if (checkBox8.Checked == true)
            {
                plan += ", " + checkBox8.Text;
            }
            if (checkBox9.Checked == true)
            {
                plan += ", " + checkBox9.Text;
            }
            baglanti.GorevliEkle(ad, mezuniyet, vardiya, plan);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.GorevListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["CAdSoyad"].Value.ToString();
            textBox1.Tag = satir.Cells["CGorevliNo"].Value;
            comboBox1.Text = satir.Cells["Mezuniyet"].Value.ToString();
            comboBox2.Text = satir.Cells["VardiyaDurumu"].Value.ToString();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            baglanti.GorevliSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            goruntule();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            string ad = textBox1.Text;
            string mezuniyet = comboBox1.Text;
            string vardiya = comboBox2.Text;
            string plan = "";
            if (checkBox3.Checked == true)
            {
                plan += ", " + checkBox3.Text;
            }
            if (checkBox4.Checked == true)
            {
                plan += ", " + checkBox4.Text;
            }
            if (checkBox5.Checked == true)
            {
                plan += ", " + checkBox5.Text;
            }
            if (checkBox6.Checked == true)
            {
                plan += ", " + checkBox6.Text;

            }
            if (checkBox7.Checked == true)
            {
                plan += ", " + checkBox7.Text;
            }
            if (checkBox8.Checked == true)
            {
                plan += ", " + checkBox8.Text;
            }
            if (checkBox9.Checked == true)
            {
                plan += ", " + checkBox9.Text;
            }
            baglanti.GorevliYenile(id,ad, mezuniyet, vardiya, plan);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
           
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                string ad = textBox1.Text;
                var listele1 = baglanti.MAdGoreAra(ad);
                dataGridView1.DataSource = listele1.ToList();
            }
            if (checkBox2.Checked == true)
            {
                string durum = comboBox2.Text;
                var listele1 = baglanti.GVardiyaGoreAra(durum);
                dataGridView1.DataSource = listele1.ToList();
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form1 git = new Form1();
            git.Show();
            this.Hide();
        }
    }
}
