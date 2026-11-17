Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903828;
	b=uvEKdlq1XpMUq54oF9NW3S/9i+m5Mgx8ALNSgb7wGX4RZZilQ580YY+UkH+iw97CAIRW
	 fiBYCjckAlCBaCjiOqplgWMo5DccqbScmBcdLkAuxK++7hXe4i5MOISr3GmkvZWhXupzg
	 xk1pKWcH+eRawn7yYZh0WIDporoc9Gh7O2jtMdZRM8o/Ljhd1qpgZiY48GZCgsftToYjz
	 PaVCEhKSGMq5zIjw2Zpv7rly+jqFCnUnNZ6iWuapbyYlpeuYBiGU4sf+sBEBXY0VdvCcP
	 xN9ZJw/2etG2Yj+oyOUuuMJEMnastaNDuXJAyPpPl+oSNSxb8mzhirje6HLlD+zY6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903828;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JufBFXEppaAHOVRYjKH4bmMIJfDMkrcteD8947cV7oA=;
	b=fap+NHdR49lZ3E7ZSYSHvIaEzsqFjHoeX+XS1MLRHUtYtfpPpRsvf3r5KkZpohA491sz
	 uYk/BNHogzhC+wB0YRx8wGn6wjl2/AhPXY1jiErJ/5cYmk+Oao3i0H+IUVP4kFmshD+6h
	 zdcXOt7BNMAiFuj4Yom7MtnsU1rvAUeWR8JTIPXQEZx0dK916+vgXuEnoriB7qRgFrJwL
	 GiejDXmFCVHPtq14arg2x1gs9qzfE6dH428zi6y/WvM32NcE5B0i/0JiYvP+fb3qRo9DF
	 jAJiMl07gd4jo6+lpYRrCuFx3/VaZoENVpsrl+QqGFZFb4S+bweHT1NC1iwR/n2YjfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5YgioSY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236AB606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5YgioSY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B124B1F000CC
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903827;
	bh=JufBFXEppaAHOVRYjKH4bmMIJfDMkrcteD8947cV7oA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c5YgioSY+ksnhJMdq0LObak4F30DHkk+sQGNoaip+dj7IAMnMaVjaA5SUAY17RSZL
	 Gp1buxyWU70zUaxoWBLhS6t7YCMKFJ8kzt4gt6+UP4pi5Tq7o5ZkMcPzj3IeUkzYPy
	 SZ1WB1Y/WrmpFPUWlozcnHINHo9Iunmg16TetT35fcZJ2Mi8xW/CcERzvfSX/uQRwN
	 cRS5heaCFhOz5Jw+zGot3lhTnBJCiDAikEmPOXMZkzL7XrqI/IaEyHVyYRxffOKjDi
	 W3jrV3T8h8cx80ZdTJURiJqdNQJA7riw/4PzrPXui7pRFp3+MPwTGBFoEGEUP2FN6x
	 t4Yk4/FvquQZQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so719109e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHWzpa+75G4VGCZfbzlgyE6ct63bJg5XL5omU8kzR50i8Pld5GyY531dpP6H0NudLZrRRSvo1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kCqopTvYR6/2Xeyls9F7PpLmB1z8SBZjRJotNXIIJrQyN7Eh0
	8r0Ejq204U4vf9ydD0KuxOV7ZkFG2emfAgXA0aHNZcJo8+oLkx017YCv5QhViV76TWcR/0W1pro
	fSHSHL7gwX+RjAS2tnBtiCVgf8c/rbQ4=
X-Received: by 2002:ac2:4e05:0:b0:5c1:4b7a:958a with SMTP id
 2adb3069b0e04-5c1a0deb485mr655915e87.7.1794903826445; Tue, 17 Nov 2026
 00:23:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com> <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com>
In-Reply-To: <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:23:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
X-Gm-Features: Aa3M54oLsBDhpgIbksBhOqzS7n8BEIKk1IqnF7iLZrxpvCBuVRvBTCudDX16xgM
Message-ID: <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:39=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> The hardware structure of 4K VLAN table entries has changed between
> silicon families. Family D's CVLAN entry is two 16-bit words rather
> than three: there is no third word extending member/untag past bit 7,
> and no priority/meter fields at all. The FID field is restricted to a
> narrower 2-bit width. The chip itself supports both IVL and SVL.
>
> IVL_EN (bit 3, versus bit 14 on family C) follows vlan4k->ivl_en. On
> family D, rtl8365mb_vlan_4k_port_set() enables it while any user port
> has VLAN filtering enabled (dsa_port_is_vlan_filtering()), so that
> static and learned FDB/MDB entries use the same key. Family C keeps IVL
> always enabled, as before.
>
> When a vlan_filtering change flips this switch-wide state,
> rtl8365mb_d_vlan_4k_refresh_ivl() updates IVL_EN across the active 4K
> entries, so existing VLANs, including those programmed before filtering
> was enabled, switch between SVL and IVL immediately. Changes that leave
> the state as it is do not touch the table, as the update reads every
> entry.
>
> Reusing the three-word family C layout on family D would read a third
> word that does not exist as a distinct table word on family D's die.
> Whatever data happens to be in that register would be folded into
> member/untag bits [10:8] on read, and written back on every
> read-modify-write cycle in rtl8365mb_vlan_4k_port_set(). Give family D
> its own two-word pack/unpack instead: add rtl8365mb_d_vlan_4k_read() and
> rtl8365mb_d_vlan_4k_write(). The shared code reaches them through the
> vlan_4k_read and vlan_4k_write pointers in struct rtl8365mb_family_info,
> so the pack/unpack code needs no is_d() check.
>
> The two-word layout matches the vendor switch API for this chip
> family, which writes only 0x0510/0x0511 for a CVLAN entry.
>
> Nothing points to them until the family D info is added together with
> the chip table entry in the last patch. Until then they are not static
> and are declared in rtl8365mb_vlan.h, so that the build does not warn
> about unused functions.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Looks Good To Me (TM)
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
