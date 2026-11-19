Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069286;
	b=smQZH1Y1L85gIrugzIVJ7sWL0Jm9g26QatPGBo5kdibWeXK4akdekvPcWENLq3MaX34u
	 Co2nYdg3NIJkJ/MvLH0ZKNaRndSN0seyhoLKqgh5n61eDq+oY/7JhpJCT4Kg1ItuBiM3J
	 p+gMxk2NX6XkRQrOqH7P/WJ6nEiXY7OrIcZ7xatkTPMJJaVMyRssZkAIT5JWolm2NTaX2
	 jGCpHc1yCDnx5G8wuDuJqcS9tWWV4ei60V2i6Kn+/MZ9Kk92qywtbQOigaL6P2hxiiGTI
	 hD8fh+rnNUptEmZieEg66BziHfdqltyRa0EBs6nVJtjcxHXnBe8cgrhP50suydNeI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069286;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=e8bV8mZNPv72BEjVa27YKHF5PibJk4k58MTQ78+dY3I=;
	b=KZ7xxW2uF6CFUtd9wOrDyrce6Jb4gWVCuTeWBg4J4d6bDCvZeAhe1UaPFT6ZtvZZ6qzb
	 LTJ7LFJ+uuLYRWprmaiQ9X7p0qkgDJ9CvKr7sUbtuSkWTC3aP2XOr/lerkTV9zGX/cKui
	 TiuUUzrrb8Y46HsYkWxWErcFCpoBaJF+xO5bV89hQgbnek4/FxAVG7Q/W3/guId4851vM
	 xqMH0DhACp3jqlZJNwLMkES6qPw7bWztFU3BMvMz6jUg3BJjfPLZf37htUs33BQ4uP9vA
	 P1Keq38Bny39d7Yeb9Yu0tU/C3dKUP0XlZF7sDBaX4QchZKb+pjJU2nhSEkj97KosMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=LIPd85QV;
	arc=none smtp.remote-ip=66.163.186.204
Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC360A2605
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2AC360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=LIPd85QV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795069284; bh=e8bV8mZNPv72BEjVa27YKHF5PibJk4k58MTQ78+dY3I=; h=Date:Subject:From:To:Cc:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=LIPd85QVK9Ht23Y8sJgoPj/DNgdJ3k95qnarE5FZOlt9Nc+7qUHSYdvIhFpfQROFGnRZ2DFK5SlX8StOIrxl7vYPzBnUw9UcZZzWz6cIsZarpBd+v8i6eDjQNvS9PXvwngeAgiS3c6glQCtgQeG8FoGqL4dxPilNKv7rkEoDA1c/dqMMQDRWh8fdgqt/XT8V+IkCngWzAtzaPYpsrwz1RV+5tE9pIx6W70zAIDepXjvoLXCpsLzRfl9CZSmcW+xDadRRtpKr5xWO89d9Uvk4DAEuSEVotuhgMnILYDHZiLm5UfeJj16JBu/uQ/pC2eC51KHzcXTCSVXKriRcFn2gKw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795069284; bh=pOkv8uwHf3RepmUoM5aWeTBX14THJ8SnEx58vDdLCal=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=n7GVA8pBnHDjEd1Mpb4UfoVCCMuCNTufuutuXBn9eT6jKjLXIn9LMjWiQCOp++rvgSzPeqDNdmUlo3DN086ZKQ9PsBqq8KoHR6xLtjIRNSjRd15XpedrCauQT8f9liKf7oRiSRSlb+bg4H0+vk2q/EhCZeLeokmk0kM/PVaeS+f2oq6pj+umZ8Y1j2iBnuoNphNB3Ejm7uWLqitMWroMUhF2TKMhOSjwR72eoFe+dlPCpP9MJcpGRbKyO5VuNKjbRO9YfbVH08tbppqCx3Q3eKg3gHaI8XDUMLlTNYi6Nz/+cszJYnZ4mz4T64/r2zf4jSGN63ASqu+Zv/AqL6Q7iQ==
X-YMail-OSG: Sv9U0yYVM1mRr5oTfBdh_qtqE1j2WLJzbCSQaPyoWPLOE7vdcQtrfhzr1jyEuG8
 FzUneLPjNkHQ0zMWBNTpScPMVu0qY1QpjZm2hXK8e3Yi3Fyq0JKFo0SluYuu7nO7MQaxaxL8nlpv
 6y47rgZWk4wJZq4nYS4w5eqkiit5PcJiDSk.RQESR1_AwtyCrdjviU2Q_vBpk8G5PRU.HkYKabp1
 vOC70Pa9ATgofZCw15Z_d8LnHhQD.E_vRPYatYn.QP9JYxs4GmqLdjR_hlRG9m6krxTt3.bzAJUv
 m_eRLDopySyHoyYL0_CEaWbkeBmD2bbvdHBkM6m9MuLoRZRW4heMd2ddvineL9PM9bC_ekS6sV77
 PTZef3YwhUIeubM8ZCL4xunXfEUNouHVws8gcygNeq4piQJASVbVBK3qrVCxaj.jYXHrXp2uwGPo
 465V8Tj1gmOll.PPvNll9eNILH7aaGEPQDXewa.QtWEn4bpFfcEZttVm6gASnsX1nEf8ZHspOpq_
 _q64KldAzZ8BIa5g7GPJDUfkAfyM3wEg0qCovZV1MqvK4prqyJ_gCq5_w8AgcBGCEsxktHbIpgHH
 T6o9xeb.H.xmynRvwtAsZ6SBCSz1Qh7ED7Ry2x7RVlpxjxK_9cMvvv4qNDl6MdhkfW952v1VrRsq
 0oHPDLaumjyR_bXUmOD6.myyAeVyvd8ysVz.3XRQ6tczUuTy8LjwcjjE3wLjviWkmacu6l8QGCPS
 mTyhU8qIMB1CkbyM3y5qutjAZlbSzAdjs0.lwWZWcC9TFVUwiEeZNAUX4TrgX9kN7Gx1JPHEA_f8
 _XZXQJOcHj5PWiHV5Qhu7sMi3sjDbDBVxz_.uYBX1Hj_2Uv4aIGeysO2wjKw11wxY6nSfBQQ1e44
 DBSOd9OJOwW5Y3ooHVeJX3AnH5a0cbxVxSXlB5BiR2LGDcOfoLEpclGLL9VSBt3ACsmgYqvlbk97
 gwOd7aR4VrEHJSKe3sFv1ZqGuFRoxe50gxCSHF5FN4qbKfs_dshLRLJqcUEZgM35ea7rvahMF.ZA
 ne6Aja2DrFwMdB3E91JcIw0SYMtCqQ1GNbH65WQdhCdAt.PBPto7SQ6IOLgPVlwyj0iUmfmdj0yg
 uERFp1kXCgl7pajIIlIInSxdSsvvsZiynZwqf9VLSrEpQqhqennQzmKeq0vTgQosb8FgYJqz6qsG
 njC5ueVi0WDTvgY6LwY_CXPhr_0BO0U5w4.Noehh_yLoQKFECPNIEj8rWPk7x3xJLgc_E6Ou_4Pa
 APpoGJQOjKL4sFNpP.R3nDD3GC_1og20jsFfM7A1iLJXv1Zk0kXnSZAr6hmS99n9ovQs80w4JAHw
 iF43l12tvNLjAJlF2GrNje5gFDEy4BY7C0PEgloTKkHgW_YV5xavqu_ebXidPEmn8fEo23iEBSeO
 zVvX2gwfGE4h7Hdg4qJx.W9pcVMWJU8syhS1nnsXHICW93RvjRZXTGPP.nNv8D4xAs8uvwDaMwEZ
 b.s3aRIXAM1udjKe7H0f4y_cSpEa.Y1kq84Z5rMWEEou7W83Qz61U5vAtZOzfpOrbwENtlVXwyeG
 asY9OE_bpT3ptQpDb6N74MzMwAaSzkPEvUnlUMI64.Pwc6j4jGqJWUeeqpFo3kCZK98yqb.6qbkA
 sQBVBplFo_V9B535V89_5gWOJ9GgzQfFlTOZqMgz3O5K.h4xIL6xqyvKRThK1PynFT8aLKDCQZDv
 bYuFs7iigyNnpNvD_vf0LnL7gTAW3PC5v6WXGUeUeD270INWD2cqwCBO2KKySjAiSJHAkHe9yI_O
 ih5zaKkLrEoHxEvJ99BH25TVPCwn76XDpJxx2XXPZBRKJUVQ.4ub28_qK4vu1GTZ1ISc4fNliR6L
 6uftyWGpgfnXV8B0lsyjWvlazysG4O02UIGrFu_XxECRSZ9lpl145rntCI8WQ3u15r5wiXToBEMk
 L.KqvivhPGDPUjsBXiKobVZWxgOYBN1153F9WPmN__Itr7nv0awO.KzS0nKa9Gt1MJ6szcxDgZ9S
 XiEC5iUlR5brWYQkGpbdBHfZFmTyXfSI3v4niEDgkUQ583W.KuUzBe2kJrEYwIyC4QGga.f5PV07
 6ySc1ygysPnT7ERd6MiwoZjCGm0Ge3gNUhep78LUOoxkss_LQ4eGlmVfgSjWAliEy10eYO6cIVpA
 RJJLMrcB4W8uXykg926I43aa0utmNfaRXFHxzJj8VpVu0IPGlVe.QaXu8inWjZip2cxtYYE3Lg5D
 IizXeQFcJ.9ha9L5.SLn9lHwP7Wwjj05rv.qXdK0CV.u0KcxOK1kb44Ik5YTDV0mTkP.JUSTBAoG
 Mh0EuElUgUEINMUZEuML_oS8Sb9LfvPlAZeE-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 38964375-c347-44e9-9db9-4bf867d1484d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Thu, 19 Nov 2026 06:21:24 +0000
Received: by hermes--production-ir2-7c4859dc89-nqpvs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 12cacd051e5a2aa1b45be2165f154924;
          Thu, 19 Nov 2026 06:21:22 +0000 (UTC)
Message-ID: <ec7722a0-d308-4903-860b-974beb8fb623@yahoo.com>
Date: Thu, 19 Nov 2026 07:21:18 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 11/12] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: netdev-bot+sashiko@kernel.org
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <ddc3b324-fe93-4c1d-a4da-558c0d6e88f1@yahoo.com>
 <179485535983.3136.18038505829775887634@kernel.org>
 <8aa852f3-86b4-49c9-95a0-e8c51ef0d521@yahoo.com>
Content-Language: pl
In-Reply-To: <8aa852f3-86b4-49c9-95a0-e8c51ef0d521@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.27079 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi,

A follow-up to my reply about point 1 (a private FID for the offloaded
bridge). I could not confirm it from the vendor API and said it needed
hardware experiments. Gustavo Foletto Mora has now measured it on an
RTL8367S-VB (EX511) with a development version that wrote FID 1 into the
VLAN 4K entries of the bridge and used it in the FDB/MDB keys.

What the measurement showed:

 - The chip learns with the FID of the 4K entry the frame is classified
   into (IVL_EN=0), and static entries written with that FID replace the
   learned ones.
 - Standalone ports (PVID 0) do not land in that FID, so for a bridge
   whose ports have a PVID the collision is gone.

Why I still won’t do this in the next series:

 - The FID comes only from a VLAN 4K entry. The default OpenWrt br-lan has
   no VLAN: its ports keep PVID 0, the driver writes no 4K entry for
   VID 0, and the bridge is looked up in FID 0, while the entries are
   written with FID 1. The keys then never match: a static entry no longer
   steers or drops (104 frames out of the uplink for 100 sent, 7 with the
   shared FID 0).
 - With fdb_isolation, DSA installs the standalone ports' addresses as host
   entries in FID 0, which the plain bridge also looks up. Its frames to
   them go to the CPU with offload_fwd_mark set and are not forwarded by
   the software bridge: 0/50 on h1 -> h2, versus 50/50 with the shared FID.

So a private FID fixes the case with a PVID and breaks the more common
one, which is worse than the documented limitation. The next revision
will keep the shared FID 0 and the limitation as described in the commit
message.

A complete solution would give the ports of a VLAN-unaware bridge a
private PVID whose 4K entry carries the bridge FID, as mv88e6xxx does
(MV88E6XXX_VID_BRIDGED / MV88E6XXX_FID_BRIDGED). That needs the PVID to
follow vlan_filtering changes, and the handling of tagged frames with a
VID that has no 4K entry is still unknown, so I would like to do it as a
separate follow-up with testing on hardware.

Best regards,
Mieczyslaw Nalewaj
