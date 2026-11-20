Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199719;
	b=sGa7POVyCAvH9T0HI5iMMdqzGbStMJN9Xe+VLLtCioDSyjeFe6dfj7VL3T0eWyjFrQ3Z
	 33CSXjYEy6SeLmIVzl6OOOxNzqIjzDGRt1KHnDDJfedsEQAPjhhsMkfn/wCicwN8dQx7W
	 nwxqnx9PgHf3bc1OeagEsEmIbQt1gBopH8UuU5/bebuEPa4L42ZsiMAQSqt90sEf9qoEx
	 Vx7t0OWCeUE2wLihwIISdShYI/hT/WsmpstxYzIYpHCa/wjCKesolcNBg6F6U9ThPB/p4
	 gHR7CDv+juM+pxIFUkLIrVBnl38qpPborbmBgZvGl/KpfFdZySHfhjdg8n+qBnPX3dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
	b=4Flh9GZHBuixRKgmcKBWogCzjEgWKxP2V5gt30TtcpRkLl2nfkmz+5jnUmLZvkKGYdbe
	 ZB5xXL1gRD8AU3Sks7JLDEgqhHtQfRXayjsds9uAVpUG2pyQ8MdCjoB1GUhf3bryAf698
	 dCYRkFiliLwL7RS0XpaEn4TQ6xtxbhIYiUMRlvpFF28qykp7Th7Ehcy0yDxxZiaUePta6
	 5JWBTpvSe50uxBxyMfg5QU+7x27qjIwMSA3xcrsnxXcMiTHPyAYZpncioGY18I/MeD0QM
	 xKMh5Lua8DL0YB/6GhqdmQCS4hCnpnRN3Eqs6PkIPztPhI01053+Cpc25H5Dj+Q7llg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d/pQaSeg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF560A261D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AF560A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/pQaSeg
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so769775f8f.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199715; cv=none;
        d=google.com; s=arc-20260327;
        b=i2SbEEs7mYU/j8QgDN2Jsufm/alfu2Y/3HoROVhsRHN1vW2VsawZNymZVYDmKSJbF+
         QMP/zhMzxoztj3A1X5dIS0d1WkPt7qXW3Z/kSTDUibYDGP4QCisSePaeNNJcGHIiwZb3
         OTxTunzyuEV9wzdKwBaFThqJP4CkTZyg/4JBjVYccU+sv9/PU0KhEME3paPmOUvXStXr
         UvYYDPeV9OF88JGhdwKNfgFpr2NBt8eT8/7qw6GjsCUQ/691nUZ18q7XiXjIDc/+/TcX
         Ohxo1LBZk2FjoGNYqQ91wyiYFwTEHVnXVIqFv1qNuk7PLQLozF+xeRMRQ3lQofpDh2kA
         hh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
        fh=g3/cEY2M/adsnW6LupPNTuFxJQTkQfq9I8A4Nk7euE0=;
        b=j/8Cnd4go+XgEese4ZatfjrRn91GcQHG0thP+LJphBCbHrnVSprSe0y4v8YmVXnwil
         qT7sxGlw8y+7R0CPILCI8fQE5Xaevdoo4yQ7cMZ7ycIoVvt7zR7aUnV55UWbaBJ82r4p
         J7p8Xt25hBlCtKg//aFSlI8G+ubkWFHCLULmErLRG8sucpN3lCIjbfO1jUeftU8nOQgI
         kKjwYx/oxi72C8WwK+JOwXjApckoIiG5YXUIoHKIqKmjxGwF1T/OoaCIVPbdfJwzQ3jZ
         CFmGA3QQMmSXFGKm4XosbOS/YPQXKdE3ANIagxPl3F23kIG5gcecfIaVebcf1YbF9s5E
         KUuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199714; x=1795804514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
        b=d/pQaSegThK9ekeLMvclSNFVlyfHAlpbyZqEv2Nd1/mO4riFi4mx2wHSvPRx6ZMaqP
         Qx7qHLRRh99OXWZMDlTS6957zxCocmHnsFhFeWGafSiZtp0PsDN5vcfji240JtFstdGu
         zwhs0+ZhOSXHAjfwqP3ERvsnd+l3ignMpzoDxOf4tALVj1aWrZajDE9oUibIphBWY6kW
         IkLmnRhDI9F8OHRCyhRgYAhAJgLBW03gaNiyqaQgTh2eS/BzuVBM/zGGaKkBS5pxQKgf
         PYbYbI5yJqkJgJF4xRV9NRlBXDgTlZWYIMxMiQ15pUm2UzeaFL2L/P2/RwdOEKeijd+T
         gnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199714; x=1795804514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rsFIIfYLlPNAydhi/mQeevdGoY6nLo3sNtxIAPeXsE=;
        b=UnwVMDu4r2+oX3sVFycJP+ZVGn7hrEyAlAT/KwhEGzVd7I50tY1R1DnSJAIWokrBcf
         QtMvBx2nVq1ua4cjlZcbCLmPv3Wo8DtkAmT/b54LQJepIAuUykmMQeRr4D8P7hmggkPB
         7Bt3PfzBYr3WhTjiokIcaISI71XF6fYQr9T6lC7PDUcP1wl+3+UI0Gk7zVG8ViX2sT1y
         9SqTdPykC3zTioHl20LX/O53AdtBQUGPf0LUAI0Zq3M17j8U9jS/aUL2INtKU6cqtuBo
         gGXfPn1ld0ysBhlLkemBvZXdZbvK4YpzUMOxu6BaR1fyQI/TcuvmMI44ynlZ8CC+vFkf
         a9Nw==
X-Forwarded-Encrypted: i=1; AL+hErFJUCy8CnF43hIGdGsWATBp+0nEBwO24HjKNoM4wBh5igUUaX73h6GUiDks17EDNmg0cd3htOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z98mbJ17pCHy8L/Nw5jYZF9rxFrhLNHPVSM+Vz2mZbZRIcAYFYN
	V66NJB7F8LpuVaSKTmagzsXhnz4lB74TEqF4/TT1rFLa44UaNZQgaQgSmWluvlbvzTK7H4iCRBc
	If9O9KMhVMZXnLsMZFrTek8sd+VGmcyw=
X-Gm-Gg: AZFdTZfNiYk1RttP790ylcrs2etPcKg8u7g8VX2HZPfrsXj+YpFO9JKRibJcia/UC/0
	rVJICVoU03lusm2foE5OboxsQ2+gbHRydGap3E0lwfsxbOxFobH4Om+9z1bV+PMP+sIrYAd3ucf
	fx8W+8FMkspBLz+MxKmEmDZG7vAmaiHd0ZQVdeBNBktr+GfOx3LvYy5wgQegVYkNrjVQygzrRC2
	z/Mpn4rP56oxsHDPQKVdz58K0dVmNrpYVdSOyBmq7aGKQ1s4f5L1bmCBioDqitCeDN/KBXSWLSz
	NdJVq0wEKtdblGNM0yc8DUl/Z4Nvep9HeJeEYi0BkwkrAgJPVE9J/yPQkblZzXrALiLH/XgmZgM
	q6eQ+oJ84EVZ/aavCVlgHhw4OhL9toCH3BcHPfX5OqT3yqGe4s107QfSGA+CkgsNVk+Z2q0F+KZ
	wRJjhAwLEuZgTwpeEziok4t4qCn2aVrxSf2mKhJ3r4W7CfSnOhxx3e9XSuFA==
X-Received: by 2002:a05:6000:111:b0:490:71a7:6f51 with SMTP id
 ffacd0b85a97d-4abb4c7aab0mr6478589f8f.45.1795199714378; Fri, 20 Nov 2026
 10:35:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-21-prabhakar.mahadev-lad.rj@bp.renesas.com> <99974c5f-c1c0-427c-ab10-a6559789f258@linux.dev>
In-Reply-To: <99974c5f-c1c0-427c-ab10-a6559789f258@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:34:48 +0000
X-Gm-Features: Aa3M54qKtccQda4ewlsXLoeUNdEV-Vb_fwoRb_ScgagJv7YFEhFjsxItBSHmLy4
Message-ID: <CA+V-a8vikSkbxjoE+Wq+jZ1uQjtbu2VFttHEMGXHkWqqcqf6Lg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 20/24] net: dsa: rzn1-a5psw: Get lookup table
 size from OF data
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 9:44=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 A5PSW has 8192 lookup table entries, whereas the RZ/T2H
> > and RZ/N2H ETHSW have only 4096 entries.
> >
> > Add the lookup table size to struct a5psw_of_data, derive the address
> > mask from it and use it in the FDB and ageing code.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 10 ++++++----
> >   drivers/net/dsa/rzn1_a5psw.h |  4 ++--
> >   2 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index 7e9bc252d92a..c0c1f45852da 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -311,18 +311,19 @@ static void a5psw_phylink_mac_link_up(struct phyl=
ink_config *config,
> >   static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int =
msecs)
> >   {
> >       struct a5psw *a5psw =3D ds->priv;
> > +     unsigned int entries =3D a5psw->of_data->lk_table_entries;
> >       unsigned long rate;
> >       u64 max, tmp;
> >       u32 agetime;
> >
> >       rate =3D clk_get_rate(a5psw->clk);
> > -     max =3D div64_ul(((u64)A5PSW_LK_AGETIME_MASK * A5PSW_TABLE_ENTRIE=
S * 1024),
> > +     max =3D div64_ul(((u64)A5PSW_LK_AGETIME_MASK * entries * 1024),
> >                      rate) * 1000;
> >       if (msecs > max)
> >               return -EINVAL;
> >
> >       tmp =3D div_u64(rate, MSEC_PER_SEC);
> > -     agetime =3D div_u64(msecs * tmp, 1024 * A5PSW_TABLE_ENTRIES);
> > +     agetime =3D div_u64(msecs * tmp, 1024 * entries);
> >
> >       a5psw_reg_writel(a5psw, A5PSW_LK_AGETIME, agetime);
> >
> > @@ -511,7 +512,7 @@ static int a5psw_lk_execute_lookup(struct a5psw *a5=
psw, union lk_data *lk_data,
> >       if (ret)
> >               return ret;
> >
> > -     *entry =3D ctrl & A5PSW_LK_ADDR_CTRL_ADDRESS;
> > +     *entry =3D ctrl & (a5psw->of_data->lk_table_entries - 1);
> >
> >       return 0;
> >   }
> > @@ -638,7 +639,7 @@ static int a5psw_port_fdb_dump(struct dsa_switch *d=
s, int port,
> >
> >       mutex_lock(&a5psw->lk_lock);
> >
> > -     for (i =3D 0; i < A5PSW_TABLE_ENTRIES; i++) {
> > +     for (i =3D 0; i < a5psw->of_data->lk_table_entries; i++) {
> >               reg =3D A5PSW_LK_ADDR_CTRL_READ | A5PSW_LK_ADDR_CTRL_WAIT=
 | i;
> >
> >               ret =3D a5psw_lk_execute_ctrl(a5psw, &reg);
> > @@ -1357,6 +1358,7 @@ static const struct a5psw_of_data rzn1_of_data =
=3D {
> >       .pattern_ctrl_base =3D 0x3eb0,
> >       .vlan_res_vlanid =3D GENMASK(16, 5),
> >       .vlan_res_portmask =3D GENMASK(4, 0),
> > +     .lk_table_entries =3D 8192,
> >   };
> >
> >   static const struct of_device_id a5psw_of_mtable[] =3D {
> > diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.=
h
> > index 29d205e2331d..fd523fe7bf47 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.h
> > +++ b/drivers/net/dsa/rzn1_a5psw.h
> > @@ -93,7 +93,6 @@
> >   #define A5PSW_LK_ADDR_CTRL_WAIT             BIT(27)
> >   #define A5PSW_LK_ADDR_CTRL_READ             BIT(26)
> >   #define A5PSW_LK_ADDR_CTRL_WRITE    BIT(25)
> > -#define A5PSW_LK_ADDR_CTRL_ADDRESS   GENMASK(12, 0)
> >
> >   #define A5PSW_LK_DATA_LO            0x40C
> >   #define A5PSW_LK_DATA_HI            0x410
> > @@ -210,7 +209,6 @@
> >
> >   #define A5PSW_LK_BUSY_USEC_POLL             10
> >   #define A5PSW_CTRL_TIMEOUT          1000
> > -#define A5PSW_TABLE_ENTRIES          8192
> >
> >   struct fdb_entry {
> >       u8 mac[ETH_ALEN];
> > @@ -241,6 +239,7 @@ union lk_data {
> >    * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern=
 0
> >    * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
> >    * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
> > + * @lk_table_entries: Number of entries in the lookup table (power of =
2)
> >    */
> >   struct a5psw_of_data {
> >       unsigned int nports;
> > @@ -252,6 +251,7 @@ struct a5psw_of_data {
> >       u16 pattern_ctrl_base;
> >       u32 vlan_res_vlanid;
> >       u32 vlan_res_portmask;
> > +     unsigned int lk_table_entries;
> >   };
> >
> >   /**
>
> Hi Prabhakar,
>
> It would probably be better to fold all these commits that adds data
> into bits of data in oa5psw_of_data into two commits: a first one that
> prepares support for RZ/N2 and then a second one that add RZ/N2 support
> itself. I'm not the net maintainer but your series is already quite
> large just for this change so folding the commits make sense rather than
> commitmaxxing.
>
My intention here was to keep changes minimal so that it's easier to
review. Since the fixes patches will go as a separate series, I would
like to keep this as is. Hope thats OK.

Cheers,
Prabhakar
