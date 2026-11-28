Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856704;
	b=MWCubv6pLQEVH071HRgQSb0u5iLA8VGUbaRxQRapVYghWk7BA91IndoQcl4EfT3cVtKI
	 hTis32bhEa88uW326pMyvGNIrmfcklbjsa4CuMCq88cwJEj/Wr+WdH1Q7pbPCRT194CNt
	 x1ZKDHuOIFRTsS3KpOqPQ5M0EzY77BmPjicTrxCCDSqgvabwI8i29AlDpPmcQ686XAMDW
	 3+4/Zh0z2r5yIHUGhA7/EknkC8ayAER3603rMsW+HJbvw7dGp1ogzzvUIIo2li80+oqTu
	 a35ujbvvKmAivtVL/E2xXhgqwsRNLQNH9opxU/pUiH2kPY6o7SDi+ljVGbbQkuwmI3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856704;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Ws1sPlRhEyO0CsA3PQRzDm2gcjCnVnMcPxGK28A0+7c=;
	b=UCex8YY1ZLQujZECafLACn5P5AhWVQBuZ0MwqBdHrAnjOnRMh32dUGyk805a1x7iHQw/
	 5IepP3YXNthyP38lKsr6cOwKc6ZSvQcq28vZsybYP2MOeaOmyxs+uMuGtmwRX0kqoRTmZ
	 3B3u2a1PprEnVW43jEDs0Yb2kwr1sbicsImqVkI3R3nSci7k8WfWmM/odaUvhN3BOXzVy
	 iNGWWpaJpQIbBPVhR2tHk9B155kIU1XFysMgpubkyovGDnBnRnY1oXu0Y+lPTkr6YGM2c
	 B/SZq954vl+8S8J7/CgQdtEIJiYqpLI0lvY3MF/XZFdCaoozw2a9BA/5Thx8RvgEVIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ljty4lfS;
	arc=none smtp.remote-ip=66.163.184.200
Received: from sonic301-31.consmr.mail.ne1.yahoo.com (sonic301-31.consmr.mail.ne1.yahoo.com [66.163.184.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FEF606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 09:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35FEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ljty4lfS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795856703; bh=Ws1sPlRhEyO0CsA3PQRzDm2gcjCnVnMcPxGK28A0+7c=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ljty4lfSuHR8WakW4jAflCYCCBySOdeKiwKzjOhjuwMS1EuTOhQ16FlIGxcg7tLbUN1TS4PyFxHNwzFjIr7Aj8tKHrEKfOmal2ixyUKCljEhnNwpcHw/ilwDGXas1f1ZK0dYq4DTC3EYxEieQZVc/60i2Q/j9BkjmHb9iUN5ocbxkD3nrElLfzu22ZB1/+Xs6hYhOyMZHRdq8uYMamADIbhJEFtH9E89VldT3xixeJWGDOFe3XoUtA5riLOMVErXOtSFs+Iu42Xojia+oeoZj/UHVF5JFZiM7tg67Npc0ZJ2E661hk1AXuzZrsz9nNbtNAzLETjUpSnn+6Qa7q8/Vw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795856703; bh=/QklLCAkD7T02GY6P+2YhS0+rMn0peNE2vF1O3BA3vL=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=KbhGJZUEuDsrSyQaU4MwTpJ/SB7tw/ebFp2IdCPVApZxb5YQtUH91flDOAtbBR9N1fIdVAd3y1N87HZjNteM2uZDsZHyBhWyM60uwbZHoOMPwTMtWXQRpHe7EKagmwl8uv1+bZuQqlX8IqVWvDvQQnOMiQ+QhB56SGDYthWvQs62444X1xeXIcUKH6f5sMYMTmmAWES3xj3aU0ndgUyfx++F576v2OKIfchkwR61V1wFBnalS9dDOZzhD51iVMiGpumyDAjraUYMaM/ekykCklYpe1H7SUayoS/i7qVdwWEIQiqwQRY1FOe6gEddp1gvZD3FoEmOGzNnX3+3sGQ8qQ==
X-YMail-OSG: BSR0cucVM1nQKLLehYtnDu.DS.pnXDk_rdh4pomyQet4aG5HzOqgo0xUa5BeQt4
 XUpj5s28Qp.JzXcdFccdAsQOxxUbq3DL48PQVLfywlrU8K6MpiMZjWC0sIbxkiemOrVRko9tkIMG
 gcvw8gIYHVuRpRQCr1ZyY2RhS8XpVlQ66T2U26a2fVkFlUfF.JvGP9k3PchOE_vk1_zmKsoinhP8
 pr1eyWc61uhN8UhFOjV6fRROS4eJw1sSOW6HdY2aTbeS7cPMRdvoswY9OqPCJ8HiTW1Oal2wJh8M
 d9fKGrm6bJ893IJ0AnOY6GCUzG9YbtJg._iZ86EKVBxcISOGBLYB.gHLYOjpZ6ZafhQQyo4a6wp6
 xmO.RltXqbaQiNJMDm1neNGZZ5OlE3LpCn0etHr14NqYTAHXbr4Q2LsuLz1LQPbSBro5IqnUVtO6
 L1Kby39WC.D1plGQlMW9WklTNDGfO088c57PcMtJ_SSOZ0NMA3pKYsjOoOi2c4gQRI2YMudjdrG1
 OVfBGrJ1Oxx7i5CU5Grnp8M97rM2R1iuMEOeQ8VmKJjFKYShoFlQri3Grxv4Gvm8JG.ZiDv995Wt
 3NqfGOKTp6zLVWWDbVqQ8DZkcNP4uwMscKcZ2aWo5y4ufaE76m.SaXoXVuULWG1rkfssQdjcL5WJ
 UqIBe_odQTNa4cIJxyFj7of9OEtnYcf0CRpZlZLUk18b_lnTrfWcm8yoUZBZk5Ylo2OPeTmqpvWF
 aVJuQ2pvxpdzZ44QF.30faHYrSCPCPrqBRH4KvM3ehKhqG0dGntB9QaGAU.9wDoOyppfPGZM9pW3
 OsFC9sTkeyTGx1lwci95SQ_y1u0.3b2f4tNPmfJ7AofbiWyRRons11Zlyu2fISKbp6lOx4MMSkve
 PybMyxZtQ5CvZE1ogB2QUrKdFyMdYOBGy9UWoaBleQJVGv8DfTjVmJYdZmhqCmNSDx2V470B4DBQ
 3GHBBCsVNDFV_ukQrVih0Dg2CrcWpSV2w.9hg_8CqHVKzLKkqe5TTVN4beGyy3W7TSeJLrWZ32V9
 NBr0_KDdpXT6re_p90ztZ8LiL05MkqSArJt5FbN8zKqSpR_Bq70oGF2oCI4iQCsm6Y7UCxhFyMhY
 KaMMEu1klUlEBf9V5m75n56kWONvBS.j8rQ22SirT4y4gbpY0zyy9ra.TBqLkAll2wykhDM..5y2
 8KPjyViGrEYPByLJJSmLxRitw1l.3oOmjHM8WmCBrmWSm6s7_BiVY5JkAhNNszpT9kVb_unyQQoi
 QsXV..wAPDLC58kXpGhIZFagQ.ZYgAn7ICPvqFy_sGaVpiVuC7zQukGNeP8QIwMyVEB0hb3F1riA
 xTbxnVLYdHvkvO4KNwiGqv3R2ICYGNBSKarZtz2kXANHKQ02fUN0YvzVy.H5HwaA9agqQKjO3LyJ
 EWieP3eGhDjsfIXeRJSw9wkuI_y8G_v6utabBUcbu9Z5RbSLCx1B7Nuf__V22gGona5M1naV81Sc
 FOYizUteFIcd0hw4n.JzOwa2W7nJRfdRVvAANGJBGyeQifbjuxr6ckIS4kUJ.YztyxjXvoFmC.Jo
 ByajX4UoGnow711SwQD0BSZ2_.1WxQxmmfhuXoB0dvcB.SDi3ZiqYgmnd38PwTuQle2DExnhtqC0
 LAxIR02mYUsrCgbCCjQKAYWH6VtpkJ697y9TAgNFaHcZeTuhGy2Xa1TTZgDDVqtzD_1koTx7rWHZ
 YH_AbQFPhhrNS5sqqZ25nQZb.bKnwOelpz8HOb3M4vgZYt3jeLPecE_s_HHGXWs.L5zANDgP8wPa
 L4Ol3LSBpXQZgEuBqns70fT3kQpT9F.7MVuxT91l33NeKUWtMZ4VgN1twq0jFToh9apo7Wo_HeIR
 ukwg.5RyFApFTWK0ckmHQ7czn.1GhdtnrgZcouZjpmqTViZQhKX7rYOT.g0PL6p01xuYVAvPfEjH
 1ElZmIVpzuxkKmte.TdpFSv8D7Eo5xnUtgjsyOIATTSgXgYnG260y67f8ZYAsUf4KF8i2VyspwST
 WxXQJW1UgkouPcz8Tixbi4OtzB9aqSm30iJCKQEcSUJPnkBaF454W3faTPrEvRa97Sj.WYx4b7tM
 sSQjiC9GqCw0DuROdwU55ZMgmksf5RMBrkd29o7cdRBhNenPwPbEQHiZ1pgGmPIz0kt7uw1A.uR4
 gxYfyAkyZnBu3dq15v.pydQDa5haBnrc6voxNI6TOkROo9ia40RIVFeWo9rbnMguQEHD9QKhdjet
 CyOhGQSPa6H9kVdBGWLwd4qk4s3JWWB9eIKWi6O5P73cBUAI_GZssHCcn75T8d.w169Cccn6EfBv
 CYYj5jFnM6mNdviLPn.OBDPlbTTsHv82h9eNZeU_JYoeqqeGM
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: bfa1a860-1422-48d4-b121-c14d919ae6f8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 09:05:03 +0000
Received: by hermes--production-ir2-7c4859dc89-8drgr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6b996786ecc33bb6504e19b58277aecc;
          Sat, 28 Nov 2026 09:05:01 +0000 (UTC)
Message-ID: <6ac53dff-d215-4f47-b820-1a9d9a6d757f@yahoo.com>
Date: Sat, 28 Nov 2026 10:04:58 +0100
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
Subject: Re: [PATCH net 1/2] net: dsa: realtek: rtl8365mb: reset SerDes data
 path when conduit comes up
To: =?UTF-8?Q?Juraj_Sl=C3=A1dek?= <juraj.sladek@littleit.sk>,
 Linus Walleij <linusw@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Johan Alvarado <contact@c127.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20261127-rtl8365mb-hsgmii-fix-v1-0-f2827126aa6a@littleit.sk>
 <20261127-rtl8365mb-hsgmii-fix-v1-1-f2827126aa6a@littleit.sk>
 <447ca9fd-5f70-4e70-b080-d0d2b74478b9@yahoo.com>
 <AS8P193MB1782B891C4E946067E79990F81402@AS8P193MB1782.EURP193.PROD.OUTLOOK.COM>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <AS8P193MB1782B891C4E946067E79990F81402@AS8P193MB1782.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo


On 11/28/2026 9:19 AM, Juraj Sládek wrote:
> Hi,
> 
> Following up with the test results for OpenWrt PR #26597 on the TP-Link
> Archer AX55 v1 (IPQ5018 + RTL8367S, 2500base-x CPU port).
> 
> Setup: OpenWrt snapshot r38565 (kernel 6.18.64), kernel rebuilt with the
> PR applied and nothing else changed. The rtl8365mb driver is stock, without
> my two patches. Each test boot is a reboot with the switch held in hardware
> reset (rtl8365mb unbind before reboot), which reproduces the problem without
> power cycling. A boot counts as broken if the router doesn't answer ping on
> lan1 at ~50 s.
> 
>   without any fix (earlier series):  14 of 70 boots broken
>   with PR #26597:                     0 of 40 boots broken
> 
> Fisher's exact test, one-sided: p = 0.001.
> 
> The PR fixes the problem on this board, so please drop this series:
> 
>   [PATCH net 0/2] net: dsa: realtek: rtl8365mb: fix CPU port on HSGMII after boot
> 
> I'll add the AX55 results to the OpenWrt PR as well.
> 
> Tested-by: Juraj Sladek <juraj.sladek@littleit.sk>   (for OpenWrt PR #26597)
> 
> Best regards,
> Juraj

Hi Juraj,

Thanks for testing this thoroughly and sharing the results.
Now we just need to ask the author of OpenWrt PR #26597 to submit the fix upstream as well.

Best regards,

Mieczyslaw Nalewaj
