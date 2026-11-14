Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676924;
	b=x5q6jCTAfYHmi6SL0KnrpIAr++YN8t9yb3AxvC/1vncFa6687IGau2sc/SXtR9OFmyPj
	 VULSvYq45ucyESb+2zlMb2mGXr9Sqg2o49f3tu8X/E+YFtZhtNkfZpjkf6NeKFClg5iBp
	 FUYczD36Zq+JQVtZSafcTORVHgUvq/STJGaPB15/566dzGBhlBbIjXJJpEhWeWx5uArCZ
	 GbUge6odT/EXBuM6/NUVPzOwciZ6Xhvx9dLbL/7wOHZofN18EkuAqRgvWBNraN87p6c6V
	 bxsKUEv/VBWQxF8NQWwGzIA4hmdRxswR2yXlriXNlQDtULAd/6ydmWo0byQryHdKRAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
	b=RiquJ/lQI5Trf9wFrxM5kKxKlIJQ9F8/jwQ96gL9KGVy7qOab3FoFstaqNCmfeS8SR9a
	 dDRlwBwMJzq3dbGUjQtDwmTpQjC4gQqrndHVe/CilBebJRleiQ2HTAh4URz1Z9I6QEi9Q
	 LFCvtFbui1CKRznpFE8Aw8LO+BcocURq8B+8TtlRGv1mTVppdDFXgDyeqlMTbIXbAI8MJ
	 /PBfWGdOikk3gM6eVk3Y7Z5ScTIn6DkAaTANR2qkgebQxQbNTqojwgl7lR7wQ55E+UT4+
	 x2GieIv8zNoCssA/K2cagFI7PocpphDkqrD8te39SQ+gXMs5h89ZyJwUvHkgrhrbGHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XXp/MagJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF6606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 17:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXp/MagJ
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-86156cf8a7eso2675629a34.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676922; cv=none;
        d=google.com; s=arc-20260327;
        b=si0tVbRLLrtQHPQTwA3cPIaJKxZ2nBNT4/if8Zto5h1iBnF3pICJTldBXfXqubBSne
         aYS7dtnrTpurrHwBIDfx0+fEO/dqkVlQ9dzSIABSJzln10o6pAqnEv1abY+CgErpw4MV
         jGykSWUU0YIE7Iw+uaTGDHPcq9u/Q6aLcqfMuEFsIeh3dytxLOWVT2UlPnI4GqtHc8FB
         COtf8FF04Z1xvzNoflSdh47T+JI0sYIRf+tpMQKpS4oTNiN9JV29I5wH46Z7/5CEy6Rj
         0A6P0K9Hg0yf7RiuApxF+k4ZQ8hr4H/flfGglI5qx+kd99LuflwV8VI0y4WqxMzhh+g5
         bG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
        fh=2mQ6x3Ft1FiNjVJrxYghLjCzHXq6VPPwsGoMPIfyGxI=;
        b=eiiRRBRjNGZ3MQLf56bxP9srqV8aQ/SyTODnK6AGjEkCDu8y3KkTh6gDBmdB9zFQeO
         b4Dz9lzeLfAv0CUG99TBCz1ZBmWSWDUXBqNWQEp/Ry/zRE4hc2mJYuLhe32CdFtYjM7Q
         e56oLwHEdbynH8NAtW5G/J+BxOsnKjayEAthvvRgJfIQUhitYc+vW5g+ShdBJSQ8ZG8+
         lozzYYbCaM0XD17XFuCnNjueFvb0+WpD4GUglQrlVltcafClUp4nsa7JNmg0S82pLJdK
         6/aH5IQOExS/WmcPfYVXtnWdkgNYe6sjWzpzf+PliRpZB5xa89jahyYDTqoEZoJzk43b
         TIDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676922; x=1795281722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
        b=XXp/MagJ1q3w15vWYVb8uhUnb3rtWUUJZ5FnR0tFsqofzsXOkQRWRm/2tpCGXbQURC
         1Nhg+wKdpfe31bkt/3gf7/WjgmOunWutiW/MciotDR429NgI6zYmKy7PHGl33Q0JDT2N
         xTgrd927pqrn87NMS5Lvg1vHf/Tz1zXSC6Pie5Q/0VJwFpZLFA/Y6JSXvvfQVK+4bCN9
         PQzeLtCo4uiXK6E08q6tOoUR9ILaviuEul1tg1zm4nrrRIrf8ZdJ1Uoti0Td47VBSNGL
         hnU0shwWH+hfPo0OSkeU23GbxZhsEODskWWrUXnhGNcOSOfrdVBN0PapIIi+H+wpAXU5
         2FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676922; x=1795281722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
        b=etiZJ4LKFKK7oe5jhweCloBkUcUEPsgIC0VQC6lFTtnVEhUMUWVAUk4reZa+xQPQ0g
         YzTLZ1mf74yovZSoCiJtQvfvyL/NBs9YMzxCY+qnnZN+GpltaRXJezkJkaA+WERDr+79
         9Nll3b5yCowsbTlcYYl1VJi5d3bHuh2WMUs59k8z4ibYCFYZYAVKWWRMXmG4gtaIieaY
         rPRlWu5cQVHroIx0ZlAENkBxaXthq8A5XucdG8Z4iuB4MBZ8mpAS2OZ+bz49tV5Y1B9o
         R+kshGVYNPgMsLfp44aeoLJ1BckUgWTzF4c+Rnwb845KZd15ufWR9hHdsGLKtTE55CHu
         OXig==
X-Forwarded-Encrypted: i=1; AL+hErEev/nfo3J8Z424wijy/itEi5bxVQjDQY0QEVLlJC2zdZteH5bg4vKSXbYLzJo+XWYeacho888=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SsCX4ampLmpJS2ICrM1Qo71sQhrwiGf/q+aLK3UN3uqCTEipP
	Eu8dOzIp8BGPBUl0zjLFMCT24WP3H3h2D1YVI5N7FbqFij4wlc9gWi1jou1LLQ+J+KNiXb0mPZw
	xkANfLeN/8idUh/cLU4NafcMNXB9mhPmkrWDUwAYTkCC8WyE=
X-Gm-Gg: AYBFou0fDgKkaaoQk6ukZRipS0zENlSr+qEVWalKq5ehFCysd1D/sBpyVJG6YQEklYs
	ORBcMFCNIK3Sx1bB6DmoHPnPGHQw1R1KEzFcgG3Y/kdzILgTxdC9rNqCcGW5PVIKYTXK9cSwQA0
	PTaa4hqH+UvAtsKWGx95XuhpOZAQv8wJi8TX7foFydZYbOa7aPQG+k5/YNoxp1QLI7w8E+w5HU8
	QNTC59KXzmMyTB7OTZPz0FqfKg0fXGPCXmjhgO282b9PlnRDa1FjOm8E/qYffzzIQ3t1ravan3c
	wc0wtndcjkrgyJyzxL2WxvEFbJW81kX+2BCSXQRuEKEiioNOwQwBIjBute0plVEzYYmSWBxzqZr
	GNLYFpFiOTBqiqx3Yz/5SOoQ1RCD0OGypbrrNXmGVS+5daIpy96pn0ycl4nbZIwX+ghDq1xd8Yd
	wfWy+f01O8zAHQKA==
X-Received: by 2002:a05:6808:190a:b0:53c:4502:971d with SMTP id
 5614622812f47-56cd88e794emr6967709b6e.36.1794676921875; Sat, 14 Nov 2026
 09:22:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9b73858d-fc09-4988-8bab-fd7b88db9412@yahoo.com>
 <39e46930-0d24-46d6-8861-5dd309bb7640@yahoo.com> <1e8da5e3-0d1c-4ce6-bb3c-4b9b7a5789a6@c127.dev>
 <f84cfedb-b551-4316-8d2b-4d6e06fc151b@yahoo.com> <b68807e4-1470-4f4b-8975-e8a70dffd011@c127.dev>
 <20261111152158.467255-1-kuncy7@gmail.com>
In-Reply-To: <20261111152158.467255-1-kuncy7@gmail.com>
From: gabon pivovich <gabonpivovich@gmail.com>
Date: Sat, 14 Nov 2026 20:21:50 +0300
X-Gm-Features: AclHuK-dmGD1oYDEecnkca6jhtE7I1ej1lLyGD1r05U1Rlwmm1WEtVbhDOg3YL8
Message-ID: <CAOaAmLwEBfKsx3K=dr5nBPmJ9keHAvAOSgp7iLEciKH20pcSdw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 08/11] net: dsa: realtek: rtl8365mb: re-latch
 the family D SerDes
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: Johan Alvarado <contact@c127.dev>, Mieczyslaw Nalewaj <namiltd@yahoo.com>, alvin.sipraga@analog.com, 
	linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, gusfmora@gmail.com, 
	fabianotassotti@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 Johan Alvarado wrote:
> Oleg, could you check this on the AX55 before the first ifup of the
> conduit? A single register read tells:
>
>   devmem 0x98218    # UNIPHY MISC2: 0x70 =3D SGMII, 0x50 =3D SGMII+
[...]
> Oleg, if the AX55 can take it, a reboot loop with that commit and
> without patch 8 would settle this.

Hi Johan, Mieczyslaw, Alvin,

I tested this on my Archer AX55 v1 (IPQ5018 + RTL8367S-VB, family D,
CPU port 6 at 2500base-x, booting from NAND).

Tree: OpenWrt main (24c13d794c) with the family D series from
PR #19644 (v10-pre4), without the re-latch patch and without the
conduit ordering patch, plus your commit 50e49862d2ba on top.

MISC2 register:
- In U-Boot (stock TP-Link bootloader): 0x70, so the bootloader hands
  the UNIPHY over in SGMII here too.
- In Linux with your commit it reads 0x50 already in preinit. I could
  not catch the state before the first open from Linux, because
  OpenWrt preinit brings eth0 up at about 7.0 s.

Timing in the log: the switch configures its CPU port at about 4.86 s,
eth0 at about 7.0 s, the same two second gap you described.

Reboot loop: 16 boots, 16 good, 0 broken. On every boot the router
pinged a PC on a LAN port, the switch CPU port counted received
octets, and FCS and symbol errors stayed at 0.

I did not run the same loop on this tree without your commit.

Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com> # Archer AX55 v1, RTL836=
7S-VB

Best regards,
Oleg


=D1=81=D1=80, 11 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 18:2=
2, Stanislaw Pal <kuncy7@gmail.com>:
>
> Hi Johan,
>
> On Tue, Nov 10, 2026 at 12:49:04AM -0500, Johan Alvarado wrote:
> > Oleg, could you check this on the AX55 before the first ifup of the
> > conduit? A single register read tells:
> >
> >   devmem 0x98218    # UNIPHY MISC2: 0x70 =3D SGMII, 0x50 =3D SGMII+
>
> I can't answer for Oleg's unit. Mine is an Archer AX55 v1 with an
> RTL8367S, family C like your MR80X v2, so this is a second family C
> board, not the family D answer.
>
> That image has no /dev/mem, so I printed MISC2 and MODE_CTRL from
> qca-uniphy instead: at probe, around your preconfig, and before and
> after every pcs_config(). On every boot, warm and cold, probe reads
> MISC2 0x70 and MODE_CTRL 0x421. Without your commit, SGMII+ (0x50,
> 0x821) shows up at the first pcs_config(), at about 7.4 s, while the
> switch configures 2500base-x at about 5.0 s.
>
> One note on the values. In the pcs-qca-uniphy table, MISC2[6:4] =3D 7
> (0x70) is the USXGMII value; SGMII is 0x30 and SGMII+ is 0x50, as
> FlyFish-go pointed out on an RC3000 v3 [1]. MODE_CTRL says the same as
> your reading, though: 0x421 has SGMII_MODE (bit 10) set and 0x821 has
> SGPLUS_MODE (bit 11). So the hand-over is SGMII either way, and 0x70 in
> MISC2 is just not what tells it. On his board, MISC2 reads 0x70 after
> the boot loader's block reset when U-Boot runs no network command, and
> 0x30 after a U-Boot ping.
>
> Reboot loop on our OpenWrt tree (6.18, dwmac-ipq5018 + qca-uniphy), with
> the OpenWrt ordering patch removed in both images. A boot counts as
> broken on ping loss to a host on lan1, or FCS errors or PAUSE frames on
> CPU port 6.
>
> - Without your commit: 2 of 15 broken.
>   - In one, the switch sent PAUSE frames to the CPU (1368 on port 6) and
>     to lan1, and almost nothing got through. No FCS errors.
>   - In the other, frames from lan1 reached the CPU, but nothing from the
>     CPU went out on lan1, although port 6 ifInOctets kept counting. No
>     FCS errors, no PAUSE frames.
>   In our tree the conduit is closed and opened again at about 26 s
>   (pcs_config() runs again, the UNIPHY already in SGMII+), and that
>   didn't cure either boot. This fits your note that a re-sequence on the
>   SoC side does not help.
>
> - With your commit: 0 of 23 broken (20 reboots, 3 power cycles). The
>   preconfig puts the UNIPHY in SGMII+ at about 2.1 s, 3.2-3.3 s before
>   the switch configures its port, and pcs_config() at open finds the
>   mode already set.
>
> 2 of 15 against 0 of 23 is weak on its own, but it points the same way
> as your 18 of 51 against 0 of 32. In the same thread [1], FlyFish-go ran
> the RC3000 v3 (RTL8367S, family C) at 2500base-x with only the OpenWrt
> ordering patch removed: 4 of 7 cold boots broken, against 0 of 5 with
> it. In every broken boot the SoC-to-switch direction was the one that
> failed.
>
> I have put the same result on your OpenWrt PR [2].
>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com> # Archer AX55 v1
>
> [1] https://github.com/kuncy7/openwrt-nss-edma/pull/73#issuecomment-67964=
51511
> [2] https://github.com/openwrt/openwrt/pull/26597
>
> Best regards,
> Stanislaw
