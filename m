Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966534;
	b=m4F34rUMgVlBiocQML/ojU5g6bTUAlbw7/nZJxyjuTX5NH8/vR8ffLf5czmfIbqU7THr
	 amOhyRmBPjtwbu0QY5bJaKYvDTZB7fTGMZX96qGIQ8MomU1fCE4OOBCIVvxRDWq2pdfeb
	 /++9zzVTPwBdxYAUVJNttrYfsCfweghX0y74FuGcO9ZWw3fNFCsirI4Ot56Td7WSZdcrm
	 FyflRPiFJIz84Ezeduebs4c/c0P/gjnQlaxhY5iRbOTjBU1P3MhLU9fApgXxW/6Z5x0Qo
	 lMYmugwgaF+QXmj0uj5eeGRxo6C1c3N1nlRAqgwY5q/kVHjL4WTg6jY9gTGKRZ9CDbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
	b=Yziix9Yyp0fDoSJGXJ4xX03RFoeWkYr/Jw3N0OR3wtHNQ2qxnzlWQN8GeF/tUC2OMTU1
	 No68fECOxnlxyuaQ9RRBcgdSR+i2ETWCddc5p6nRl/VZUJEU8YudRObxRJyVncgKaVHb1
	 UaDLDeIem1MXH+eh+Z7QLhnFK//Z19VIAOVwXsn3N1dCZb6T9BYA/1TtZREY3Pwqs4aJ0
	 BOQmUdHOwCAU4YoESTpWebbFUX+dtNXOJMStTq2WXCt/lM95FsvW6p4rsqqzPrqAX0isq
	 uMnJiPrTdv0XELAI11OOfHZv9Q/BFxo9E+FRFJTWxF7Q2Ai8Gj+FwaRvejM+cPptL9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+05DTut;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7EE606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+05DTut
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so377619d50.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:48:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794966532; cv=none;
        d=google.com; s=arc-20260327;
        b=mmZsfXGvwFDNYKIwhFT5EqpeVwd+5yd2mSw8PFRBhSfmJWxMQlfY10orPg1PUbM6zD
         xM1MlKEl1/QXhbv+Pqt35UBy9AegMIhMF1CKcRExhfrGASeprPg+fhxvzsjlkc8Jg6Nw
         Lu3kmvwG9RIbF1XCm9MV8OFUArAQo5kIC2P1qMOOR//S0jh07E72Iiz/BYJYxkg09Yu/
         x61YtvXVe8vjSIQK1zuOcscPFKjtMjAXD4v/RpIBEM9j4/Yt2hD+mKb6tzye+CLwBUHV
         eu+YDK8bn08MiLF6UmUFAG5P/JoMh3twn/fB3UHRGZoJvx3UiS/Ml3htnvVxlIqxvQ/U
         XbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
        fh=OSj1d113bmCfZ+Xs3PI8mPo/sm04NjXCZ+a8bT6iIBk=;
        b=gnLkv6ul5YHj2BGWJmDMCX3QMpS55OyvHyg6KFBhKxiWdnCn167tMGwHm4nw+Pxc9g
         TM1VqgWxd3PayrS0lG/OAlsKoWXq5oAJNpw0ChpDJ9fEUdQwlDwgF8fW8vQAXrdAE5cd
         3x/i2RtTbALh9oBn7uVUKeIVN4za/f2NERcFYhZW+eFk75wUvbZRbGAA+LdqQNSt5FX8
         g6H4cHpXwAm+MqLy31j8izLtw+1uz0VR75AXnIl2m6e84tlX2ml8R2UMBH/2Wr0jx5s9
         lNoB0nII5YR4oKMKLg1evVLuaKz1CGmPVy8KF7ZDotXAuwvHDNI86AfDFf3yUQHN0qAy
         cMAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966532; x=1795571332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
        b=a+05DTutJvxia7IoTDjNo1VYDRBwwwjVqFXekgTEedFWdaZYydMQW+429fNheV06C6
         P2ZYpVEElqd2qFIqiIpUcCRx+MJv5rqfL0ES99/kH6L6QqH0kawf89FzRLFKB+wI0+Ds
         HHE4y7IrIdv//eLLu21CiojY/DM0wCH/0yI7dCBvDCOIDNeMHLkr7NRYmyEzcSkcY8S8
         NZAtkmaf/rMU+r5ltV/c5BQoR6vMIEFV1Edyxmv8remvG5z8SA2U6kPDzNI1sqDZTE/f
         i2v2R4sUxu+37FStQRlTzg4yDiC7WjtHuoeosX53ZNpMkFHXiHZULBQzYVHPodSkWCqu
         E57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966532; x=1795571332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
        b=JjgB2fHYvZAmbCklnHZFvhKYppWeSduW/b3I4w2seR9mp2HEgnCM/6o28gjQCjYh2O
         gczHeidrAF64b8g5GT95AN0VpOfywG7c3GkTXS5XMkDcheFH0aVsuFc/k1WNLdXMEd+o
         5xztx5KIfeLzc/6QG3aW5GXMTIC7mW3ze9NnKibCY71aKmwLni1m2+WJ7+9kNQshfyUf
         T1Ab8hF9ExGToEgsmBug7bWWzC/P6JLpRWb9q9GxEaMYc6t3beNp8VJJqABQ8NBBrgw3
         kWNYgjYI1xH5JLLhroYDtF9sbGBFlUuKq+oKxGGe+4Rrxg3RnfsFygHvtxXexgD+Dqh1
         tXxQ==
X-Forwarded-Encrypted: i=1; AL+hErHRhqbo7yA2Upu1TzWqd0v2srKoWOpSBY64amYMSDllq9f46pO15bmv0qH2t1Rp5q+QUEJXVgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vyVZwXBJEZiCiQX3PKCOvx7TZvU4klDMjX/cGYELZJYwIYiD4
	QJFobVnd6zraFe8HIQHMID/9Xt7Mj0b/XyLJyrAEVUz5YOFUxGPRRQCjBCF0WWsLfWpKY8uu7TG
	9Uucvx7EXtnbYiFFgJbB526EAUuk4o04=
X-Gm-Gg: AZFdTZdWz1eYiDFDmsBPotci4Pym0Z9SvX9YydnLHeo1lYEDEH52gNV/aMo5QErgIoe
	NrZ0dZobIL6Iejgjiw1FuXKHkRQZhlul2yBowcyZqXlhpKgOOsQyX/bdzZsLo1nB7Po9bZUX4tk
	KCbjUh6e1pY6eowbCwa4X38ZCq129Yr6mvI1IymADDFyFcEjYUP/dWdFWTkiK/V2+KPnMTKWJTJ
	/Fbw7/smBHsmMdsdtrwtzrhyC3yEuqyCFdF7ua5P/VEabiVlhEJUGes5EJx+ThfpEFlGdEdR4lk
	/OIMZAPMqksLKQmQUgGDXWPnN+JR7bQH4mhV89TBW/84DUkClfUpt2Q5wWvz5/A/fqKYFM9hE6k
	vqjEkMLwfVIuKAVt2q2svvGCFAF3fpWTQwH5/
X-Received: by 2002:a53:c044:0:10b0:67d:b299:df4c with SMTP id
 956f58d0204a3-67dd3fed55bmr447237d50.79.1794966532677; Tue, 17 Nov 2026
 17:48:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
 <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com> <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
In-Reply-To: <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Tue, 17 Nov 2026 22:48:40 -0300
X-Gm-Features: AclHuK9OfDXHhJvhOW-znqZivtMI1pbd9fi69T_7Y39jiuS3D1c5vGLLPG7v_NM
Message-ID: <CAK+kzgwVSG4CBv8NQvQaqyr__BZbd860EDfEMoZU5JdFCYhtTw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Linus Walleij <linusw@kernel.org>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On a TP-Link EX511 v2 (RTL8367S-VB, CPU port 6 over 1G SGMII to an
IPQ5018), on 6.18.44 with v11 applied as is, I tested the live
vlan_filtering toggle this patch now handles. Two user ports were
bridged with the uplink, two others were in network namespaces as
hosts, with loopback cables in between, and the toggle was done with
"ip link set ... type bridge vlan_filtering", without touching the
VLANs:

- 1 -> 0 with the VLAN in place: after a fast age the hosts are learned
  without a VID (SVL). A static entry with VID 0 on the ingress port
  drops the frames, and on the other bridge port it steers them there
  only. A group entry with VID 0 restricts the group. With v10 the VLAN
  stayed IVL until its VID was deleted and added again.
- VID deleted and added while not filtering (so it is written SVL),
  then 0 -> 1 without touching it: the hosts are learned with the VID
  again and unicast with learning on works. A static entry with the VID
  on the wrong port replaces the learned one and cuts the traffic, and a
  group entry with the VID restricts the group. With v10 the VLAN stayed
  SVL in that case.

One thing to note: each toggle that flipped the switch-wide state took
about 5.4 s here (5420, 5450 and 5390 ms for the ip link command),
presumably the scan of all 4K entries over MDIO. Management over the
same bridge stayed up and no warnings were logged, but scanning only the
VIDs in use would make it much shorter.

The rest of the series passes our regression run on this board as with
v10: VLAN-aware and VLAN-unaware bridges, PVIDs, isolation, FDB and MDB
entries, flooding flags, load, no driver warnings or port errors.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo

Em ter., 17 de nov. de 2026 =C3=A0s 05:23, Linus Walleij
<linusw@kernel.org> escreveu:
>
> On Tue, Nov 17, 2026 at 8:39=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo=
.com> wrote:
>
> > The hardware structure of 4K VLAN table entries has changed between
> > silicon families. Family D's CVLAN entry is two 16-bit words rather
> > than three: there is no third word extending member/untag past bit 7,
> > and no priority/meter fields at all. The FID field is restricted to a
> > narrower 2-bit width. The chip itself supports both IVL and SVL.
> >
> > IVL_EN (bit 3, versus bit 14 on family C) follows vlan4k->ivl_en. On
> > family D, rtl8365mb_vlan_4k_port_set() enables it while any user port
> > has VLAN filtering enabled (dsa_port_is_vlan_filtering()), so that
> > static and learned FDB/MDB entries use the same key. Family C keeps IVL
> > always enabled, as before.
> >
> > When a vlan_filtering change flips this switch-wide state,
> > rtl8365mb_d_vlan_4k_refresh_ivl() updates IVL_EN across the active 4K
> > entries, so existing VLANs, including those programmed before filtering
> > was enabled, switch between SVL and IVL immediately. Changes that leave
> > the state as it is do not touch the table, as the update reads every
> > entry.
> >
> > Reusing the three-word family C layout on family D would read a third
> > word that does not exist as a distinct table word on family D's die.
> > Whatever data happens to be in that register would be folded into
> > member/untag bits [10:8] on read, and written back on every
> > read-modify-write cycle in rtl8365mb_vlan_4k_port_set(). Give family D
> > its own two-word pack/unpack instead: add rtl8365mb_d_vlan_4k_read() an=
d
> > rtl8365mb_d_vlan_4k_write(). The shared code reaches them through the
> > vlan_4k_read and vlan_4k_write pointers in struct rtl8365mb_family_info=
,
> > so the pack/unpack code needs no is_d() check.
> >
> > The two-word layout matches the vendor switch API for this chip
> > family, which writes only 0x0510/0x0511 for a CVLAN entry.
> >
> > Nothing points to them until the family D info is added together with
> > the chip table entry in the last patch. Until then they are not static
> > and are declared in rtl8365mb_vlan.h, so that the build does not warn
> > about unused functions.
> >
> > Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
>
> Looks Good To Me (TM)
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij
