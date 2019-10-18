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
    public partial class Kayıtlar : Form
    {
        public Kayıtlar()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void Kayıtlar_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;

            comboBox1.DataSource = baglanti.Musterilers.ToList();
            comboBox1.DisplayMember = "AdSoyad";
            comboBox1.ValueMember = "MusteriNo";
            comboBox2.DataSource = baglanti.CGörevlis.ToList();
            comboBox2.ValueMember = "CGorevliNo";
            comboBox2.DisplayMember = "CAdSoyad";
            comboBox3.DataSource = baglanti.Birimlers.ToList();
            comboBox3.ValueMember = "BirimNo";
            comboBox3.DisplayMember = "BirimAdi";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int mno = Convert.ToInt32(comboBox1.SelectedValue);
            int gno= Convert.ToInt32(comboBox2.SelectedValue);
            string sure = textBox1.Text;
            string tarih = dateTimePicker1.Text;
            string acıklam = textBox2.Text;
            int bno=Convert.ToInt32(comboBox3.SelectedValue);
            baglanti.KayitEkle(mno, gno, sure, tarih, acıklam, bno);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.KayitListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            comboBox1.Text = satir.Cells["MusteriNo"].Value.ToString();
            comboBox2.Text = satir.Cells["GorevliNo"].Value.ToString();
            textBox1.Text = satir.Cells["KayıtSuresi"].Value.ToString();
            textBox1.Tag = satir.Cells["KayıtNo"].Value;
            dataGridView1.Text = satir.Cells["KayıtTarihi"].Value.ToString();
            textBox2.Text = satir.Cells["Acıklama"].Value.ToString();
            comboBox3.Text = satir.Cells["BirimNo"].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id =Convert.ToInt32(textBox1.Tag);
            baglanti.KayitSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            int mno = Convert.ToInt32(comboBox1.SelectedValue);
            int gno = Convert.ToInt32(comboBox2.SelectedValue);
            string sure = textBox1.Text;
            string tarih = dateTimePicker1.Text;
            string acıklam = textBox2.Text;
            int bno = Convert.ToInt32(comboBox3.SelectedValue);
            baglanti.KayitYenile(id,mno, gno, sure, tarih, acıklam, bno);
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
                int ad = Convert.ToInt32(comboBox1.SelectedValue);
                var listele1 = baglanti.KayıtMusteriAra(ad);
                dataGridView1.DataSource = listele1.ToList();
            }
            if (checkBox2.Checked == true)
            {
                int gno = Convert.ToInt32(comboBox2.SelectedValue);
                var listele1 = baglanti.KayıtGorevliAra(gno);
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
