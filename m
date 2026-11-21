Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224649;
	b=Q+2xJU2NGAiBR4jUm4tyorXSwkbCbRw1uc/jFBTNKMozO4RwOXHsAa4wYi3epC3vjpMy
	 V13F4H4tzD4MzbHVNJ9cpQ3AH63oouLR9QgEYikOmETol7ooNq8GIvoa/g44I97I34ThG
	 dgGOy+cWJ02Oo3GYxm6A5dXpZNIk/E3AXGzOeC3vqjoJngOuwnMM3O5MSjINwx1k8SN52
	 PR4spHKL+3h7L6jZZcHHiGXM+KILbC7A/hZ3LLnPyOuHpz5Q2bdX7ycbKkqLnyvxO8z8u
	 eyqNkyxFVs17K0Fyu48agUqdrpjZ6WkDIn205uMVvVWxe00e3w/H5gQWnDOPymf29/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224649;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=H/fLUQKykp6YAzdbOaoQGF/zziiwf0Sk4tyD5JxGkxk=;
	b=KZbcGzXNjWCzi4BDlQMWp6hFUX1wBE2yY0JtMAl9rL66agfI6S1Kuot4dmPT+WrJmWeW
	 prPxNgB0WQ9yhWUo975zjByzSkXtJg6o1QnIQyWT4kYMmLwdv2EoJYcIA67wa5xL7mqum
	 NoFs8vSgT8OzYqfXdWzKEMW7djfaPVOz53F9+bsupEzX9OmGAsNvAgkvz+MZfJnuAoOI8
	 WqTXjk5X3Jhl7SDJiECEQNiGkTLgM/g8WEPUHFShCF6jK0BiLv8ZfebNyI+Fh0+7tbDet
	 LrLWiV0AuAK1BwPwyqJRl1L3xqv6VtY/FOx45ynJXDmvyY1UHIrf8hYCGhk62o8FuEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=tHxybafh;
	arc=none smtp.remote-ip=66.163.188.206
Received: from sonic311-25.consmr.mail.ne1.yahoo.com (sonic311-25.consmr.mail.ne1.yahoo.com [66.163.188.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C6606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=tHxybafh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795224646; bh=H/fLUQKykp6YAzdbOaoQGF/zziiwf0Sk4tyD5JxGkxk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=tHxybafhIQIrhdAo8wTY0Jft+CO5OOi5NLEy4U+2yOTH9Paq/f7YmNUg+ghdlUcKzA3NdqPBnOXDnuUv+WqIe4QYEiAiTGPLssfTZtKj52WuVwWSKiPmOv8z978RgmYr3p7nD0ArAN3zD8J7JzAQEBEacUXDegyUMicVei81meq+1f0eaLn9/rYV3f1+fD/dBTFP/uo0Pe6F7TV4DniyF4cerXqHtwBKKcLkQLwOCuKLW/4+DadyZFJnd+Rqpi5sqp55qAv12wsZkG8VWE/V8gTOdA6/XImAzuYll3O+l5rB/wuD5eXOXME8Ve+v3+KQCciMhAmTAux14mLjoECzUQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795224646; bh=ljt/M88KQtFRzXGhovpW6PD4kSRjq3i8zndoEm+mLWF=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=tIbTuH8HyZzI6heD2DyAhy4rcD+Ko2N2c5E1uScF3oLNRDLOx4uxlY3isHqgSlvAd45c5mjnUppvfN07x46KwjqXXq06+J+WyU39M+eCgjXxh4CwSj3KuSiEXPhSnSMi/WF1bR4B51ivmIx0gTi65lbd/ukHgUSqx6Dg/gganpLG6Bsj8gNJ6riSmTOFbvPXdcidWXn6fg760iHMc0oyKXyPiM+q3d1vQK/vxEWEwWVrnUZjTIFjXi1hSK9oPhauiXnvaSGNtL5mUtLxOdFlh1ZdwXkviAW77R0FrSSfY5nNbvVSeFiAdCpMYNbxsCjYsA6g0hh5HbXX8Kk+fbQ9OA==
X-YMail-OSG: N7JXhWUVM1lNKCNkbb5g1WqfC4LFa_BX.vhcdnfL4HGXsdi0HKLnK.dIBpilzF.
 38HKoho1h.cgGboJzVbsle0YWLwLdiyRj.lKld20nW6X3EHjdzWWj3yh3ugkularqAN8oeNaHE28
 jS4UwxMZC4LR5ZAy9BYtburtDnl89oJfUQ7F.Qbrpz60QAbF8ydoAGsgQ_Swi2LtRgu0iqjbW6_B
 ufvzijfAksc2lIUOHzrtAZ2xT7HZSHt0y0qkGU.iDj5HMm91tFXnJoXu8dsHIxLqQIJxSZEG_7y5
 PUux_3NVSqK1iQKdyTxH9BG0iRsF43C4Tq2puj2FJWYEKJhfStRG6No0A8Ki2XfJKIZTk06.857t
 noNk35R7LI10kaOWw0PKiBMDdjld4mS3ytW51.4XxnbuKiKuZxT9C2mSPp3ipu0yul19ReMu3OrJ
 Sme2LKgMtXpTzjW.EXXxMzQRJ2pVnkU64Y8AyBmKqz2wMOlkFSX1pdA2ymDQKEBWJuBpg_Vq7ZME
 _fP0wGPMpmSL6I.BtN8WOfij4uTdzVxFRz.6Ih_F5lA.FvqhvVvZyFosFaJq6nTioLvl4rLcnhIC
 i8eauSbIpVjngPAVgR04BXPuR1Tg4esHva3I101TQO..4BhugTIoNU7iSlTh7ZK.4P4ZoqAyDiN5
 J2KFWNemC6iyxMqdHNNb9imJxEPuW56Vc870.r1kV0.9q6Fblosqf7KuNta0ORvVRMNZ3HitEm4x
 8_k130zX1dnzXOwdeuNLmBFJzQcC9sbG5tXDna.wKxhkcv0xfCec.p2WVMgarzqL3ZX0_hmflKY9
 ozi7IBRckBKjE1CYhJA0hJ_CzVPM5YCkzuDsAayZN38HDCwHpi.G7cMZofxSR7legEw8vMOAI7EL
 gw6r9EaaQZiHeFzqPKaYC.4G5fmhYhvhKHlCxTpsXYFbjZWEjTqKzyT_gvb2sdClUpm7z3sEG9Gp
 MLXYIUAK2GKerJlr_c8pwG9kCIOQ4fW8d_xo2_JixWeo2mAKSp36HJrXEUrMSiYD7KRFwf2TYhv7
 WyG9sU.k2du_Whh.O2KGtU.v6Ri3ZPNPUbZe3v7GbS7qKjQLAs0eo4zTkfBKw2yGbLr8NumSJKKK
 yGnToeh.FA7__5KVMUV7J2s.cPiJ53_oxywxkSzRq41jUcG0T1bsaO9.xDrwaNCsCelipKAyng1C
 Flrkbn3d2D1OAxcoAhREFf6N9siKs41KKfWKWEa5BZz6ZQe8PiLMxTi3SqnDvmPas0NTuKetKkQ3
 MJmq25UWfr9L7utQhOkQ5ht_ujLBKUvTlTarQnZF_.cUioblI0D.Bbp5JvrDNtYe5vJnmzQroemw
 pog1RoZJBR2ie4SENmTuRvNdZVtOmtTPV4516GFb5Qi1uCuPIr5.YKb9tDq0zSNcpdzPrV9R6GzT
 FQ.cBx6.gxx6LdsJnaGdLbvJ39TvuiMfz23EPWDzAGgigON7KiCF7k8tzUZxzGIrD5Txjdh3723d
 NnU98kBuToXifYBup3zjrtvgnztQnFc1MNK6YbL1goLXwMh_ginv73SQZ2YEPiLvVoM4oj3BhGVZ
 1U59rFM..gzbIj_.KoWFDzw1Qw8KsbGrfEl.1yZZN9bFpn2zkHDHG4ijw963jQnWitY1GX4MdnlD
 GMlulxL5CFrZMgw9qkVb0xN.Eb_z5hPHLcNvxCyiy4cJDV_d7rerh34_ZTcz5CToSTnqXiOeRTfC
 hasCSDgzcSqxAls.lJLqg2FdSiQsEOsfwS_ZtWx0YOSI6NNLDCzXrSSXnoE0VwxALPpHPlxAxNOl
 DIeOOBvzaxdm7MuEQPXfyj.hwfFacctkMaKpV41z8_VoC8QivyU5BwfszwTYMBnh5PkWav5_Kxoe
 1RMu4dfo60rDgWnMeJDIBjG8XWgdICD2u32o.EBNlpLdWC57OGVv9GHBKTItGfpZVR6SmNGQrc33
 n_X1t5Pb5fzv3M6celi1jsTZ9lqz8eRn3rdD_zjyReiQG4GZXULaK07KFmQKGe0XoeHLFVdrdPMw
 5GabkYUN32cu.twkGFJ5TcL1Eh3hwyQ3bRaSl_pDV5EvRc_UF_wGBfsGQScwAOFQRObeAxkpvLok
 byNJrzfr_zk0i4fUtfo5EKT00H_LxziTI6fs9jJ16iDFRZkjT.UuYhfGFD3JJasTesPImnqxmFxn
 ZHksMEfiQh44l1cmatnjDpu_d_doURuo3NC9lVnHz0mdGmidVCTv684Nnu7kTvxFr5EthtVYm2mN
 F6i9mgOSDXeebLtDkdHDjC5gQWIhyUdqiJ5KqrR10YXLApxydOui7gKAl59EB7vls1nDENotfgqP
 o.xrgwgZTQZ25WgYEFgWNE9scNd27LWS4oxbRg710MG4uy51MMA--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 66f33bfb-bf22-4d06-a6b6-17825bfa4f41
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Sat, 21 Nov 2026 01:30:46 +0000
Received: by hermes--production-ir2-7c4859dc89-fxzr8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 74bbb69c767389f35a7e2c472ff01c44;
          Sat, 21 Nov 2026 01:30:44 +0000 (UTC)
Message-ID: <b4f49c01-467b-4c16-bc47-b0f08ab48bce@yahoo.com>
Date: Sat, 21 Nov 2026 02:30:41 +0100
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
Subject: Re: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Gustavo Foletto Mora <gusfmora@gmail.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com,
 gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
 <CAK+kzgycrbHcEpXZhLTPXdWtCUh+WwoBA0mC7CaS2HO7nM81vQ@mail.gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <CAK+kzgycrbHcEpXZhLTPXdWtCUh+WwoBA0mC7CaS2HO7nM81vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 20/11/2026 Gustavo Foletto Mora wrote:
> - Live vlan_filtering toggle on a bridge with a VLAN in use: IVL/SVL
>   changes at once in both directions. [...] Each toggle that flips the
>   switch-wide state took 20 to 30 ms.
> - The rollback added in v12 is an error path I could not provoke here.
>
> The rest of the series passes my regression test on this board as with
> v11: [...]
>
> Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Hi Gustavo,

Thank you for testing again, and for the timings.

In v13 I changed one thing in this patch after the automated review
(Sashiko) of v12: an entry that loses its last member could stay in
hardware with IVL_EN=1. rtl8365mb_vlan_4k_port_set() cleared its bit
in vlan_4k_used, so rtl8365mb_d_vlan_4k_refresh_ivl() never visited it
again, and after filtering was switched off, frames with that VID
would still have been looked up with IVL instead of SVL (FID 0).

On family D the emptied entry is now written back with IVL_EN cleared,
as in its reset state:

	vlan4k.ivl_en = vlan4k.member &&
			rtl8365mb_d_want_ivl(ds, -1, false);

The commit message and the comment in the code say so. Family C is
unchanged.

This path is only reached when the last port leaves a VLAN while
filtering is on (e.g. a port leaving a VLAN-aware bridge), which the
toggle test does not exercise, so I kept your Tested-by but would be
glad if you could re-run that case.

Best regards,
Mieczyslaw
