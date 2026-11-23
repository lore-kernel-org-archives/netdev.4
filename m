Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438068;
	b=UVe4/PxCY6nGAB+MKbHJnSwy+6mPCeT4LJbQQblzbHzfYn5miFYRVGQwxwhobH+wGa1I
	 9/YrgR3wJy7prA5YHwYn/wVXNIGX1M0Ip4K9xx22AjbIM2kiCZ5wDNBlme+dLw5JKbAlP
	 q2tN1ZKM9ncjxoPONSX4+ZmETDC1c9gWTegENLz1PVG+Cua7Oodpwm66Z9XdQT6A7X9DU
	 o08KUGSDO7oshUEk1jYn5j1w1bYK2XxXc2W+W2NjOWO1zpS1NqwkaGxsFDAJHjSeImyyh
	 WBRR+nN7+pKsgJ33DgDANKiVpXUaAIF5CKzliO016uOIsInZUj0cutLiX3xP0vaBDjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438068;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=orrWhwI38eNtu/8XCVAnDu9Zutnik9Tw9G8jO+qCzzg=;
	b=a2iCtPKWYcfGAP+GIsjKf3IQKTeaj4suGLnDM3nT8wfLBIqybL7NBnVSv+QfYINvnOBK
	 4IBZGIjfS+Uw/CDRPPASndSWU0k2Ijp4620y1Z37Luumb+xtjVermCMLL8krOaHiZYvuJ
	 45Z6kzHVAeJg+ic0ef6zVabmQxWCqi0xwtOWHni6VjjYnI3ELnuhD7fPwMg9tOptf/IkQ
	 DLf5MA+MQqstBBd9bbM/If82QyU0I0H/RbOZBv3LM9G4rZCAkWq9IGZWxdwv3fi2Tc/d6
	 mGtkBSzJ4SPWqS5uQ9J9uv/eOgxxB0gB1YV6+ZmMSJmjeqfXNqUb6TCwPe2LRxcAjIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="ceLpo/QP";
	arc=none smtp.remote-ip=66.163.184.45
Received: from sonic317-34.consmr.mail.ne1.yahoo.com (sonic317-34.consmr.mail.ne1.yahoo.com [66.163.184.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57318606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57318606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ceLpo/QP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795438067; bh=orrWhwI38eNtu/8XCVAnDu9Zutnik9Tw9G8jO+qCzzg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ceLpo/QPIXDkwQNFAnKkgbqcLWlpZ+XSwk9MrjcKuZ5mj2ig01ryEOcdqVQ/TDqSyK9JPmd9Dmpdv2Au4FM/Yj4+2JzhHvI02HuLHAvaUrL1Cdb56apNYCp+3VEktfO/BXw9BhrHMMiOgjMoJeURWHLQ8peeaZ8w8ava6OBe6bN0z7FpHSHRFaVvin6esq0S0kTVsQijXLmems/79HqPc25YcHTHwb6JeCjGTJISJCaz7QRJuBt8PzOTA/2V8jFULRVRAg2JUZcfkdlLeKKzP5LxkukooBhcOHxekl/a9fSG9ak5FBT+w+G+xuojsmvSmAx131n+UruunU7Q/pCr7w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795438067; bh=3LMuNOxW8zKYTBKQm3BNccZdU2n9C5W1yY55HXhrbvd=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Lb/8jBMmBAup5ZYuUOYgqUqY9JrAIgx58OJXgm8XlvyHUeWz2LYxfPOkSz2qiWejstrP59eQ3utPj6p/OZgr8UrornEiLjnElmvvdoDSMUmjDz3In5V1FFV5IVm8XPJg2fDgWX7jpWODQXkaQ6bAySmf1fHV3SVVZOGsD5bBNZb9QXvh6ElNiBV3AFWk/KQEz0GTc4clGmsdqqB+strcc823l8w/jss+5T5mSiqFioext1ab19Zrfh5LWg2sEBJpFWAwseyx5y8DUlIoU+lFdSFqyZrAXk8btOUKT0itHAWuVV1pjW2m7OOW7hKlRlvjRkPb30Ktq64F2LEIT0ve/w==
X-YMail-OSG: a93BEHcVM1lwrnw8poiQoAhNQqt0NJ4tAKAVlTdTwoDNeMs50BxComSCYx8Xl9Q
 Ap0jQXw7doCu7HpYFgABDH7lxT8IZMBeWpcVEYeuuoRqn._aR.HHncWa5hBmEC3Dl2RXA5st_EgS
 Nnzjxo5XNQBYUSYtnWDIUJbHxbfqb09QzbdyJOljdd7ebC1mEX3ieCICyIr1NBFbAe_ugjbhjuMK
 fcDRBqyWK2X5NZyf4fHi8FypUJCTfMLwigp075gIU03WjiDp8fUzfxLShqNi1_Ai1JiI82_ImJnD
 jfPyUheLevr6sqxLs73WwfFT6zdnEikiH4wzD5PXrueTzDsw2HEeswUfpQKOp.wZ4ub6AsKE.zhQ
 4gqBiMJo8.klOMfmHOkZHmxBokRGcwfaUoivQVmWq.qk9Cf0gzPzCasVh1uPMcD5o0kLs1W6Nrcd
 63s.ooAoVCfYgRBF9Uy9VfV5B0tbflsWjjnJLr8yu7a9C_m382JjiF3L_f8Z.QdcWb7ls1oVLF9H
 D6Zl15RczWdYhmPZfKK_ozzQNQdchHB3srTl1vEdRsSS9ezrQovYZCC7MUiXYyRC72kDu67x0psK
 N3lf_LRhftoQ6uu.7kDht00KcciXcyombKjlVSDqqPzjMw4jivTGvLdX09e4xAz908yZfR.EvxS1
 YqPoBM__d_9ndN9CEP6uNW7caV.xqIg56Xy1.43mf2NhhH9EHHo3GlyEa0atVVupLQE2Ae4aR.Kb
 HI_1Rev4fsyVTUZdP4jxqjj_SpQiAdiWqKiQq1sw5i_RtyUsBZx3YOXfIvZ5jOKAAf_NMBCeyUTg
 jJwZ_MRODW45GwWDAaxPKVx0L7xi2thX15KgoCvszWmiZmzWrV98XSohKVJ7SMA.KavzpPbGQDYp
 fG54Upbo1jK..bq1c8Jtdb1cOmg3gAmYgBF7M97Pf3XAbcLnDrL9BaOKajHbHuKPpmPylNbxXbmW
 aMM5kLn9BSLbLxgNe53CS1WewdsRy36KraocT6UxaJ5QbVpKuFDn.YFCgvELdyznhlQic3O2FAis
 DA.r5Pg1qlqfQ.rsgcvvhVACCKB9muQQh5yzgC8AYQoWb9riXEKRmTrrb1rb2NoDY.LYp2zt2C1w
 o4Pqos9JFERZv8Rm_ZoXHdpWvNnyXlN6ZOsNLX1FxPvt28QQ7OkEA9WY9cYFGE0fWiGFdDuxZpIn
 IDctyLp8jt9A9ySmS8sUchEStUuQiw49U1tzLERFuOF6g7x8.IMAOcFNGEy_lT9F2IvdvgzNYm5D
 1dveduYEqApWdMw.1XlpekBxXWz_vtqnW02ZV0j_CUYcUUAF.lCWy3LWfkiVXsuPwwnw9u15fzZ7
 ku2jGNZ8KdS8FnSycJo3LoZvG3tfCCwI5ioRyb.n4IOErDhF_jGRkGrr1tOwGlGcHqG2qUX2I4Ux
 hhORGNI8H0grbl7.phtx3Y.f90ATMo2wtClorZq670G_afF3UuIquMHR9ohNjac3oUP60qpA3MCQ
 gayt6ycrwtMGDLV7u3a4pG8wMR3TS30RDK5AQZFKBjlUAelD9U6wrZg1EAhitA9nAYI.uj02fMxH
 4m767jgHTV7DHdSY.ShbXSQRZywS6unbVmte5VLg4aRgmbFXyltmAilzGyPgD1siQ3hCMWmapXC3
 CvRPFNRKZYsvP5WLAMz.kv7Mk1iKmNN.YyCHYNUdnJqlS1K.2YPQsbMt53rmHnZH1Y.DnXCBZ0Q3
 MpwlQEdHOAJX469r7EwEYjNq4aZLYiW4SNA6g59gLbVJeFUq7DhzECJekNsFqHq75HXBPFdN028E
 iH0ajBcKB2pg2MYh_l_0BX8If07m82NHbbK5li5rLanvID0m1psL56nHBMpQA813YWfsQoyjggW5
 NX0f0cX2Mj031xEx14yvv5Aoc99TaaXC._a.ucPG6.0u5Lt_eLQN9MGfkY2.n4FrrYK8Tbijeoln
 pZgs94ZkktPioOcWuIcFNLqf5jqJ_yGqCjbF6r35DKscprUnzGxhytlowx0z08TAVuipf9UGjzxT
 Us4iMRiMbOxRt5F3i82Y_62r0n9WOxEI7hzVVlgUJCeL67qEzrd7e2DvZyyU_aQq44t1yZE0wiiv
 k_mISmXt97DhNNnwsCPfh2LmU_8f7FF7fNNG1InJdB7L1tKpDrpZhliizbPEXR0HSoDd2UEvtuRx
 NQPwZn2vExE3Hqwf6Qn84ldrTsI7tOF_i7xnQ5RifBHUAzYs7KAKC9VNk7Ick6Lg6aImbPDa_Ksh
 qJGsTe3uP2TsewCrWb9f5TtAlXMiR3iHhy8Yp5K5tw78yrOF83BhTSzIJB13fMgDtnrVZMekpPUz
 SwPOsY6OUwenXexuNHRTmCdY-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: eef3ac1d-69b4-426f-8e94-9319f1c7c173
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Mon, 23 Nov 2026 12:47:47 +0000
Received: by hermes--production-ir2-7c4859dc89-9kgzz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3522ec87fe67852f4cc02edda797809b;
          Mon, 23 Nov 2026 12:47:44 +0000 (UTC)
Message-ID: <b9f22af1-f0d0-4beb-8a4b-f4e0cf225363@yahoo.com>
Date: Mon, 23 Nov 2026 13:47:44 +0100
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
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Gustavo Foletto Mora <gusfmora@gmail.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com,
 gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
 <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
 <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
 <CAK+kzgxmgdFoBhzNhfxB29yS_Hz13LOm7rZvKb6fpyVKb8kwdw@mail.gmail.com>
 <awPy7Wxq-_ukUNfG@pengutronix.de>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <awPy7Wxq-_ukUNfG@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Oleksij,

On Mon, Nov 23, 2026 at 01:46:00PM +0100, Oleksij Rempel wrote:
 > Hi Gustavo, Mieczyslaw,
 >
 > thank you. I have no family D hardware, so only some pointers from
 > family C.
 >
 > On 21/11/2026 Gustavo Foletto Mora wrote:
 > > On 21/11/2026 Mieczyslaw Nalewaj wrote:
 > >> 1. Does a non-zero value written to 0x0851 on your board change
 > >>    anything (PCP of untagged frames, or the register reading back)?
 > >
 > > Not yet answered: on my test image the switch registers are read-only
 >
 > On family C the added tag takes its PCP from 0x0851/0x0852. If family
 > D ignores that field, the tag probably carries the internal priority
 > unconverted.

That matches what Gustavo observed on the RTL8367S-VB: without
0x0851/0x0852, newly inserted 802.1Q tags take their PCP directly from
the frame's internal priority.

 > Other places that can set this PCP on family C, in case they matter
 > on family D:
 >
 > - remarking, bit 12 of 0x000e + 0x20 * port (off after reset)
 > - 0x093a bit 0: when set, an untagged IPv4 frame takes its PCP from
 >   the DSCP table

Good to know, thanks. Numbering the internal priorities like PCP values
on family D (matching the vendor RTL8367D API) makes the newly inserted
tag match the traffic type without needing remarking.

 > > [...] so an inverse table would also turn tagged PCP 5 into PCP 0
 >
 > Agreed, without PCP trust that table would change tagged frames too.
 >
 > Family D is not merged, so the DCB code has no bug in net-next and
 > needs no Fixes: tag. I think the family D part belongs behind a hook
 > in rtl8365mb_family_info, like VLAN, PVID and L2 in v12.

Agreed. I have refactored the QoS priority handling behind
rtl8365mb_family_info hooks (qos_iprio_to_hw, qos_hw_to_iprio and
qos_set_untag_pcp) and implemented the PCP-numbered family D hooks on
top of that in v14, which I will send shortly.

Regards,
Mieczyslaw

