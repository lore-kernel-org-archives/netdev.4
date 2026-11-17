Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947446;
	b=Bc6KPutRX4d6NgTABiPYR3YnbyieBfqLS/fepU8D1e8YvE+c/ONw9bLGKxW1cCdhofxD
	 iNLTiiweM5sBSAm+bYBZGwEjr+8DR6r3QWZWL1wkbmqLr0Ew2MmImVIKGaFSfp4R26jx+
	 ZWb/4UGPv/LvTGth2anLGfVU6ueDbH6Zk+2kQ8KHE7/+ox9p/IFgByqnVSN2l8R33ymrK
	 nqyB0FWYMTjoffNMmbquJ7WZoJJyVt6lWusypxUOdtYbTrm97v5cOgqglqg4rWAg3YPvL
	 cf71b116pl6Rycj7zV4T5vKsq/UGGLp7WZAoDw9nhf/FGxaR71jrNTxPgAyaBv+Djew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7vlfoyvYuuWOMdUXO0yz9iikbBUqBGSsrzrulSnQeg4=;
	b=4wEK3Id6lRDAhhY8eoYGCfmYUgzaTwP7KDm3XsTTt8lnRmWmJ8p6G/S8Hpvr2+y6RUSM
	 Z2TIksptvBJ3vDA3OQ4MGZ0OsddWPn22z6NyLlz/B+2mPUDqOunkSnJLEDJIaKoYJ5t19
	 6WDWY1fgAOw/xSn6PIEa42YXif3iH/u9i/DYokrzBLdVsjCwFCCj0t16fPRqjUl0trgWd
	 JICtc3MSILDyKRvAwVsbrAahFVB0yhkoDwA61Tt2TVfUDHMn8eBfFgGWakpbe815gztRv
	 DN6kNzkVSVNSTnNS8p3CyXXOhmBLdV57EClGLvjO3Pc/ZUrUYyYybjPVdexnqODJHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtKLDar+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vnuy+H3L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89487606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89487606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtKLDar+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vnuy+H3L
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ5uw7469993
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7vlfoyvYuuWOMdUXO0yz9iik
	bBUqBGSsrzrulSnQeg4=; b=DtKLDar++gsqHCZUXstn26H6vHhJPLkCPOqy9Y5o
	nG+Zaj4198Gnvhq1qwy/CwEutUbA1dJZZt7F5XNqXJFQTQVDd8p/oULQIEmmv893
	PW9MPPBhYdLIGPJ3FBEEtO8aAvRrDgc03KK2fw+Qbjt7iWtnZtZR4hiV06Ror665
	riXH8QIaxdfl+qRAz5G4YPGrc0kbWD+QeqUIKrwL7mZXKFQc0LAVDpYqisqBV38J
	KyAxKNOlHa1Pqm2oIW5mwxbg9AN+n1P3SbaUPsrC96GOdRHapJGenoGWFujboqKr
	OkSTDX69Qnwu7H9xcRcFXOZmsWYK+xY9LdMzNwuy+VRWDw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve3fnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:30:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso162972241.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794947444; x=1795552244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vlfoyvYuuWOMdUXO0yz9iikbBUqBGSsrzrulSnQeg4=;
        b=Vnuy+H3L8CWv0Qe7vKVZRVkzxfG1t5r4vQwMWGjVEAYAJ5/zfuXVN8dlPFZuSGfFPH
         AlQsZj6QVf1cVu7d+NbYImHm4AiZ2HVz04hKAdqBZsbFWdFefGK1wHSeS15qFCwDuRjb
         gPBQtKsqZmhVxiGrsBQEm9HEDLyjpkBTZTIn8NRSJcswpKW/HUJfD0+DA3KTO7PoXG1W
         MjAE+4QblgHvxgcugaSYEEfVc6YeKI0G72sMIgk6QcSbPkPYztZn12V8cgMvuVsuWurq
         FDhu7+bLe30HktFQCxanGcyJLH7T/X59KsAndV3Wyvq4m/E01VumXtcaZ0w/xtn5Z9er
         9UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947444; x=1795552244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vlfoyvYuuWOMdUXO0yz9iikbBUqBGSsrzrulSnQeg4=;
        b=cFhNXCMmB0ev0CVELL2yGquIgLTDG3vX3aLHh5wFJwUTwK7xsxQv9zqEkAnqN3ipn5
         M0ZnZtAcwW8SQigc1JzPmL/ra1STLeQffdP9Ck536r2PQVwVdBB7OBO59sfmNKkcKW/4
         5KsF/XhWEAuDOrNGjF2OKr+yuDdlkdScR26c/9wnI8qvQoUmXG7yptDHWvE0RCQC5V6e
         ciOmAzHIE93ACoDmSFPLIyS2HioU/dDD56Rvim3VVWev2dfVzkTNQzGyK59OL7L7KyoO
         bOxaaLD8pEH+/JfD0Wq/K9O2Bg3RZsXagD6luYk20GEo3zTJUi98EAZ3gyUNi5vEic5x
         mcLA==
X-Forwarded-Encrypted: i=1; AL+hErG93+68+0oGbsl/oehs90zDivRMOy7r9WGkL3UVQ7AuFejVHUXKZ7Jz04bCi43h0b/3ABJBpF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DINCY3v8U0Wzy0mBUifFc9Q7hN8UqSmrqX5D7/K870TXOHQ03
	XIZVRK6dId4xPhPIfcYiUfk1QKG3aPFJTEuUwAJruSUXSZWZHKD6ubYKsEvrViiXkmLYisqTKuh
	7yMunVz4pjE52LDTiHGWpY2P7QUs2ZIHW1TDnXcvNHNVz/txImPeS8Co/jNk=
X-Gm-Gg: AYBFou0LqNDbpmy7+mWPZGVZpxAomNo62HiNFaEc8mjjrQI+xpmk6OCLOEHcZAUZdSS
	MOgiLRYYK+znToEYAPUo1d8RxgibbI7ocCT7mmK9VNK1RtNr5X3Px+4zZaD45S70E84s8uOLOq+
	SRFV5xBez/QM8t2f1AQS6ZFPs8K5s6mronfvR76Vb5KCpNawmxCG87/ZL2lW/e9ecRqA6aE/hRQ
	xJK9ZRRDHpzF5uR6JP/3DhfzgfNMbcLuk0cNBePuflhzxaDaYSyOqVcSGNTM84SCnyoHWYMxCNJ
	aFonEjXH1y8KJzr7K1HOp13SMpvh3SeFNJ3ew2hdoo7GYEeZGif/W6hMCslk1Q335E1O6giwQ6e
	1bIZxdhTu16idmom0ZK9A/DIAzZdJoyd8LgPK/1Ra1a6votBkD7SQG8Z1bHMoqys=
X-Received: by 2002:a05:6102:162a:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d6ba376502mr69244137.7.1794947444420;
        Tue, 17 Nov 2026 12:30:44 -0800 (PST)
X-Received: by 2002:a05:6102:162a:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d6ba376502mr69155137.7.1794947441181;
        Tue, 17 Nov 2026 12:30:41 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm134085935e9.10.2026.11.17.12.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:30:38 -0800 (PST)
Date: Tue, 17 Nov 2026 21:30:28 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix num tx queues in
 stmmac_xdp_get_tx_queue()
Message-ID: <avy5ZB3rb3-T-W7o@lore-qca>
References: <20261117-stmmac-fix-xdp_get_tx_queue-v1-1-4cd74ee7a76c@oss.qualcomm.com>
 <179493105581.3291.4118659695077688589@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yWCWm74GHDxD+Shx"
Content-Disposition: inline
In-Reply-To: <179493105581.3291.4118659695077688589@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX3JQsDwtqOGyn
 4c99a4HZF/NIW7xLajZqVZcyUB9VVd7+TwabZz7lWrgV560n77ttTP+N8rJWlvgrSXWAaF5wOUu
 rjgHLnb+95lMFL3orSORkPg1ceKc+h0=
X-Proofpoint-GUID: 4sHrJh4Zy82vPJ4y0IVpYU_QPgD9ZTJg
X-Proofpoint-ORIG-GUID: 4sHrJh4Zy82vPJ4y0IVpYU_QPgD9ZTJg
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afcb975 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=m1JEaiY4i_a_Ipqe4SAA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX9ONtuBCg/sdV
 oEsrtsOVFiJ00s2ktXsc/7QGZmDMqt3otuRfDmR/zLBIYZ98HdXUxc0VihFFYNtDJDrBV1fHVjn
 hqO6T/tPEIo/8IBmLLj5nlM5MkN1BTDhU1ZIAYdXDuKT42uF7SOmvj2uBMvyyvMAI5GxFp3tmxF
 NFsFCWPSLa3hXPcZchw8QDM6EWjUdq87UmTQ8OGR5A3kTn5TpGZQyC61pNBlQAutj1Z/Mwezh0x
 d2R1ChCXKzXbEojOk2YnC4kuhrItS0dJGmOckKB2AByMJL5/mMoxSrNAQcDV046ZL6kMsa3Spsx
 baDpe0NSfucIeOoMNh20+65gM7GNxu3MVkPsyGWgDuKIsnO56aFVGbjm+HXlNQmLgNCkuTDdmLm
 0flZbxpiBIZJ4USIG09UXmcSe8uG1/79uS+E0HCGvlZYxFF32JVFTkvOesI8iQ+w5ijnc+L1h/0
 I9Coz5bRwDTQcFXV47w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170081

--yWCWm74GHDxD+Shx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

I spotted the issue during code development

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

This is a theoretical issue found during code inspection

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested it on a Qualcomm rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--yWCWm74GHDxD+Shx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavy5ZAAKCRA6cBh0uS2t
rNETAQCGRKCmAlCPuoAkpL6wjQtgkOfJzgxEyivCOFRwznyeRgEAzxJ/oRmVS7b7
WgSqNYbiG98w/qgPodTtfuyjaYDQTws=
=BxgR
-----END PGP SIGNATURE-----

--yWCWm74GHDxD+Shx--
