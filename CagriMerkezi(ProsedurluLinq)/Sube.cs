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
    public partial class Sube : Form
    {
        public Sube()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void Sube_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ad = textBox1.Text;
            string ilce = textBox2.Text;
            string yetkili = textBox3.Text;
            baglanti.SubeEkle(ad, ilce, yetkili);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.SubeListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            baglanti.SubeSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["ŞubeAdi"].Value.ToString();
            textBox1.Tag = satir.Cells["ŞubeNo"].Value;
            textBox2.Text = satir.Cells["Şubeİlce"].Value.ToString();
            textBox3.Text = satir.Cells["ŞubeYetkilisi"].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            string ad = textBox1.Text;
            string ilce = textBox2.Text;
            string yetkili = textBox3.Text;
            baglanti.SubeYenile(id,ad, ilce, yetkili);
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
                string ad = textBox1.Text;
                var listele1 = baglanti.SubeAdAra(ad);
                dataGridView1.DataSource = listele1.ToList();
            }
            if (checkBox2.Checked == true)
            {
                string durum = textBox2.Text;
                var listele1 = baglanti.SubeİlceAra(durum);
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
