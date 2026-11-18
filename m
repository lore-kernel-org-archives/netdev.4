Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988789;
	b=hp4QL+bA0Yf+RaklS7vvy7YGNXhE8aZ8VYOH5ocrqDdWv1KyLdqw1iHu82+7YAOuh8Ci
	 03wAO6jiWAomVOqaajZ8J1ZRRXGzUfU6Nh6Ipv1aIn6F39ZJUdZPFBDhY9g3uUfKCAfOb
	 ZwTZB+rR77xWM/nObFUkuxK7uHzE2K33eKIihT01Y0uy/5apS7DF5WPCBRhGQzRO5jcZI
	 Yp0KuuOxzTmjosB3oQU3dYGRgEyyunCSgCcsbGQTEgZgJgHAA8qs4GvIGQNKWh5RmFPk0
	 CLxjgyzUY2jd1sZtc5bdWMKVnvei8o97tQgR6QNX5DeoplcQm76GHx18vhvTzvyp7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988789;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=W5u5mMFK+ku88QTK4KObLpRAVOSpX9G17e4WlGIk8Tk=;
	b=KA+sTR9joXoweMp7k+qzeglnsiT7xmp5QpjczJGA0nd9pMXWEOAIJcvOJUVH/pakqoHC
	 o0o+nb1Gprg7JiIABUrsptZ44DThzTO0Xh91xKx/MSZYRYbKYxMHSQjiDtECW6GRW1603
	 ebi2xZvQ0sJ3uOyVaCag7MYgbbB6cOJdbFP3RFsikFlABooUufbZQLyqkAjaGBQR1Laho
	 jYevxwtUzT/6C7RdzfmV+S0LIQR1hfCvMl43bK7aCuTSB6NJtQwz4CNcjQt2Kp7PQOGsn
	 LGfwMQw5gew+JdltRvnZXrVc0/L4FQztXcrZu1lx5U1nQVw5Em36rbJNepU9MliFFvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="CL6/cpdz";
	arc=none smtp.remote-ip=66.163.189.82
Received: from sonic306-20.consmr.mail.ne1.yahoo.com (sonic306-20.consmr.mail.ne1.yahoo.com [66.163.189.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAF606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CL6/cpdz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794988787; bh=W5u5mMFK+ku88QTK4KObLpRAVOSpX9G17e4WlGIk8Tk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=CL6/cpdzptZ0Is6AvT6sbTFqTN/70QBl/XhXJ3XybBGgEcs3pMRkSBh1HVbsm4zxvVLWGCM04VSPysQyAbreY87oz2LQX3IjhZLW/vp3hUuJSxDjOKZGDiX2GJhhlk/RANH2kpVX0Ixv/bGhuEQhBUUhkfnSuCZYRFobXqS5QWt40lJOWVzx67BURlpKZn8IrfksPOhZWMMsbWVCPCkijQTnff5zhzIoUJgxzNBOo+pc8sYZ60G6f9RZez2VygAKhRzGlcD4T9EmODza7TXyg9X70Sm7jAQnofydseZ6retRBhNjLYCwtHB0yMq8Au/7v/AieGJaHE69rZJWuox2xg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794988787; bh=1x1G2SHOdr4tNaiwBd3OEspsyrBErtGBWdANZKOA+DD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=tBfxS2YEOoIs7QedTi7LIh6wucK9OJc/xgiFdCJRj+NKuhj9lGKaO8mvHk3QxYJCFbzfhOkmRH0x1NaDR+Ef2rOu4dKcDKK4ciFpWgYO2dmDQWT3xdHDWvaRICODQnxSS4iR/mkbM6wAT8juZh3BLzNvTx3HCMEpWs6tg/3JgEf1NhmsUV83aS61fUCRsst7SL8ZoQTeBf+ZF0PQ9SYOYq77hjj1TGJSKUW13AQg4u+alAk4l/9kcoC3hpTdPngce5jDAG7kj9gDnC5TRSrYZzDsvCUuEoA81VrbGIT6e7u9PNuq6+lZCTAic6VtPD+8brxmYdUpWDoKXDAojgVsJA==
X-YMail-OSG: q.vf0b8VM1lsBJ.RR94X1Se6L7EmTGzbxBwpqPdNm6TKyPXQgmkFQMGtW7WankF
 u3lPKmNfD6H0HosYzn9wWSb2nGoQY4mAR1qlO8qZVTh06CmBNszkFH0fPBs0RLLloHWr5FmPo9sm
 hi9uuKcPxd4edy0GAsMCM7wEl94lnhLlXAEZbzBC3MdPWFOGw6srx8GeOe6HM_2rNgxIOyhpmAmV
 NffJrlunD2XwR98IIwcnNW8gghYIr_OhRZ_VHW4_g0tnTpwjK2cibDZgvcFvAyXYDIAPYBPpyTsV
 KVknZRaK04fBJIfnTwbUqCKNLXNcG3.rBaVXWUceEugKojwXkYhKu5E.p8uGGlbv__C6FWpwQjyk
 jgVeHjGn7JghYeebNAmNeiWlkS0bskB0_LLRBF81P6JMR9jSFt2V7KhvV5bOfOLOIBa1RJrSugW6
 5Ykyf5YYBpKv2w0NG7PwqOeFrGjeq4zB5lDlm7GTjEgn3MuzioguVSufCaZOmYtI97Tm99W.nHY.
 IbQdGg0KMLYQwldcWZH3Xe2AbEt9ICzj0lE9dWrLjnpo6V0gZRUbqnlXUKqfbIXN1jPhoW7BKq50
 UiDsjDpfmK9BZ35I9ESiCTy5wQSHy4NiUKnBRi7NGeLE9bJY8CLUR8P2UL6sjcv4mI.2OYGaZwyJ
 jtjph9sIH6H.tpylr8ob0HkxCL3pVJ4xst4pWtoHtglVUkTXCS3n.Jzx5vUDbSNlj3_uTYynH2GS
 EDXLoRvqb7Dwm1N.vaHfLoc.4cCwEUEPV88FjNwNwnk9yo.D_tE_S..rLRvUJKt27ojrT_l59eiS
 DUBnzu35TnhNCba8SEwZL6bxE1P4TK3eItNn30tBjp1BG7DFU8qfK8eJ92Qq8u6aj2qc3qBjtBCL
 JPQ_ymCzwtI8Kq01tGRVOLks2.1pbHz3egs5kZapVzkqECmrxE58L49jCz.JLGky_.xY8Mh35PNU
 ZuGC63M9SMjmMjItxlvyEwdX7RZ7PVyBQWGA4Owmdyn8KXvqZj.3NTuodzFxXXQSIE.4Zfu4KbSw
 15SA3U8XQYENVW8MLUseS9l083L3S8R5a7A9wxl_GW7mCcHN0RooSEPKXxr.tyuGjGs8LqxiTzVR
 Xaq3bqLGhHoDTXZvU9xdLQ6ZDDXyySEWuD8wlEFm5VLhqzkJHZjOS4o6tRXSjk3743SzjEMMmDcJ
 OV9Eyq6ex1NbY6q6lkUUhcq0.PIlxPSmOIMBacguYOacGLA291ya0xUh0q7WnyDqdwcUFYFKmbxW
 fsgw6nLExkMzoFIE0JFWsLr_GmTIqvmh3q9v8iJNcIcxHlS11aqIEGkL4yv.41E.5c1Wo0JvBlst
 78C8lmQUvXfu9CxD.7hO2U98MGciLgABP7RupMquA1mnawMt6sSn0Ix2.ES8DZP64nceUKx1Tk1L
 UqCWeO_2JP3wRKysoC7VlJH_z.pBnVKT8ZFnnullx61cqURM4OyQ_TmIVinok2p66XpTgMS507YP
 ii0cYVNul_McMMK1rmCTP1.MTtHAN4.xIKjpLiDSofvMyKRbXHDzHqGSKmYSzil5YPqoXtivLsxa
 G5.kVCNDeY0OQALUAdYDarYOssb1pUwUpclyxPssm909z4pt60udoitrAQtFpYk.HsIzgjidfhWH
 0MR3fO9j73beh3IzkecPuDL_CtU3SsZfVkEFkx.hQGQcbB4_iEUj_D3CSy3euQ3iMQIg1mWnfGHt
 LgnTEmRUKGvuQhVhQqveF2cZYPuxbACRQEVbru6weX6jfA4MZsBhfsjFc92uvwErA1GktGfEHlrm
 AwHrAagkkZ2o_hSNNJ.c0nY5SKwul9frwed2yBUWfG123davaAUObitwiFBdUaFfo655w5LM6VLS
 nJlqV1E0tdWudAlh8UisfujUX4lYlGrXn3Bfl6YmXZ8yj3Z8RJtI6R23C1zAUtodwtaXgpsdTfC9
 DtvaJP7amUVBWGtbWpV_2NjVCRwXsr9A22e1G7QM.C827fGPUjTs.p9B0TAZdkni3M9SYMt1lO.q
 ZEg0Wf_ZsS03S6Y9UKuuW1UDSFbl4KHW3H6J9AElX.80jSJqVTPSCfjb42eUc62slVkZJwzwdVh6
 TRai60FPeQ7NsmbAFUKrYj1PGxOMp2kCTnlExSpO1rj5nHikD.sD0YL4z_OEcQTnZHfWwf4BDGf1
 MNP6kzLdXatUmWG8cJusyeEy3xO.U8wDn7FxrKdRJ387QsLBWb6bR6Cnf1MCrhyNQ0_BGAqYON_o
 xienan11c4MTZuZ0rYulwE4URjP9mttbcS6pHDhsSHxx_9aXZLJS4G4nMDO2zqSXhkFR52vpPsqL
 tRaJ_fGZQb_eInvUbYafUWQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: bd71f71b-e7b3-40d4-bfd2-70d195e2a4d3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Nov 2026 07:59:47 +0000
Received: by hermes--production-ir2-5dd9bf4598-jgkl4 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8aae2971950a5279db19506ff147a8ad;
          Wed, 18 Nov 2026 07:59:41 +0000 (UTC)
Message-ID: <6e61078d-45a5-4ebf-9dc3-a74b80a637f3@yahoo.com>
Date: Wed, 18 Nov 2026 08:59:38 +0100
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
Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Gustavo Foletto Mora <gusfmora@gmail.com>,
 Linus Walleij <linusw@kernel.org>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk,
 luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
 <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com>
 <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
 <CAK+kzgwVSG4CBv8NQvQaqyr__BZbd860EDfEMoZU5JdFCYhtTw@mail.gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <CAK+kzgwVSG4CBv8NQvQaqyr__BZbd860EDfEMoZU5JdFCYhtTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D

Hi Gustavo,

Thanks for testing v11, and for the detailed report on the vlan_filtering toggle. I will add your Tested-by on 7, 8 and 9 in the next revision, noting for 8 and 9 that it is family D only.

On the 5.4 s per toggle: agreed, scanning all 4095 entries over MDIO is too slow. I plan to track the VIDs that are in use and scan only those in rtl8365mb_d_vlan_4k_refresh_ivl().

I also have a question where your hardware would help. The Sashiko review of v11 12/13 (https://sashiko.dev/#/patchset/cf3fd237-2290-4002-8de0-ea4100ef0f85%40yahoo.com, "Muted" so it did not go to the list) raises the same shared-FID problem you reported earlier. It says:

> Does sharing SVL FID 0 between standalone ports and an offloaded
> VLAN-unaware bridge break DSA standalone port isolation?
> [...]
> Once a MAC is learned or programmed on an offloaded bridge port in
> FID 0, any frame arriving on a standalone or software-bridged port for
> that destination MAC hits the bridge port entry instead of flooding to the
> CPU port, and is dropped by the ingress port's isolation mask.

and suggests a way out:

> Commit "net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D"
> defines a 2-bit FID field (RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK) in the
> family D CVLAN entry and rtl8365mb_d_l2_uc_to_data() already serializes
> uc->key.fid when ivl is false, so could the offloaded bridge be assigned a
> non-zero SVL FID to keep it separate from FID 0 on standalone ports?

I cannot verify this from the vendor API alone. What I would like to know, if you have time to try it on the EX511:

1. With IVL_EN=0 (VLAN-unaware bridge), if the FID field of the bridge VLAN's 4K entry is set to 1 (for example by a temporary hack in rtl8365mb_vlan_4k_port_set()), does the chip learn the bridge hosts with FID 1? A debug print of key.fid in rtl8365mb_d_l2_data_to_uc() on the learned entries should show it.
2. Which VLAN4K entry do the standalone ports classify into with PVID 0? If it is not the same entry, they would stay in FID 0 and the bridge could use another FID. If it is the same entry, the FID cannot separate them.
3. If 1 and 2 work out, do static entries written with key.fid = 1 replace the learned ones?

If you see that the chip does not use the VLAN4K FID for learning, I will keep this as a documented limitation in the commit message, as it is now. If it does, I will look at giving the offloaded bridge its own FID in a follow-up, with FDB/MDB entries for the bridge keyed with that FID and standalone ports left on FID 0.

Thanks,
Mieczyslaw
