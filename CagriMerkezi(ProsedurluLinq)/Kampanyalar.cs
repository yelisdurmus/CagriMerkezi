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
    public partial class Kampanyalar : Form
    {
        public Kampanyalar()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void Kampanyalar_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            comboBox1.DataSource = baglanti.Tarifelers.ToList();
            comboBox1.ValueMember = "TarifeNo";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int tno = Convert.ToInt32(comboBox1.Text);
            string kad = textBox1.Text;
            string sure = textBox2.Text;
            decimal ucret = Convert.ToDecimal(textBox3.Text);
            baglanti.KampanyaEkle(tno, kad, sure, ucret);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.KampanyaListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            comboBox1.Text = satir.Cells["TarifeNo"].Value.ToString();
            textBox1.Text = satir.Cells["KAdi"].Value.ToString();
            textBox1.Tag = satir.Cells["KampanyaNo"].Value;
            textBox2.Text = satir.Cells["KSüresi"].Value.ToString();
            textBox3.Text = satir.Cells["KUcreti"].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            baglanti.KampanyaSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int kno = (int)textBox1.Tag;
            int tno = Convert.ToInt32(comboBox1.Text);
            string kad = textBox1.Text;
            string sure = textBox2.Text;
            decimal ucret = Convert.ToDecimal(textBox3.Text);
            baglanti.KampanyaYenile(kno,tno, kad, sure, ucret);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button4_Click(object sender, EventArgs e)
        {
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
                int tno =Convert.ToInt32(comboBox1.Text);
                var listele = baglanti.TNoGoreAra(tno);
                dataGridView1.DataSource = listele.ToList();
            }
            if (checkBox2.Checked == true)
            {
                string ad = textBox1.Text;
                var listele1 = baglanti.KAdaGoreAra(ad);
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
