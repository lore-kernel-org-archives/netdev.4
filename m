Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795820983;
	b=kh9Qy/rwCD+nY6auMPtoeil1iahVJ/OVRkESYHvEBczh9skEvxnZ+Pu8lG8CsuFckOzd
	 Lr35lq6LYm+Yq1RVYk5cgbpHlp7gBwlCMcuC6+t7uijgZ9qc3CttPJazVsntX1li1Ehhr
	 jLc3H8dxNreOUrKyvE/Nn6BawQj48BDfga5AqiOHdjFn7ixz277ws3fRH8Ue31Vdz8mSZ
	 JTZ/cGKPikh6fztFqtBWRR/U5c1YgzOZNSZiVAgUV8ZgbcjLp27u/kTh2RtZeby/ok4gi
	 dZOoeFRfwu8aif66CBARzX5kLH8HLD8e0l8hinADIt5Y76kU9yYgrMfaWr4Mjpe8RAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795820983;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=CN47lEj+UY73ilHprGhMlPD7w2d91LixlyFnvcGj6AU=;
	b=CY3F+ErvzLnBGYpCLYM77cCX1vsKYeUgLB5rGbr+2BJTcCd524X5i5jOUJV/WSsLnaBq
	 RYLiMNc72cgTywnjewEl3pQbwe9hdRGfNNHvRUt+hRKVmHVR1BKsj/L1jeosrmg3+yimp
	 709TFce3NzFaEkE3TXo99p9aQ/PseUg6pJVQtsUEYXPCIvDqwHhb7dgzYwhn5OKTFLlX4
	 sylR1gQt59MAJ6wjKPTt3msEORt+yU+dfsJcfLaNWu3N0DtsVn5jRqh3+HnGVRe7jC+M2
	 0IT0djUnPvvdUPiLKN4YR4VqMo7PpSDqaJQJoZMVp1+NKfTP0AN+rFiJhnWA7C5zNkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=AFeHmDcx;
	arc=none smtp.remote-ip=66.163.191.205
Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9788606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9788606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=AFeHmDcx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795820981; bh=CN47lEj+UY73ilHprGhMlPD7w2d91LixlyFnvcGj6AU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=AFeHmDcxD5hdg6Z2mbuCheIzsvvY2lmjNX0TLxJDmqJiIf4LX+0+Iu7JjWnh6SyAYmGGW/K05ZMT3djtVbGWx3PjuWUXfO37ln+9crgZ6bsQkMMGaAGuL0G2F3UM18BHcPTTs/bNwstBXG6lhftDXKGAvW+Pj2itDxFIuqrLLX1b0SHrs7+0ilum/mMfza9too0cO0uoGQ7kCKbhSh0upXkS/D48Sy3ofcVK7P6tLkI3cBzKg57Dj8xc3e/5WeXP4bmatxYGGppWYLQunp5T87UgF//zQwyGtlgbkvsmqx4PXAs3XKfhzQ5b1nWQd5qsAZCJk4DbZRftTogzJbrtOQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795820981; bh=gCPijCqry890ziPCT6tjE1BWOZ+KoyTtp1yOBnqYPN0=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=jjeMGyGo/AGdrW0VSpzXLJbkJ+yMVkdj/nOXO0RN7s8ZQdBEfjUDeoz5HxBGG0zP0Pr6K4Hi5Eudb6SksEwU1wMz/Yp1RGOmjypjnWh08pMvlGhsF5ZaJ4xlSGn1allg6JDED2ih+JqrN83VXQlQC0ry3YhN/yUf28rMp8w4SAp8l9VzBA2Vi8LYW6WZqGHEsGb2CbD3BGiS+ziV0/zvjJSF9DF0COUgyV1udFJ87QZtXwEJfq0BCsagD8MLLq5srfy2gFp429fJEtfQBm+J03piLaz7pBNhwJDPBj21y71/w+UdgxRJewH3KyCZtZbjrbuLTAw7WL6XnH8oPi7RpQ==
X-YMail-OSG: gxU2IisVM1kyfd2ni0FbUBCaleO1l7ecDYl7dix8NzZOHPBtoABJu.ddIfKg5ab
 l14XTm_DAHk9WFoWVXGQf5yCeTtm3pU3nvL23PkFJ.a1dcNY1I5eq_nDPmnwImFryADAfPhmZc0i
 .c8rRBEI7bElsc.F30MNlrkvcOpYeNVr5PzvUszPspsDUSw6buY9f9L7pkb3EIPdOYttGE4KreQJ
 QRVPTIILL2xrJuL6z04pKSIQTQjwwBKHSat8kWa2SrrVRkPNwrf9e7Zt0.3hVSmPlvMlYUm8gelk
 jpXAhZ7eXcnD.Fyq0UvdpmnsUHIC8qowOBGbhciSpC0edttReHq4LP7ExkRncHGxsL_IYt1niTIk
 VevIyIq9c5_JbV2eYPgXaxuMxqheM8U0h0TF_S71X8MMYshn.hvphDHYqdcYRFuFSk_6RJUT0Xd8
 bTWdE5C78FzDtjpvCBT9GnWiBowJrGpskNBsi0qimZ_x1thQ05DBapaJNHvgTvdSJmRKbnmmA45T
 c.rPM19xLwHDdtg8itqVe4YwEHhwfikJzRHWLFVuo4MWcmKjOoQfMrg99NxjkerA8ujomM2sxBu2
 2GftSAoRpjAVmwPVdlMeGuHEMjT2phuSBHvS3xRUJ5bhjcZF1z_7PYeQ5JtuGdbOweXsEgX14tOe
 hYcyWq4MMCIQIoTkWHzt3vAWdLxl8s12xWGzPALimBInpnZJDbhOnK2H64VwCnTZuRzJgYGlaNmQ
 P4JdDzY1OnRe3qFhOlkPNHNEtxHXpC08baY0sfhJaAdssQX.pgu4228KmBYVUTsTioIVrIay4j3E
 mcmrd_eewdLGmBS_lf0p0zdsFbt9eme2t8tfhFl2qh6D04dHS0otKq7ZFmvvTQEHm7L5s7XJDaeX
 bB52yxjSs4_ZBHkcDydXv0ggESIiVWhdV8wrQN3O0YmGF_e9cTRNf.fi9Ep3nc6FJVprfL4CeDkX
 0oUh4611B_Qx_JYo7cUXcS6LphVUNbEcr.kzB03OcFll1jfwa7Tmk4G6oHNm9o3J6yG4mKpt3hVy
 HGuno9Nm62ZCqswV14P.xQnK7DE.buBiBjj9ck4h07wqZyigkt70S2MdJCg77f.QRxCf5j0CbEhE
 .A50C9KwIxvGftP8cHQX0rbkXLwIImbHWHKyCRSPuA35RxWKAQuAESwGLkAkHAR_7qThTyeqUj_W
 ZkMnDvn0cj5yEdOcbA1mIXVlgekoEKjQCD0fWXRWmIyxicObUsOfnhlSu6rOeAd.alEUX.tNmOcC
 FzByRBzYfuMlyR3bOdJJTiF8tIixTo3n8JmIfDaCd9rHNoMt2BdemrW4tlAG4b4NogZJy7vg3n9y
 .U0teSKN06F4cDPyffIemtV5rLL2JEkFlgL0FnYfN_ondblcA.6rFKMZQh5zzm.H2TWNsINYjKYm
 DyUsOLYbVsCsLkhLVJc17arcIUj32My.4z7FhAtRzrcfdfvQX.osN23lni7bmIGbl54k6_rLnLTF
 JUpPBQVpr8Kg8gb6NQ5GRBpI5GpEwBM23qIyfcAKtoOhvpBtJJVXlQvBdelvTTGBgTVRPh0iENqz
 hY5qa2U6T5nSXZYLG7a9XCLx08C8uzSiDy2I6MhxK3nSe_kmzx7Kl5CCv8LVL7UaBdoFuDSwqCzS
 EchedR8JLxf0348MAUOBAA0YUS4BNoS_CcVwZx0wGuvpHV16sXro9IWTCzMBqHXzUrgTtePBa6FP
 61V9avYZjjH3A5RE5CcX6IwJtHj04f0gEMlbwTbDzFdN1DyN9_vBwyTAzk119G0SUdrRDAnTa0qp
 QhH5xK0vWK7vkc6o4Gt5ZDBB_5cEj7z55QFiYlnX3woZv7GT9c3OSfILDplWiwc_.MHfY8_BQyug
 r8wVApjOnpaywscMa.FG6TWfxPEB.M9.BsM9ZM.t9azXrU9yx8Qy3mLfbAc8P6VImrAFq0bBZq55
 ul8HwFuHMl263wADW6q81G66GZpIhN_VZ1ltP.ZlP9G1jlEkM63WKf_UoJ0dkzzVqNUm3A4JHQmh
 IL8qmbdnJpjBLORG6yySY_yYcTqOeLnoAANuVyzxXezZamn7GcMk8vHBj9eu9jJHM9nYeZbKYU_7
 DIMPQVb0hIGaoDvoNu2569ckXbQV_J_qZ3BxM4h6mOYm1idHZmhVYopLPsenG8whYJTa3ER7ubFK
 gvcHIVG_5PlkwtKGCNmImNjDvWcdqCeZDYZt5aGUVokn7MkKkQtOM3DGVmYqj7uIoaZWVsVv3yZ4
 3f9ju045uJ0brapCmWQI2GZRo7KaK.FpBaWoqwWm14jacxxLr3U50eUFRpSx4k8jE5XG7jA2u44H
 WZ2n9WisvCCpLpsmKaKLbnOBkBpt66qPEFeaf_vJUWmza9KlR70WSZfE5
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 98a3aa03-c85b-415f-b9ae-886442611f82
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 27 Nov 2026 23:09:41 +0000
Received: by hermes--production-ir2-7c4859dc89-622bg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 76764bee2182a994461279cf44842eee;
          Fri, 27 Nov 2026 23:09:40 +0000 (UTC)
Message-ID: <447ca9fd-5f70-4e70-b080-d0d2b74478b9@yahoo.com>
Date: Sat, 28 Nov 2026 00:09:38 +0100
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
To: juraj.sladek@littleit.sk, Linus Walleij <linusw@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Johan Alvarado <contact@c127.dev>, netdev@vger.kernel.org
References: <20261127-rtl8365mb-hsgmii-fix-v1-0-f2827126aa6a@littleit.sk>
 <20261127-rtl8365mb-hsgmii-fix-v1-1-f2827126aa6a@littleit.sk>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <20261127-rtl8365mb-hsgmii-fix-v1-1-f2827126aa6a@littleit.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 11/27/2026 2:15 PM, Juraj Sladek via B4 Relay wrote:
> From: Juraj Sladek <juraj.sladek@littleit.sk>
> 
> The SerDes of the external interface is configured from phylink long
> before the conduit Ethernet controller starts transmitting on the link.
> On a TP-Link Archer AX55 v1, where the IPQ5018 GMAC is connected to port
> 6 of an RTL8367S over a 2500base-x (HSGMII) fixed link, the SerDes
> receiver regularly comes out of this in a state where every frame
> received from the CPU is counted with an FCS error, so the CPU port does
> not work at all until the switch is reset.
> 
> rtl8365mb_pcs_config() already resets the SerDes data path right after
> taking the SerDes out of reset. Repeating that reset once the link
> partner actually transmits recovers the receiver, so factor it out and
> call it again from the .conduit_state_change() callback when the conduit
> becomes operational.
>

Hi Juraj,

Thanks for the patch.

Just wanted to give you a heads-up that there is an alternative approach to this exact issue currently being worked on from the SoC/UNIPHY side in OpenWrt (PR #26597: "qualcommax: ipq50xx: program the UNIPHY at gmac probe" by Johan Alvarado, who is already CC'd here): https://github.com/openwrt/openwrt/pull/26597
The root cause identified there is that phylink only programs the qca-uniphy PCS on the first ndo_open of the conduit, leaving it in the bootloader's SGMII (1.25G) mode while the RTL8367S brings up its SerDes at DSA setup and trains against the wrong line rate. Programming the UNIPHY sequence earlier during GMAC probe resolves the FCS errors and dead CPU port on boot (tested on Mercusys MR80X v2, TP-Link Archer AX55 v1, and H3C Magic RC3000 v3) without touching the switch driver.
For context, this follows up on the earlier netdev discussion here:
kernel.org
That said, resetting the SerDes data path on the switch side when the conduit becomes operational might still be a solid defensive measure or useful when the conduit side isn't preconfigured early.

Best regards,

Mieczyslaw Nalewaj
